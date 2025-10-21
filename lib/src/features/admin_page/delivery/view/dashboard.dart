import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:logistics_website/src/features/admin_page/delivery/model/delivery_model.dart';
import 'package:logistics_website/src/features/admin_page/delivery/view_model/deliveries_viewmodel.dart';

class DashboardPage extends ConsumerStatefulWidget {
  const DashboardPage({super.key});

  @override
  ConsumerState<DashboardPage> createState() => _DashboardPageState();
}

class _DashboardPageState extends ConsumerState<DashboardPage> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ref.read(deliveryProvider.notifier).fetchDeliveries();
    });
  }

  /// ✅ Confirm delete dialog
  void _confirmDelete(BuildContext context, String trackingNumber) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text("Delete Delivery"),
        content: const Text("Are you sure you want to delete this delivery?"),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text("Cancel"),
          ),
          TextButton(
            onPressed: () async {
              Navigator.pop(context);
              final success = await ref
                  .read(deliveryProvider.notifier)
                  .deleteDelivery(trackingNumber);
              if (!success && context.mounted) {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text("Failed to delete delivery")),
                );
              }
            },
            child: const Text("Delete", style: TextStyle(color: Colors.red)),
          ),
        ],
      ),
    );
  }

  /// ✅ Edit delivery status dialog
  void _showEditStatusDialog(BuildContext context, DeliveryModel delivery) {
    final statuses = ["Pending", "In-Transit", "Delivered", "Cancelled"];
    String selectedStatus = delivery.status;

    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text("Update Status - ${delivery.trackingNumber}"),
        content: StatefulBuilder(
          builder: (context, setState) => DropdownButtonFormField<String>(
            value: selectedStatus,
            items: statuses
                .map((s) => DropdownMenuItem(value: s, child: Text(s)))
                .toList(),
            onChanged: (v) => setState(() => selectedStatus = v!),
            decoration: const InputDecoration(labelText: "Select new status"),
          ),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text("Cancel"),
          ),
          ElevatedButton(
            onPressed: () async {
              final success = await ref
                  .read(deliveryProvider.notifier)
                  .updateDelivery(delivery.trackingNumber, {
                    'status': selectedStatus,
                  });

              if (context.mounted) {
                Navigator.pop(context);
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text(
                      success
                          ? "Delivery updated successfully"
                          : "Failed to update delivery",
                    ),
                  ),
                );
              }
            },
            child: const Text("Save"),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final deliveries = ref.watch(deliveryProvider);

    return Scaffold(
      appBar: AppBar(title: const Text("Admin Dashboard"), centerTitle: true),
      body: RefreshIndicator(
        onRefresh: () async =>
            ref.read(deliveryProvider.notifier).fetchDeliveries(),
        child: deliveries.isEmpty
            ? const Center(child: Text("No deliveries found."))
            : SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: DataTable(
                  headingRowColor: WidgetStateProperty.all(Colors.blue.shade50),
                  border: TableBorder.all(color: Colors.grey.shade300),
                  columns: const [
                    DataColumn(label: Text("Sender")),
                    DataColumn(label: Text("Receiver")),
                    DataColumn(label: Text("Tracking #")),
                    DataColumn(label: Text("Status")),
                    DataColumn(label: Text("Destination")),
                    DataColumn(label: Text("Actions")),
                  ],
                  rows: deliveries.map((delivery) {
                    return DataRow(
                      cells: [
                        DataCell(Text(delivery.senderName)),
                        DataCell(Text(delivery.receiverName)),
                        DataCell(Text(delivery.trackingNumber)),
                        DataCell(_statusChip(delivery.status)),
                        DataCell(Text(delivery.destination)),
                        DataCell(
                          Row(
                            children: [
                              IconButton(
                                icon: const Icon(
                                  Icons.edit,
                                  color: Colors.blue,
                                ),
                                tooltip: "Edit Status",
                                onPressed: () =>
                                    _showEditStatusDialog(context, delivery),
                              ),
                              IconButton(
                                icon: const Icon(
                                  Icons.delete,
                                  color: Colors.red,
                                ),
                                tooltip: "Delete Delivery",
                                onPressed: () => _confirmDelete(
                                  context,
                                  delivery.trackingNumber,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    );
                  }).toList(),
                ),
              ),
      ),
    );
  }

  static Widget _statusChip(String status) {
    final color = switch (status) {
      "Pending" => Colors.orange,
      "In-Transit" => Colors.blue,
      "Delivered" => Colors.green,
      "Cancelled" => Colors.red,
      _ => Colors.grey,
    };
    return Chip(
      label: Text(status, style: const TextStyle(color: Colors.white)),
      backgroundColor: color,
    );
  }
}
