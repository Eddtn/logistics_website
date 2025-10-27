// // import 'package:flutter/material.dart';
// // import 'package:flutter_riverpod/flutter_riverpod.dart';
// // import 'package:logistics_website/src/features/admin_page/delivery/model/delivery_model.dart';
// // import 'package:logistics_website/src/features/admin_page/delivery/view_model/deliveries_viewmodel.dart';

// // class DashboardPage extends ConsumerStatefulWidget {
// //   const DashboardPage({super.key});

// //   @override
// //   ConsumerState<DashboardPage> createState() => _DashboardPageState();
// // }

// // class _DashboardPageState extends ConsumerState<DashboardPage> {
// //   @override
// //   void initState() {
// //     super.initState();
// //     WidgetsBinding.instance.addPostFrameCallback((_) {
// //       ref.read(deliveryProvider.notifier).fetchDeliveries();
// //     });
// //   }

// //   /// ✅ Confirm delete dialog
// //   void _confirmDelete(BuildContext context, String trackingNumber) {
// //     showDialog(
// //       context: context,
// //       builder: (context) => AlertDialog(
// //         title: const Text("Delete Delivery"),
// //         content: const Text("Are you sure you want to delete this delivery?"),
// //         actions: [
// //           TextButton(
// //             onPressed: () => Navigator.pop(context),
// //             child: const Text("Cancel"),
// //           ),
// //           TextButton(
// //             onPressed: () async {
// //               Navigator.pop(context);
// //               final success = await ref
// //                   .read(deliveryProvider.notifier)
// //                   .deleteDelivery(trackingNumber);
// //               if (!success && context.mounted) {
// //                 ScaffoldMessenger.of(context).showSnackBar(
// //                   const SnackBar(content: Text("Failed to delete delivery")),
// //                 );
// //               }
// //             },
// //             child: const Text("Delete", style: TextStyle(color: Colors.red)),
// //           ),
// //         ],
// //       ),
// //     );
// //   }

// //   /// ✅ Edit delivery status dialog
// //   void _showEditStatusDialog(BuildContext context, DeliveryModel delivery) {
// //     final statuses = ["Pending", "In-Transit", "Delivered", "Cancelled"];
// //     String selectedStatus = delivery.status;

// //     showDialog(
// //       context: context,
// //       builder: (context) => AlertDialog(
// //         title: Text("Update Status - ${delivery.tracking_number}"),
// //         content: StatefulBuilder(
// //           builder: (context, setState) => DropdownButtonFormField<String>(
// //             value: selectedStatus,
// //             items: statuses
// //                 .map((s) => DropdownMenuItem(value: s, child: Text(s)))
// //                 .toList(),
// //             onChanged: (v) => setState(() => selectedStatus = v!),
// //             decoration: const InputDecoration(labelText: "Select new status"),
// //           ),
// //         ),
// //         actions: [
// //           TextButton(
// //             onPressed: () => Navigator.pop(context),
// //             child: const Text("Cancel"),
// //           ),
// //           ElevatedButton(
// //             onPressed: () async {
// //               final success = await ref
// //                   .read(deliveryProvider.notifier)
// //                   .updateDelivery(delivery.tracking_number, {
// //                     'status': selectedStatus,
// //                   });

// //               if (context.mounted) {
// //                 Navigator.pop(context);
// //                 ScaffoldMessenger.of(context).showSnackBar(
// //                   SnackBar(
// //                     content: Text(
// //                       success
// //                           ? "Delivery updated successfully"
// //                           : "Failed to update delivery",
// //                     ),
// //                   ),
// //                 );
// //               }
// //             },
// //             child: const Text("Save"),
// //           ),
// //         ],
// //       ),
// //     );
// //   }

// //   @override
// //   Widget build(BuildContext context) {
// //     // final deliveries = ref.watch(deliveryProvider);

// //     // Inside build()
// //     final asyncDeliveries = ref.watch(deliveryProvider);

// //     return Scaffold(
// //       appBar: AppBar(title: const Text("Admin Dashboard")),
// //       body: RefreshIndicator(
// //         onRefresh: () => ref.read(deliveryProvider.notifier).fetchDeliveries(),
// //         child: asyncDeliveries.when(
// //           loading: () => const Center(child: CircularProgressIndicator()),
// //           error: (err, _) => Center(
// //             child: Column(
// //               mainAxisSize: MainAxisSize.min,
// //               children: [
// //                 Text("Error: $err"),
// //                 ElevatedButton(
// //                   onPressed: () =>
// //                       ref.read(deliveryProvider.notifier).fetchDeliveries(),
// //                   child: const Text("Retry"),
// //                 ),
// //               ],
// //             ),
// //           ),
// //           data: (deliveries) => deliveries.isEmpty
// //               ? const Center(child: Text("No deliveries found"))
// //               : SingleChildScrollView(
// //                   scrollDirection: Axis.horizontal,
// //                   child: DataTable(
// //                     headingRowColor: WidgetStateProperty.all(
// //                       Colors.blue.shade50,
// //                     ),
// //                     border: TableBorder.all(color: Colors.grey.shade300),
// //                     columns: const [
// //                       DataColumn(label: Text("Sender")),
// //                       DataColumn(label: Text("Receiver")),
// //                       DataColumn(label: Text("Tracking #")),
// //                       DataColumn(label: Text("Status")),
// //                       DataColumn(label: Text("Destination")),
// //                       DataColumn(label: Text("Actions")),
// //                     ],
// //                     rows: deliveries.map((delivery) {
// //                       return DataRow(
// //                         cells: [
// //                           DataCell(Text(delivery.sender_name)),
// //                           DataCell(Text(delivery.receiver_name)),
// //                           DataCell(Text(delivery.tracking_number)),
// //                           DataCell(_statusChip(delivery.status)),
// //                           DataCell(Text(delivery.destination)),
// //                           DataCell(
// //                             Row(
// //                               children: [
// //                                 IconButton(
// //                                   icon: const Icon(
// //                                     Icons.edit,
// //                                     color: Colors.blue,
// //                                   ),
// //                                   tooltip: "Edit Status",
// //                                   onPressed: () =>
// //                                       _showEditStatusDialog(context, delivery),
// //                                 ),
// //                                 IconButton(
// //                                   icon: const Icon(
// //                                     Icons.delete,
// //                                     color: Colors.red,
// //                                   ),
// //                                   tooltip: "Delete Delivery",
// //                                   onPressed: () => _confirmDelete(
// //                                     context,
// //                                     delivery.tracking_number,
// //                                   ),
// //                                 ),
// //                               ],
// //                             ),
// //                           ),
// //                         ],
// //                       );
// //                     }).toList(),
// //                   ),
// //                 ),
// //         ),
// //       ),
// //     );
// //   }

// //   static Widget _statusChip(String status) {
// //     final color = switch (status) {
// //       "Order Place" => Colors.orange,
// //       "Dispatched" => Colors.black,
// //       "In-Transit" => Colors.blue,
// //       "Out for Delivery" => Colors.pink,
// //       "Delivered" => Colors.green,
// //       "Cancelled" => Colors.red,
// //       _ => Colors.grey,
// //     };
// //     return Chip(
// //       label: Text(status, style: const TextStyle(color: Colors.white)),
// //       backgroundColor: color,
// //     );
// //   }
// // }

// // src/features/admin_page/delivery/view/dashboard_page.dart
// import 'package:flutter/material.dart';
// import 'package:flutter_riverpod/flutter_riverpod.dart';
// import 'package:logistics_website/src/features/admin_page/delivery/model/delivery_model.dart';
// import 'package:logistics_website/src/features/admin_page/delivery/view_model/deliveries_viewmodel.dart';
// import 'package:supabase_flutter/supabase_flutter.dart';

// class DashboardPage extends ConsumerStatefulWidget {
//   const DashboardPage({super.key});

//   @override
//   ConsumerState<DashboardPage> createState() => _DashboardPageState();
// }

// class _DashboardPageState extends ConsumerState<DashboardPage> {
//   late final RealtimeChannel _channel;

//   @override
//   void initState() {
//     super.initState();

//     // 1. Initial fetch
//     WidgetsBinding.instance.addPostFrameCallback((_) {
//       ref.read(deliveryProvider.notifier).fetchDeliveries();
//     });

//     // 2. Realtime subscription
//     _channel = Supabase.instance.client
//         .channel('public:deliveries')
//         .onPostgresChanges(
//           event: PostgresChangeEvent.all,
//           schema: 'public',
//           table: 'deliveries',
//           callback: (payload) {
//             print('Realtime payload: $payload');
//             // Trigger a fresh fetch → UI updates instantly
//             ref.read(deliveryProvider.notifier).fetchDeliveries();
//           },
//         )
//         .subscribe();
//   }

//   @override
//   void dispose() {
//     _channel.unsubscribe();
//     super.dispose();
//   }

//   /// Confirm delete dialog
//   void _confirmDelete(BuildContext context, String trackingNumber) {
//     showDialog(
//       context: context,
//       builder: (context) => AlertDialog(
//         title: const Text("Delete Delivery"),
//         content: const Text("Are you sure you want to delete this delivery?"),
//         actions: [
//           TextButton(
//             onPressed: () => Navigator.pop(context),
//             child: const Text("Cancel"),
//           ),
//           TextButton(
//             onPressed: () async {
//               Navigator.pop(context);
//               final success = await ref
//                   .read(deliveryProvider.notifier)
//                   .deleteDelivery(trackingNumber);
//               if (!success && context.mounted) {
//                 ScaffoldMessenger.of(context).showSnackBar(
//                   const SnackBar(content: Text("Failed to delete delivery")),
//                 );
//               }
//             },
//             child: const Text("Delete", style: TextStyle(color: Colors.red)),
//           ),
//         ],
//       ),
//     );
//   }

//   /// Edit delivery status dialog
//   void _showEditStatusDialog(BuildContext context, DeliveryModel delivery) {
//     final statuses = [
//       "Pending",
//       "Dispatched",
//       "In-Transit",
//       "Out for Delivery",
//       "Delivered",
//       "Cancelled",
//     ];
//     String selectedStatus = delivery.status;

//     showDialog(
//       context: context,
//       builder: (context) => AlertDialog(
//         title: Text("Update Status - ${delivery.tracking_number}"),
//         content: StatefulBuilder(
//           builder: (context, setStateDialog) => DropdownButtonFormField<String>(
//             value: selectedStatus,
//             items: statuses
//                 .map((s) => DropdownMenuItem(value: s, child: Text(s)))
//                 .toList(),
//             onChanged: (v) => setStateDialog(() => selectedStatus = v!),
//             decoration: const InputDecoration(labelText: "Select new status"),
//           ),
//         ),
//         actions: [
//           TextButton(
//             onPressed: () => Navigator.pop(context),
//             child: const Text("Cancel"),
//           ),
//           ElevatedButton(
//             onPressed: () async {
//               final success = await ref
//                   .read(deliveryProvider.notifier)
//                   .updateDelivery(delivery.tracking_number, {
//                     'status': selectedStatus,
//                   });

//               if (context.mounted) {
//                 Navigator.pop(context);
//                 ScaffoldMessenger.of(context).showSnackBar(
//                   SnackBar(
//                     content: Text(
//                       success
//                           ? "Delivery updated successfully"
//                           : "Failed to update delivery",
//                     ),
//                   ),
//                 );
//               }
//             },
//             child: const Text("Save"),
//           ),
//         ],
//       ),
//     );
//   }

//   @override
//   Widget build(BuildContext context) {
//     final asyncDeliveries = ref.watch(deliveryProvider);

//     return Scaffold(
//       appBar: AppBar(title: const Text("Admin Dashboard")),
//       body: RefreshIndicator(
//         onRefresh: () => ref.read(deliveryProvider.notifier).fetchDeliveries(),
//         child: asyncDeliveries.when(
//           loading: () => const Center(child: CircularProgressIndicator()),
//           error: (err, _) => Center(
//             child: Column(
//               mainAxisSize: MainAxisSize.min,
//               children: [
//                 Text(" Error: $err"),
//                 ElevatedButton(
//                   onPressed: () =>
//                       ref.read(deliveryProvider.notifier).fetchDeliveries(),
//                   child: const Text("Retry"),
//                 ),
//               ],
//             ),
//           ),
//           data: (deliveries) => deliveries.isEmpty
//               ? const Center(child: Text("No deliveries found"))
//               : SingleChildScrollView(
//                   scrollDirection: Axis.horizontal,
//                   child: DataTable(
//                     headingRowColor: WidgetStateProperty.all(
//                       Colors.blue.shade50,
//                     ),
//                     border: TableBorder.all(color: Colors.grey.shade300),
//                     columns: const [
//                       DataColumn(label: Text("Sender")),
//                       DataColumn(label: Text("Receiver")),
//                       DataColumn(label: Text("Tracking #")),
//                       DataColumn(label: Text("Status")),
//                       DataColumn(label: Text("Destination")),
//                       DataColumn(label: Text("Actions")),
//                     ],
//                     rows: deliveries.map((delivery) {
//                       return DataRow(
//                         cells: [
//                           DataCell(Text(delivery.sender_name)),
//                           DataCell(Text(delivery.receiver_name)),
//                           DataCell(Text(delivery.tracking_number)),
//                           DataCell(_statusChip(delivery.status)),
//                           DataCell(Text(delivery.destination)),
//                           DataCell(
//                             Row(
//                               children: [
//                                 IconButton(
//                                   icon: const Icon(
//                                     Icons.edit,
//                                     color: Colors.blue,
//                                   ),
//                                   tooltip: "Edit Status",
//                                   onPressed: () =>
//                                       _showEditStatusDialog(context, delivery),
//                                 ),
//                                 IconButton(
//                                   icon: const Icon(
//                                     Icons.delete,
//                                     color: Colors.red,
//                                   ),
//                                   tooltip: "Delete Delivery",
//                                   onPressed: () => _confirmDelete(
//                                     context,
//                                     delivery.tracking_number,
//                                   ),
//                                 ),
//                               ],
//                             ),
//                           ),
//                         ],
//                       );
//                     }).toList(),
//                   ),
//                 ),
//         ),
//       ),
//     );
//   }

//   static Widget _statusChip(String status) {
//     final color = switch (status) {
//       "Pending" => Colors.orange,
//       "Dispatched" => Colors.black,
//       "In-Transit" => Colors.blue,
//       "Out for Delivery" => Colors.pink,
//       "Delivered" => Colors.green,
//       "Cancelled" => Colors.red,
//       _ => Colors.grey,
//     };
//     return Chip(
//       label: Text(status, style: const TextStyle(color: Colors.white)),
//       backgroundColor: color,
//     );
//   }
// }

// src/features/admin_page/delivery/view/dashboard_page.dart
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:logistics_website/src/features/admin_page/delivery/model/delivery_model.dart';
import 'package:logistics_website/src/features/admin_page/delivery/view_model/deliveries_viewmodel.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class DashboardPage extends ConsumerStatefulWidget {
  const DashboardPage({super.key});

  @override
  ConsumerState<DashboardPage> createState() => _DashboardPageState();
}

class _DashboardPageState extends ConsumerState<DashboardPage>
    with TickerProviderStateMixin {
  late final RealtimeChannel _channel;
  late final AnimationController _pulseController;
  late final AnimationController _routeController;

  @override
  void initState() {
    super.initState();

    // Realtime
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ref.read(deliveryProvider.notifier).fetchDeliveries();
    });

    _channel = Supabase.instance.client
        .channel('public:deliveries')
        .onPostgresChanges(
          event: PostgresChangeEvent.all,
          schema: 'public',
          table: 'deliveries',
          callback: (_) =>
              ref.read(deliveryProvider.notifier).fetchDeliveries(),
        )
        .subscribe();

    // Animations
    _pulseController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 3),
    )..repeat();
    _routeController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 8),
    )..repeat();
  }

  @override
  void dispose() {
    _channel.unsubscribe();
    _pulseController.dispose();
    _routeController.dispose();
    super.dispose();
  }

  // ... your _confirmDelete, _showEditStatusDialog methods (unchanged) ...

  @override
  Widget build(BuildContext context) {
    final asyncDeliveries = ref.watch(deliveryProvider);
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Scaffold(
      body: Stack(
        children: [
          // ANIMATED BACKGROUND
          AnimatedBackground(
            isDark: isDark,
            pulse: _pulseController,
            route: _routeController,
          ),

          // FOREGROUND CONTENT
          RefreshIndicator(
            onRefresh: () =>
                ref.read(deliveryProvider.notifier).fetchDeliveries(),
            child: asyncDeliveries.when(
              loading: () => const Center(child: CircularProgressIndicator()),
              error: (err, _) => Center(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text("Error: $err"),
                    ElevatedButton(
                      onPressed: () =>
                          ref.read(deliveryProvider.notifier).fetchDeliveries(),
                      child: const Text("Retry"),
                    ),
                  ],
                ),
              ),
              data: (deliveries) => deliveries.isEmpty
                  ? const Center(child: Text("No deliveries found"))
                  : SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      padding: const EdgeInsets.all(24),
                      child: Card(
                        elevation: 12,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: DataTable(
                          headingRowColor: WidgetStateProperty.all(
                            isDark ? Colors.grey[800] : Colors.blue.shade50,
                          ),
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
                                DataCell(Text(delivery.sender_name)),
                                DataCell(Text(delivery.receiver_name)),
                                DataCell(Text(delivery.tracking_number)),
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
                                        onPressed: () => _showEditStatusDialog(
                                          context,
                                          delivery,
                                        ),
                                      ),
                                      IconButton(
                                        icon: const Icon(
                                          Icons.delete,
                                          color: Colors.red,
                                        ),
                                        tooltip: "Delete Delivery",
                                        onPressed: () => _confirmDelete(
                                          context,
                                          delivery.tracking_number,
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
            ),
          ),
        ],
      ),
    );
  }

  // ... your _statusChip, _confirmDelete, _showEditStatusDialog ...

  //  Confirm delete dialog
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

  void _showEditStatusDialog(BuildContext context, DeliveryModel delivery) {
    final statuses = [
      "Pending",
      "Dispatched",
      "In-Transit",
      "Out for Delivery",
      "Delivered",
      "Cancelled",
    ];
    String selectedStatus = delivery.status;
  }

  static Widget _statusChip(String status) {
    final color = switch (status) {
      "Pending" => Colors.orange,
      "Dispatched" => Colors.black,
      "In-Transit" => Colors.blue,
      "Out for Delivery" => Colors.pink,
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

// ANIMATED BACKGROUND WIDGET
class AnimatedBackground extends StatelessWidget {
  final bool isDark;
  final AnimationController pulse;
  final AnimationController route;

  const AnimatedBackground({
    super.key,
    required this.isDark,
    required this.pulse,
    required this.route,
  });

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: Listenable.merge([pulse, route]),
      builder: (context, child) {
        final pulseValue = pulse.value;
        final routeValue = route.value;

        return CustomPaint(
          size: MediaQuery.of(context).size,
          painter: LogisticsBackgroundPainter(
            pulse: pulseValue,
            routeProgress: routeValue,
            isDark: isDark,
          ),
        );
      },
    );
  }
}

// CUSTOM PAINTER
class LogisticsBackgroundPainter extends CustomPainter {
  final double pulse;
  final double routeProgress;
  final bool isDark;

  LogisticsBackgroundPainter({
    required this.pulse,
    required this.routeProgress,
    required this.isDark,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint();

    // 1. GRADIENT BASE
    final gradient = LinearGradient(
      begin: Alignment.topLeft,
      end: Alignment.bottomRight,
      colors: isDark
          ? [const Color(0xFF0A192F), const Color(0xFF1E3A5F)]
          : [const Color(0xFFE3F2FD), const Color(0xFFBBDEFB)],
    ).createShader(Rect.fromLTWH(0, 0, size.width, size.height));

    paint.shader = gradient;
    canvas.drawRect(Rect.fromLTWH(0, 0, size.width, size.height), paint);

    // 2. PULSE GLOW
    final glowPaint = Paint()
      ..color = (isDark ? Colors.cyan : Colors.blue).withOpacity(0.1 * pulse)
      ..maskFilter = const MaskFilter.blur(BlurStyle.normal, 30);
    canvas.drawCircle(
      Offset(size.width * 0.3, size.height * 0.4),
      100 + 50 * pulse,
      glowPaint,
    );

    // 3. ANIMATED ROUTE (TRUCK PATH)
    final pathPaint = Paint()
      ..color = (isDark ? Colors.cyanAccent : Colors.indigo).withOpacity(0.6)
      ..strokeWidth = 3
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round;

    final path = Path();
    final start = Offset(size.width * 0.2, size.height * 0.7);
    final end = Offset(size.width * 0.8, size.height * 0.3);

    path.moveTo(start.dx, start.dy);
    path.quadraticBezierTo(
      size.width * 0.5,
      size.height * (0.7 - 0.4 * routeProgress),
      end.dx,
      end.dy,
    );

    final dashPath = Path();
    final pathMetrics = path.computeMetrics().first;
    final length = pathMetrics.length;
    final dashWidth = 10.0;
    final gapWidth = 10.0;
    double distance = 0.0;

    while (distance < length * routeProgress) {
      final extract = pathMetrics.extractPath(distance, distance + dashWidth);
      dashPath.addPath(extract, Offset.zero);
      distance += dashWidth + gapWidth;
    }

    canvas.drawPath(dashPath, pathPaint..style = PaintingStyle.stroke);

    // 4. TRUCK ICON (MOVING)
    final truckPaint = Paint()..color = isDark ? Colors.white : Colors.indigo;
    final truckPos = pathMetrics
        .getTangentForOffset(length * routeProgress)!
        .position;

    final truckPath = Path()
      ..addRect(Rect.fromCenter(center: truckPos, width: 24, height: 16));
    canvas.drawPath(truckPath, truckPaint);

    // Truck icon
    final iconPaint = Paint()..color = isDark ? Colors.cyan : Colors.white;
    canvas.drawCircle(truckPos, 6, iconPaint);
    canvas.drawRect(
      Rect.fromLTWH(truckPos.dx - 10, truckPos.dy - 8, 20, 10),
      iconPaint,
    );
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}
