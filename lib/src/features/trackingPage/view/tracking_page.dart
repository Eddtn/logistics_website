// import 'package:flutter/material.dart';
// import 'package:printing/printing.dart';
// import 'package:pdf/pdf.dart';
// import 'package:pdf/widgets.dart' as pw;

// class TrackingDetailsPage extends StatelessWidget {
//   final String trackingId;
//   final String trackingNumber;

//   const TrackingDetailsPage({
//     super.key,
//     required this.trackingId,
//     required this.trackingNumber,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text("Tracking Details"),
//         backgroundColor: Colors.blueAccent,
//       ),
//       body: SingleChildScrollView(
//         padding: const EdgeInsets.all(16),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             // 🔹 Tracking Header
//             Card(
//               shape: RoundedRectangleBorder(
//                 borderRadius: BorderRadius.circular(16),
//               ),
//               elevation: 4,
//               child: Padding(
//                 padding: const EdgeInsets.all(16),
//                 child: Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                   children: [
//                     Text(
//                       "Tracking ID: $trackingId",
//                       style: const TextStyle(
//                         fontSize: 18,
//                         fontWeight: FontWeight.bold,
//                       ),
//                     ),
//                     Chip(
//                       label: const Text(
//                         "In Transit",
//                         style: TextStyle(color: Colors.white),
//                       ),
//                       backgroundColor: Colors.orange,
//                     ),
//                   ],
//                 ),
//               ),
//             ),
//             const SizedBox(height: 20),

//             // 🔹 Package Summary
//             Card(
//               shape: RoundedRectangleBorder(
//                 borderRadius: BorderRadius.circular(16),
//               ),
//               elevation: 4,
//               child: Padding(
//                 padding: const EdgeInsets.all(16),
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: const [
//                     Text(
//                       "Package Summary",
//                       style: TextStyle(
//                         fontSize: 16,
//                         fontWeight: FontWeight.bold,
//                       ),
//                     ),
//                     Divider(),
//                     ListTile(
//                       leading: Icon(Icons.person),
//                       title: Text("Sender: John Doe"),
//                       subtitle: Text("Lagos, Nigeria"),
//                     ),
//                     ListTile(
//                       leading: Icon(Icons.location_on),
//                       title: Text("Receiver: Alice Smith"),
//                       subtitle: Text("Abuja, Nigeria"),
//                     ),
//                     ListTile(
//                       leading: Icon(Icons.inventory),
//                       title: Text("Package: Electronics"),
//                       subtitle: Text("Quantity: 2, Weight: 5kg"),
//                     ),
//                     ListTile(
//                       leading: Icon(Icons.payment),
//                       title: Text("Payment Status: Amount Due"),
//                       subtitle: Text("₦15,000 - Cash on Delivery"),
//                     ),
//                   ],
//                 ),
//               ),
//             ),
//             const SizedBox(height: 20),

//             // 🔹 Horizontal Progress Bar
//             Card(
//               shape: RoundedRectangleBorder(
//                 borderRadius: BorderRadius.circular(16),
//               ),
//               elevation: 4,
//               child: Padding(
//                 padding: const EdgeInsets.all(16),
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     const Text(
//                       "Delivery Progress",
//                       style: TextStyle(
//                         fontSize: 16,
//                         fontWeight: FontWeight.bold,
//                       ),
//                     ),
//                     const Divider(),
//                     Row(
//                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                       children: [
//                         _buildStep("Registered", true),
//                         _buildStep("Dispatched", true),
//                         _buildStep("In Transit", true),
//                         _buildStep("Out for Delivery", false),
//                         _buildStep("Delivered", false),
//                       ],
//                     ),
//                     const SizedBox(height: 10),
//                     const LinearProgressIndicator(
//                       value: 0.6, // 60% progress (In Transit)
//                       backgroundColor: Colors.grey,
//                       valueColor: AlwaysStoppedAnimation(Colors.blueAccent),
//                     ),
//                   ],
//                 ),
//               ),
//             ),
//             const SizedBox(height: 20),

//             // 🔹 Estimated Delivery
//             Card(
//               shape: RoundedRectangleBorder(
//                 borderRadius: BorderRadius.circular(16),
//               ),
//               elevation: 4,
//               child: Padding(
//                 padding: const EdgeInsets.all(16),
//                 child: const ListTile(
//                   leading: Icon(Icons.calendar_today, color: Colors.blue),
//                   title: Text("Estimated Delivery"),
//                   subtitle: Text("Sept 30, 2025 - Between 10AM - 3PM"),
//                 ),
//               ),
//             ),
//             const SizedBox(height: 20),

//             // 🔹 Customer Support
//             Card(
//               shape: RoundedRectangleBorder(
//                 borderRadius: BorderRadius.circular(16),
//               ),
//               elevation: 4,
//               child: Padding(
//                 padding: const EdgeInsets.all(16),
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: const [
//                     Text(
//                       "Customer Support",
//                       style: TextStyle(
//                         fontSize: 16,
//                         fontWeight: FontWeight.bold,
//                       ),
//                     ),
//                     Divider(),
//                     ListTile(
//                       leading: Icon(Icons.phone, color: Colors.green),
//                       title: Text("Call Us"),
//                       subtitle: Text("+234 800 123 4567"),
//                     ),
//                     ListTile(
//                       leading: Icon(Icons.email, color: Colors.orange),
//                       title: Text("Email"),
//                       subtitle: Text("support@logistics.com"),
//                     ),
//                     ListTile(
//                       leading: Icon(Icons.chat, color: Colors.blue),
//                       title: Text("Live Chat"),
//                       subtitle: Text("Available 24/7"),
//                     ),
//                   ],
//                 ),
//               ),
//             ),
//             const SizedBox(height: 20),

//             // 🔹 Download / Print
//             // Center(
//             //   child: ElevatedButton.icon(
//             //     style: ElevatedButton.styleFrom(
//             //       backgroundColor: Colors.blueAccent,
//             //       padding: const EdgeInsets.symmetric(
//             //         horizontal: 24,
//             //         vertical: 14,
//             //       ),
//             //       shape: RoundedRectangleBorder(
//             //         borderRadius: BorderRadius.circular(12),
//             //       ),
//             //     ),
//             //     icon: const Icon(Icons.download, color: Colors.white),
//             //     label: const Text(
//             //       "Download Receipt",
//             //       style: TextStyle(color: Colors.white),
//             //     ),
//             //     onPressed: () {
//             //       // TODO: implement receipt download / print
//             //       ScaffoldMessenger.of(context).showSnackBar(
//             //         const SnackBar(content: Text("Receipt Downloaded")),
//             //       );
//             //     },
//             //   ),
//             // ),
//             Center(
//               child: ElevatedButton.icon(
//                 style: ElevatedButton.styleFrom(
//                   backgroundColor: Colors.blueAccent,
//                   padding: const EdgeInsets.symmetric(
//                     horizontal: 24,
//                     vertical: 14,
//                   ),
//                   shape: RoundedRectangleBorder(
//                     borderRadius: BorderRadius.circular(12),
//                   ),
//                 ),
//                 icon: const Icon(Icons.download, color: Colors.white),
//                 label: const Text(
//                   "Download Receipt",
//                   style: TextStyle(color: Colors.white),
//                 ),
//                 onPressed: () async {
//                   final pdf = pw.Document();

//                   pdf.addPage(
//                     pw.Page(
//                       build: (pw.Context context) => pw.Column(
//                         crossAxisAlignment: pw.CrossAxisAlignment.start,
//                         children: [
//                           pw.Text(
//                             "Logistics Company",
//                             style: pw.TextStyle(
//                               fontSize: 24,
//                               fontWeight: pw.FontWeight.bold,
//                             ),
//                           ),
//                           pw.SizedBox(height: 10),
//                           pw.Text("Tracking Receipt"),
//                           pw.Divider(),

//                           pw.Text("Tracking Number: $trackingNumber"),
//                           pw.Text("Status: In Transit"),
//                           pw.Text("Dispatch: Lagos, Nigeria"),
//                           pw.Text("Destination: New York, USA"),
//                           pw.Text("Shipment Date: 2025-09-30"),
//                           pw.Text("Estimated Delivery: 2025-10-10"),
//                           pw.SizedBox(height: 10),

//                           pw.Text("Package: Electronics (3 pcs)"),
//                           pw.Text("Payment Mode: Prepaid"),
//                           pw.Text("Amount Paid: \$150.00"),
//                           pw.SizedBox(height: 20),

//                           pw.Text("Customer Support"),
//                           pw.Text("support@logistics.com | +1 555 123 456"),
//                         ],
//                       ),
//                     ),
//                   );

//                   // Preview / print
//                   await Printing.layoutPdf(
//                     onLayout: (PdfPageFormat format) async => pdf.save(),
//                   );
//                 },
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }

//   Widget _buildStep(String label, bool done) {
//     return Column(
//       children: [
//         Icon(
//           done ? Icons.check_circle : Icons.radio_button_unchecked,
//           color: done ? Colors.green : Colors.grey,
//         ),
//         const SizedBox(height: 4),
//         Text(
//           label,
//           style: TextStyle(
//             fontSize: 12,
//             fontWeight: FontWeight.w500,
//             color: done ? Colors.green : Colors.grey,
//           ),
//         ),
//       ],
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:logistics_website/src/features/trackingPage/view_model/tracking_viewmodel.dart';
import 'package:printing/printing.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;

class TrackingDetailsPage extends ConsumerWidget {
  final String trackingId;
  final String trackingNumber;

  const TrackingDetailsPage({
    super.key,
    required this.trackingId,
    required this.trackingNumber,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final trackingAsync = ref.watch(trackingProvider(trackingNumber));

    return Scaffold(
      appBar: AppBar(
        title: const Text("Tracking Details"),
        backgroundColor: Colors.blueAccent,
      ),
      body: trackingAsync.when(
        data: (delivery) {
          if (delivery == null || delivery.isEmpty) {
            return const Center(child: Text("No delivery data found."));
          }

          final status = delivery['status'] ?? "Unknown";
          final sender = delivery['sender'] ?? "N/A";
          final receiver = delivery['receiver'] ?? "N/A";
          final origin = delivery['origin'] ?? "N/A";
          final destination = delivery['destination'] ?? "N/A";
          final paymentStatus = delivery['payment_status'] ?? "Pending";
          final amount = delivery['amount'] ?? "0";
          final estimatedDate = delivery['estimated_date'] ?? "N/A";

          return SingleChildScrollView(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // 🔹 Tracking Header
                Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                  elevation: 4,
                  child: Padding(
                    padding: const EdgeInsets.all(16),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Tracking ID: $trackingId",
                          style: const TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Chip(
                          label: Text(
                            status,
                            style: const TextStyle(color: Colors.white),
                          ),
                          backgroundColor: _getStatusColor(status),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 20),

                // 🔹 Package Summary
                Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                  elevation: 4,
                  child: Padding(
                    padding: const EdgeInsets.all(16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          "Package Summary",
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const Divider(),
                        ListTile(
                          leading: const Icon(Icons.person),
                          title: Text("Sender: $sender"),
                          subtitle: Text(origin),
                        ),
                        ListTile(
                          leading: const Icon(Icons.location_on),
                          title: Text("Receiver: $receiver"),
                          subtitle: Text(destination),
                        ),
                        ListTile(
                          leading: const Icon(Icons.payment),
                          title: Text("Payment: $paymentStatus"),
                          subtitle: Text("₦$amount"),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 20),

                // 🔹 Estimated Delivery
                Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                  elevation: 4,
                  child: ListTile(
                    leading: const Icon(
                      Icons.calendar_today,
                      color: Colors.blue,
                    ),
                    title: const Text("Estimated Delivery"),
                    subtitle: Text(estimatedDate),
                  ),
                ),
                const SizedBox(height: 20),

                // 🔹 Download Receipt Button
                Center(
                  child: ElevatedButton.icon(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blueAccent,
                      padding: const EdgeInsets.symmetric(
                        horizontal: 24,
                        vertical: 14,
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    icon: const Icon(Icons.download, color: Colors.white),
                    label: const Text(
                      "Download Receipt",
                      style: TextStyle(color: Colors.white),
                    ),
                    onPressed: () async {
                      final pdf = pw.Document();
                      pdf.addPage(
                        pw.Page(
                          build: (pw.Context context) => pw.Column(
                            crossAxisAlignment: pw.CrossAxisAlignment.start,
                            children: [
                              pw.Text("Tracking Number: $trackingNumber"),
                              pw.Text("Status: $status"),
                              pw.Text("Sender: $sender"),
                              pw.Text("Receiver: $receiver"),
                              pw.Text("Amount: ₦$amount"),
                            ],
                          ),
                        ),
                      );

                      await Printing.layoutPdf(
                        onLayout: (PdfPageFormat format) async => pdf.save(),
                      );
                    },
                  ),
                ),
              ],
            ),
          );
        },
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (err, _) => Center(child: Text("Error: $err")),
      ),
    );
  }

  Color _getStatusColor(String status) {
    switch (status.toLowerCase()) {
      case "delivered":
        return Colors.green;
      case "in transit":
        return Colors.orange;
      case "dispatched":
        return Colors.blue;
      default:
        return Colors.grey;
    }
  }
}
