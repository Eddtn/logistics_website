class DeliveryModel {
  final String trackingNumber;
  final String senderName;
  final String receiverName;
  final String dispatchLocation;
  final String destination;
  final double amountDue;
  final String dispatchDetails;
  final String estimatedDelivery;
  final String shipment;
  final int quantity;
  final String deliveryTime;
  final String status;
  final String paymentMode;

  DeliveryModel({
    required this.trackingNumber,
    required this.senderName,
    required this.receiverName,
    required this.dispatchLocation,
    required this.destination,
    required this.amountDue,
    required this.dispatchDetails,
    required this.estimatedDelivery,
    required this.shipment,
    required this.quantity,
    required this.deliveryTime,
    required this.status,
    required this.paymentMode,
  });

  Map<String, dynamic> toMap() {
    return {
      // 👇 DO NOT include "id"
      "tracking_number": trackingNumber,
      "sender_name": senderName,
      "receiver_name": receiverName,
      "dispatch_location": dispatchLocation,
      "destination": destination,
      "amount_due": amountDue,
      "dispatch_details": dispatchDetails,
      "estimated_delivery": estimatedDelivery,
      "shipment": shipment,
      "quantity": quantity,
      "delivery_time": deliveryTime,
      "status": status,
      "payment_mode": paymentMode,
    };
  }

  factory DeliveryModel.fromMap(Map<String, dynamic> map) {
    return DeliveryModel(
      trackingNumber: map["tracking_number"],
      senderName: map["sender_name"],
      receiverName: map["receiver_name"],
      dispatchLocation: map["dispatch_location"],
      destination: map["destination"],
      amountDue: (map["amount_due"] ?? 0).toDouble(),
      dispatchDetails: map["dispatch_details"],
      estimatedDelivery: map["estimated_delivery"],
      shipment: map["shipment"],
      quantity: map["quantity"],
      deliveryTime: map["delivery_time"],
      status: map["status"],
      paymentMode: map["payment_mode"],
    );
  }
}
