// import 'package:flutter/material.dart';

// class DashboardPage extends StatelessWidget {
//   const DashboardPage({super.key});

//   @override
//   Widget build(BuildContext context) {
//     final users = [
//       {
//         "name": "John Doe",
//         "tracking": "TRK12345",
//         "status": "Pending",
//         "date": "2025-09-01",
//       },
//       {
//         "name": "Alice Smith",
//         "tracking": "TRK98765",
//         "status": "In-Transit",
//         "date": "2025-09-10",
//       },
//       {
//         "name": "Michael Lee",
//         "tracking": "TRK54321",
//         "status": "Delivered",
//         "date": "2025-09-15",
//       },
//       {
//         "name": "Sarah Johnson",
//         "tracking": "TRK67890",
//         "status": "Cancelled",
//         "date": "2025-09-20",
//       },
//     ];

//     final screenWidth = MediaQuery.of(context).size.width;

//     return Padding(
//       padding: const EdgeInsets.all(16),
//       child: Center(
//         child: Container(
//           width: screenWidth > 1000 ? 1000 : double.infinity,
//           decoration: BoxDecoration(
//             color: Colors.white,
//             borderRadius: BorderRadius.circular(12),
//             boxShadow: [
//               BoxShadow(
//                 color: Colors.black.withOpacity(0.05),
//                 blurRadius: 10,
//                 offset: const Offset(0, 4),
//               ),
//             ],
//           ),
//           child: SingleChildScrollView(
//             scrollDirection: Axis.horizontal,
//             child: DataTable(
//               headingRowColor: WidgetStateProperty.all(Colors.blue.shade50),
//               border: TableBorder.all(color: Colors.grey.shade300),
//               columns: const [
//                 DataColumn(label: Text("User Name")),
//                 DataColumn(label: Text("Tracking Number")),
//                 DataColumn(label: Text("Status")),
//                 DataColumn(label: Text("Date Added")),
//                 DataColumn(label: Text("Actions")),
//               ],
//               rows: users.map((user) {
//                 return DataRow(
//                   cells: [
//                     DataCell(Text(user["name"]!)),
//                     DataCell(Text(user["tracking"]!)),
//                     DataCell(_statusChip(user["status"]!)),
//                     DataCell(Text(user["date"]!)),
//                     DataCell(
//                       Row(
//                         children: [
//                           IconButton(
//                             icon: const Icon(Icons.edit, color: Colors.blue),
//                             tooltip: "Edit",
//                             onPressed: () {},
//                           ),
//                           IconButton(
//                             icon: const Icon(Icons.delete, color: Colors.red),
//                             tooltip: "Delete",
//                             onPressed: () {},
//                           ),
//                           IconButton(
//                             icon: const Icon(Icons.info, color: Colors.orange),
//                             tooltip: "View Details",
//                             onPressed: () {
//                               _showUserDetails(context, user);
//                             },
//                           ),
//                           IconButton(
//                             icon: const Icon(
//                               Icons.history,
//                               color: Colors.green,
//                             ),
//                             tooltip: "View Updates",
//                             onPressed: () {
//                               _showUserHistory(context, user);
//                             },
//                           ),
//                         ],
//                       ),
//                     ),
//                   ],
//                 );
//               }).toList(),
//             ),
//           ),
//         ),
//       ),
//     );
//   }

//   static Widget _statusChip(String status) {
//     Color color;
//     switch (status) {
//       case "Pending":
//         color = Colors.orange;
//         break;
//       case "In-Transit":
//         color = Colors.blue;
//         break;
//       case "Delivered":
//         color = Colors.green;
//         break;
//       case "Cancelled":
//         color = Colors.red;
//         break;
//       default:
//         color = Colors.grey;
//     }
//     return Chip(
//       label: Text(status, style: const TextStyle(color: Colors.white)),
//       backgroundColor: color,
//     );
//   }

//   static void _showUserDetails(BuildContext context, Map<String, String> user) {
//     showDialog(
//       context: context,
//       builder: (_) => AlertDialog(
//         title: const Text("User Details"),
//         content: Column(
//           mainAxisSize: MainAxisSize.min,
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Text("Name: ${user['name']}"),
//             Text("Tracking #: ${user['tracking']}"),
//             Text("Status: ${user['status']}"),
//             Text("Date Added: ${user['date']}"),
//           ],
//         ),
//         actions: [
//           TextButton(
//             onPressed: () => Navigator.pop(context),
//             child: const Text("Close"),
//           ),
//         ],
//       ),
//     );
//   }

//   static void _showUserHistory(BuildContext context, Map<String, String> user) {
//     final history = [
//       {"date": "2025-09-01", "event": "Package Registered"},
//       {"date": "2025-09-03", "event": "Picked up by courier"},
//       {"date": "2025-09-05", "event": "In-Transit"},
//       {"date": "2025-09-10", "event": "Out for Delivery"},
//       {"date": "2025-09-12", "event": "Delivered"},
//     ];

//     showDialog(
//       context: context,
//       builder: (_) => AlertDialog(
//         title: Text("History for ${user['tracking']}"),
//         content: SizedBox(
//           width: 300,
//           child: ListView.builder(
//             shrinkWrap: true,
//             itemCount: history.length,
//             itemBuilder: (_, i) {
//               return ListTile(
//                 leading: const Icon(Icons.timeline, color: Colors.blue),
//                 title: Text(history[i]["event"]!),
//                 subtitle: Text(history[i]["date"]!),
//               );
//             },
//           ),
//         ),
//         actions: [
//           TextButton(
//             onPressed: () => Navigator.pop(context),
//             child: const Text("Close"),
//           ),
//         ],
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:logistics_website/src/features/admin_page/deliveries/view_model/deliveries_viewmodel.dart';
import 'package:logistics_website/src/service/deliveries_service.dart';

class DashboardPage extends ConsumerWidget {
  const DashboardPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final deliveriesAsync = ref.watch(deliveryListProvider);

    return Scaffold(
      appBar: AppBar(title: const Text("Admin Dashboard"), centerTitle: true),
      body: deliveriesAsync.when(
        data: (deliveries) {
          if (deliveries.isEmpty) {
            return const Center(child: Text("No deliveries found."));
          }

          final screenWidth = MediaQuery.of(context).size.width;

          return Padding(
            padding: const EdgeInsets.all(16),
            child: Center(
              child: Container(
                width: screenWidth > 1000 ? 1000 : double.infinity,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.05),
                      blurRadius: 10,
                      offset: const Offset(0, 4),
                    ),
                  ],
                ),
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: DataTable(
                    headingRowColor: WidgetStateProperty.all(
                      Colors.blue.shade50,
                    ),
                    border: TableBorder.all(color: Colors.grey.shade300),
                    columns: const [
                      DataColumn(label: Text("User Name")),
                      DataColumn(label: Text("Tracking Number")),
                      DataColumn(label: Text("Status")),
                      DataColumn(label: Text("Date Added")),
                      DataColumn(label: Text("Actions")),
                    ],
                    rows: deliveries.map((delivery) {
                      return DataRow(
                        cells: [
                          DataCell(Text(delivery["name"] ?? "N/A")),
                          DataCell(Text(delivery["tracking_number"] ?? "N/A")),
                          DataCell(
                            _statusChip(delivery["status"] ?? "Pending"),
                          ),
                          DataCell(Text(delivery["date"] ?? "N/A")),
                          DataCell(
                            Row(
                              children: [
                                IconButton(
                                  icon: const Icon(
                                    Icons.edit,
                                    color: Colors.blue,
                                  ),
                                  tooltip: "Edit Status",
                                  onPressed: () {
                                    _showEditStatusDialog(
                                      context,
                                      delivery["tracking_number"],
                                      delivery["status"],
                                    );
                                  },
                                ),
                                IconButton(
                                  icon: const Icon(
                                    Icons.delete,
                                    color: Colors.red,
                                  ),
                                  tooltip: "Delete",
                                  onPressed: () {},
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
            ),
          );
        },
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (err, _) => Center(child: Text("Error: $err")),
      ),
    );
  }

  static Widget _statusChip(String status) {
    Color color;
    switch (status) {
      case "Pending":
        color = Colors.orange;
        break;
      case "In-Transit":
        color = Colors.blue;
        break;
      case "Delivered":
        color = Colors.green;
        break;
      case "Cancelled":
        color = Colors.red;
        break;
      default:
        color = Colors.grey;
    }
    return Chip(
      label: Text(status, style: const TextStyle(color: Colors.white)),
      backgroundColor: color,
    );
  }

  static void _showEditStatusDialog(
    BuildContext context,
    String trackingNumber,
    String currentStatus,
  ) {
    final statuses = ["Pending", "In-Transit", "Delivered", "Cancelled"];
    String selectedStatus = currentStatus;

    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text("Update Status - $trackingNumber"),
          content: DropdownButtonFormField<String>(
            value: selectedStatus,
            items: statuses
                .map(
                  (status) =>
                      DropdownMenuItem(value: status, child: Text(status)),
                )
                .toList(),
            onChanged: (value) {
              selectedStatus = value!;
            },
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text("Cancel"),
            ),
            ElevatedButton(
              onPressed: () async {
                final service = DeliveryService();
                await service.updateDelivery(trackingNumber, {
                  "status": selectedStatus,
                });
                if (context.mounted) Navigator.pop(context);
              },
              child: const Text("Save"),
            ),
          ],
        );
      },
    );
  }
}
