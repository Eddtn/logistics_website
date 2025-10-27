// class TrackingModel {
//   final String tracking_number;
//   final String sender_name;
//   final String receiver_name;
//   final String dispatch_location;
//   final String destination;
//   final double amount_due;
//   final String dispatch_details;
//   final String estimated_delivery;
//   final String shipment;
//   final int quantity;
//   final String delivery_time;
//   final String status;
//   final String payment_mode;

//   TrackingModel({
//     required this.tracking_number,
//     required this.sender_name,
//     required this.receiver_name,
//     required this.dispatch_location,
//     required this.destination,
//     required this.amount_due,
//     required this.dispatch_details,
//     required this.estimated_delivery,
//     required this.shipment,
//     required this.quantity,
//     required this.delivery_time,
//     required this.status,
//     required this.payment_mode,
//   });

//   factory TrackingModel.fromMap(Map<String, dynamic> map) {
//     return TrackingModel(
//       tracking_number: map["tracking_number"],
//       sender_name: map["sender_name"],
//       receiver_name: map["receiver_name"],
//       dispatch_location: map["dispatch_location"],
//       destination: map["destination"],
//       amount_due: (map["amount_due"] ?? 0).toDouble(),
//       dispatch_details: map["dispatch_details"],
//       estimated_delivery: map["estimated_delivery"],
//       shipment: map["shipment"],
//       quantity: map["quantity"],
//       delivery_time: map["delivery_time"],
//       status: map["status"],
//       payment_mode: map["payment_mode"],
//     );
//   }

//   Map<String, dynamic> toMap() {
//     return {
//       "tracking_number": tracking_number,
//       "sender_name": sender_name,
//       "receiver_name": receiver_name,
//       "dispatch_location": dispatch_location,
//       "destination": destination,
//       "amount_due": amount_due,
//       "dispatch_details": dispatch_details,
//       "estimated_delivery": estimated_delivery,
//       "shipment": shipment,
//       "quantity": quantity,
//       "delivery_time": delivery_time,
//       "status": status,
//       "payment_mode": payment_mode,
//     };
//   }
// }

// src/features/trackingPage/model/tracking_model.dart
import 'package:intl/intl.dart'; // <-- only needed for the helper below

class TrackingModel {
  final String tracking_number;
  final String sender_name;
  final String receiver_name;
  final String dispatch_location;
  final String destination;
  final double amount_due;
  final String dispatch_details;
  final String estimated_delivery;
  final String shipment;
  final int quantity;
  final String delivery_time;
  final String status;
  final String payment_mode;

  // ──────────────────────────────────────
  // NEW: history of status changes
  // ──────────────────────────────────────
  final List<TrackingStatusUpdate> status_history;

  TrackingModel({
    required this.tracking_number,
    required this.sender_name,
    required this.receiver_name,
    required this.dispatch_location,
    required this.destination,
    required this.amount_due,
    required this.dispatch_details,
    required this.estimated_delivery,
    required this.shipment,
    required this.quantity,
    required this.delivery_time,
    required this.status,
    required this.payment_mode,
    required this.status_history,
  });

  /// --------------------------------------------------------------
  ///  FROM MAP  –  called by the network layer
  /// --------------------------------------------------------------
  factory TrackingModel.fromMap(Map<String, dynamic> map) {
    // ---- existing fields -------------------------------------------------
    final base = TrackingModel(
      tracking_number: map["tracking_number"] as String,
      sender_name: map["sender_name"] as String,
      receiver_name: map["receiver_name"] as String,
      dispatch_location: map["dispatch_location"] as String,
      destination: map["destination"] as String,
      amount_due: (map["amount_due"] ?? 0).toDouble(),
      dispatch_details: map["dispatch_details"] as String? ?? '',
      estimated_delivery: map["estimated_delivery"] as String? ?? '',
      shipment: map["shipment"] as String? ?? '',
      quantity: (map["quantity"] ?? 0) as int,
      delivery_time: map["delivery_time"] as String? ?? '',
      status: map["status"] as String? ?? '',
      payment_mode: map["payment_mode"] as String? ?? '',
      status_history: const [], // placeholder – will be replaced below
    );

    // ---- status_history (JSONB column) ----------------------------------
    final rawHistory = map["status_history"] as List<dynamic>?;
    final history =
        rawHistory
            ?.map(
              (e) => TrackingStatusUpdate.fromMap(e as Map<String, dynamic>),
            )
            .toList() ??
        <TrackingStatusUpdate>[];

    return base.copyWith(status_history: history);
  }

  /// --------------------------------------------------------------
  ///  TO MAP  –  useful when you send data back to Supabase
  /// --------------------------------------------------------------
  Map<String, dynamic> toMap() {
    return {
      "tracking_number": tracking_number,
      "sender_name": sender_name,
      "receiver_name": receiver_name,
      "dispatch_location": dispatch_location,
      "destination": destination,
      "amount_due": amount_due,
      "dispatch_details": dispatch_details,
      "estimated_delivery": estimated_delivery,
      "shipment": shipment,
      "quantity": quantity,
      "delivery_time": delivery_time,
      "status": status,
      "payment_mode": payment_mode,
      "status_history": status_history.map((e) => e.toMap()).toList(),
    };
  }

  /// --------------------------------------------------------------
  ///  COPY-WITH  –  handy for immutable updates (e.g. realtime)
  /// --------------------------------------------------------------
  TrackingModel copyWith({
    String? tracking_number,
    String? sender_name,
    String? receiver_name,
    String? dispatch_location,
    String? destination,
    double? amount_due,
    String? dispatch_details,
    String? estimated_delivery,
    String? shipment,
    int? quantity,
    String? delivery_time,
    String? status,
    String? payment_mode,
    List<TrackingStatusUpdate>? status_history,
  }) {
    return TrackingModel(
      tracking_number: tracking_number ?? this.tracking_number,
      sender_name: sender_name ?? this.sender_name,
      receiver_name: receiver_name ?? this.receiver_name,
      dispatch_location: dispatch_location ?? this.dispatch_location,
      destination: destination ?? this.destination,
      amount_due: amount_due ?? this.amount_due,
      dispatch_details: dispatch_details ?? this.dispatch_details,
      estimated_delivery: estimated_delivery ?? this.estimated_delivery,
      shipment: shipment ?? this.shipment,
      quantity: quantity ?? this.quantity,
      delivery_time: delivery_time ?? this.delivery_time,
      status: status ?? this.status,
      payment_mode: payment_mode ?? this.payment_mode,
      status_history: status_history ?? this.status_history,
    );
  }
}

/// -----------------------------------------------------------------
///  One entry in the timeline
/// -----------------------------------------------------------------
class TrackingStatusUpdate {
  final String status;
  final DateTime timestamp;
  final String location;
  final String? notes;

  TrackingStatusUpdate({
    required this.status,
    required this.timestamp,
    required this.location,
    this.notes,
  });

  factory TrackingStatusUpdate.fromMap(Map<String, dynamic> map) {
    return TrackingStatusUpdate(
      status: map["status"] as String,
      timestamp: DateTime.parse(map["timestamp"] as String),
      location: map["location"] as String,
      notes: map["notes"] as String?,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      "status": status,
      "timestamp": timestamp.toIso8601String(),
      "location": location,
      if (notes != null) "notes": notes,
    };
  }

  /// Helper for pretty printing in the UI
  String get formattedTime {
    final now = DateTime.now();
    final diff = now.difference(timestamp);

    if (diff.inDays > 0) return '${diff.inDays}d ago';
    if (diff.inHours > 0) return '${diff.inHours}h ago';
    if (diff.inMinutes > 0) return '${diff.inMinutes}m ago';
    return 'just now';
  }
}
