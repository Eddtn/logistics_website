// TRK-1761095332206
// src/features/trackingPage/view/tracking_detail_page.dart
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:logistics_website/src/features/trackingPage/view_model/tracking_viewmodel.dart';
import 'package:logistics_website/src/features/trackingPage/model/tracking_model.dart';
import 'package:printing/printing.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:supabase_flutter/supabase_flutter.dart';

class TrackingDetailPage extends ConsumerStatefulWidget {
  final String tracking_number;

  const TrackingDetailPage({super.key, required this.tracking_number});

  @override
  ConsumerState<TrackingDetailPage> createState() => _TrackingDetailPageState();
}

class _TrackingDetailPageState extends ConsumerState<TrackingDetailPage> {
  late final String _trackingNumber;

  @override
  void initState() {
    super.initState();
    _trackingNumber = widget.tracking_number;
  }

  Future<void> _refresh() async {
    await ref.read(trackingProvider(_trackingNumber).notifier).refresh();
  }

  @override
  Widget build(BuildContext context) {
    final trackingAsync = ref.watch(trackingProvider(_trackingNumber));
    // final trackingAsync = ref.watch(trackingProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text("Tracking Details"),
        backgroundColor: Colors.blueAccent,
        foregroundColor: Colors.white,
      ),
      body: RefreshIndicator(
        onRefresh: _refresh,
        child: trackingAsync.when(
          loading: () => const Center(child: CircularProgressIndicator()),
          error: (err, _) => Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Icon(Icons.error, size: 48, color: Colors.red),
                const SizedBox(height: 16),
                Text("Error: $err"),
                const SizedBox(height: 16),
                ElevatedButton(onPressed: _refresh, child: const Text("Retry")),
              ],
            ),
          ),
          data: (tracking) {
            if (tracking == null) {
              return const Center(
                child: Text(
                  "No delivery found.",
                  style: TextStyle(fontSize: 16),
                ),
              );
            }
            return _buildSuccess(tracking); // Now works!
          },
        ),
      ),
    );
  }

  Widget _buildSuccess(TrackingModel tracking) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _headerCard(tracking),
          const SizedBox(height: 20),
          // _trackingTimeline(tracking),
          // const SizedBox(height: 20),
          _packageSummary(tracking),
          const SizedBox(height: 20),
          _deliveryInfo(tracking),
          const SizedBox(height: 20),
          _downloadReceiptButton(tracking),
        ],
      ),
    );
  }

  // ──────────────────────────────
  // UI WIDGETS
  // ──────────────────────────────

  // In tracking_detail_page.dart
  // Widget _trackingTimeline(TrackingModel t) => Card(
  //   shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
  //   elevation: 4,
  //   child: Padding(
  //     padding: const EdgeInsets.all(16),
  //     child: Column(
  //       crossAxisAlignment: CrossAxisAlignment.start,
  //       children: [
  //         const Text(
  //           "Tracking History",
  //           style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
  //         ),
  //         const Divider(),
  //         ...t.status_history.asMap().entries.map((entry) {
  //           final index = entry.key;
  //           final update = entry.value;
  //           final isLast = index == t.status_history.length - 1;
  //           final isCurrent =
  //               update.status.toLowerCase() == t.status.toLowerCase();

  //           return Row(
  //             crossAxisAlignment: CrossAxisAlignment.start,
  //             children: [
  //               // Timeline Dot + Line
  //               Column(
  //                 children: [
  //                   Container(
  //                     width: 14,
  //                     height: 14,
  //                     decoration: BoxDecoration(
  //                       color: isCurrent ? Colors.blueAccent : Colors.green,
  //                       shape: BoxShape.circle,
  //                       border: Border.all(color: Colors.white, width: 2),
  //                       boxShadow: [
  //                         BoxShadow(
  //                           color: Colors.black12,
  //                           blurRadius: 4,
  //                           offset: Offset(0, 2),
  //                         ),
  //                       ],
  //                     ),
  //                   ),
  //                   if (!isLast)
  //                     Container(width: 2, height: 60, color: Colors.grey[300]),
  //                 ],
  //               ),
  //               const SizedBox(width: 12),
  //               // Content
  //               Expanded(
  //                 child: Padding(
  //                   padding: const EdgeInsets.only(bottom: 24),
  //                   child: Column(
  //                     crossAxisAlignment: CrossAxisAlignment.start,
  //                     children: [
  //                       Text(
  //                         update.status,
  //                         style: TextStyle(
  //                           fontWeight: isCurrent
  //                               ? FontWeight.bold
  //                               : FontWeight.w500,
  //                           color: isCurrent
  //                               ? Colors.blueAccent
  //                               : Colors.black87,
  //                           fontSize: 15,
  //                         ),
  //                       ),
  //                       const SizedBox(height: 4),
  //                       Text(
  //                         update.location,
  //                         style: TextStyle(
  //                           color: Colors.grey[600],
  //                           fontSize: 13,
  //                         ),
  //                       ),
  //                       if (update.notes != null)
  //                         Padding(
  //                           padding: const EdgeInsets.only(top: 4),
  //                           child: Text(
  //                             update.notes!,
  //                             style: TextStyle(
  //                               color: Colors.grey[500],
  //                               fontStyle: FontStyle.italic,
  //                             ),
  //                           ),
  //                         ),
  //                       const SizedBox(height: 4),
  //                       Text(
  //                         _formatDate(update.timestamp),
  //                         style: TextStyle(
  //                           color: Colors.grey[500],
  //                           fontSize: 12,
  //                         ),
  //                       ),
  //                     ],
  //                   ),
  //                 ),
  //               ),
  //             ],
  //           );
  //         }).toList(),
  //       ],
  //     ),
  //   ),
  // );

  // Helper
  String _formatDate(DateTime date) {
    final now = DateTime.now();
    final diff = now.difference(date);
    if (diff.inDays > 0) return '${diff.inDays}d ago';
    if (diff.inHours > 0) return '${diff.inHours}h ago';
    if (diff.inMinutes > 0) return '${diff.inMinutes}m ago';
    return 'Just now';
  }

  Widget _headerCard(TrackingModel t) => Card(
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
    elevation: 4,
    child: Padding(
      padding: const EdgeInsets.all(16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            "Tracking No: ${t.tracking_number}",
            style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          Chip(
            label: Text(t.status, style: const TextStyle(color: Colors.white)),
            backgroundColor: _statusColor(t.status),
          ),
        ],
      ),
    ),
  );

  Widget _packageSummary(TrackingModel t) => Card(
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
    elevation: 4,
    child: Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "Package Summary",
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
          const Divider(),
          ListTile(
            leading: const Icon(Icons.person),
            title: Text("Sender: ${t.sender_name}"),
            subtitle: Text(t.dispatch_location),
          ),
          ListTile(
            leading: const Icon(Icons.location_on),
            title: Text("Receiver: ${t.receiver_name}"),
            subtitle: Text(t.destination),
          ),
          ListTile(
            leading: const Icon(Icons.inventory),
            title: Text("Shipment: ${t.shipment}"),
            subtitle: Text("Qty: ${t.quantity}"),
          ),
        ],
      ),
    ),
  );

  Widget _deliveryInfo(TrackingModel t) => Card(
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
    elevation: 4,
    child: Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "Delivery Info",
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
          const Divider(),
          ListTile(
            leading: const Icon(Icons.payments),
            title: Text("Amount Due: ₦${t.amount_due}"),
            subtitle: Text("Mode: ${t.payment_mode}"),
          ),
          ListTile(
            leading: const Icon(Icons.schedule),
            title: Text("Delivery Time: ${t.delivery_time}"),
            subtitle: Text("Est: ${t.estimated_delivery}"),
          ),
          ListTile(
            leading: const Icon(Icons.description),
            title: const Text("Dispatch Details"),
            subtitle: Text(t.dispatch_details),
          ),
        ],
      ),
    ),
  );

  Widget _downloadReceiptButton(TrackingModel t) {
    return Center(
      child: ElevatedButton.icon(
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.blueAccent,
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 14),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
        ),
        icon: const Icon(Icons.download, color: Colors.white),
        label: const Text(
          "Download Receipt",
          style: TextStyle(color: Colors.white),
        ),
        onPressed: () => _generateAndPrintPdf(t),
      ),
    );
  }

  Future<void> _generateAndPrintPdf(TrackingModel t) async {
    final pdf = pw.Document();

    pdf.addPage(
      pw.Page(
        build: (_) => pw.Column(
          crossAxisAlignment: pw.CrossAxisAlignment.start,
          children: [
            pw.Text(
              "Tracking: ${t.tracking_number}",
              style: const pw.TextStyle(fontSize: 16),
            ),
            pw.Text(
              "Status: ${t.status}",
              style: const pw.TextStyle(fontSize: 14),
            ),
            pw.Text(
              "Sender: ${t.sender_name}",
              style: const pw.TextStyle(fontSize: 14),
            ),
            pw.Text(
              "Receiver: ${t.receiver_name}",
              style: const pw.TextStyle(fontSize: 14),
            ),
            pw.Text(
              "Amount: ₦${t.amount_due}",
              style: const pw.TextStyle(fontSize: 14),
            ),
            pw.Text(
              "Est Delivery: ${t.estimated_delivery}",
              style: const pw.TextStyle(fontSize: 14),
            ),
          ],
        ),
      ),
    );

    try {
      await Printing.layoutPdf(onLayout: (_) => pdf.save());
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text("Receipt opened for printing/download")),
        );
      }
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(SnackBar(content: Text("Failed to generate PDF: $e")));
      }
    }
  }

  Color _statusColor(String status) {
    return switch (status.toLowerCase()) {
      "delivered" => Colors.green,
      "in transit" => Colors.orange,
      "dispatched" => Colors.blue,
      _ => Colors.grey,
    };
  }
}
