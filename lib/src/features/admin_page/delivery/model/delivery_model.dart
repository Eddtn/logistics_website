// ignore_for_file: non_constant_identifier_names

class DeliveryModel {
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

  DeliveryModel({
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
  });

  Map<String, dynamic> toMap() {
    return {
      // 👇 DO NOT include "id"
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
    };
  }

  factory DeliveryModel.fromMap(Map<String, dynamic> map) {
    return DeliveryModel(
      tracking_number: map["tracking_number"],
      sender_name: map["sender_name"],
      receiver_name: map["receiver_name"],
      dispatch_location: map["dispatch_location"],
      destination: map["destination"],
      amount_due: (map["amount_due"] ?? 0).toDouble(),
      dispatch_details: map["dispatch_details"],
      estimated_delivery: map["estimated_delivery"],
      shipment: map["shipment"],
      quantity: map["quantity"],
      delivery_time: map["delivery_time"],
      status: map["status"],
      payment_mode: map["payment_mode"],
    );
  }
}
