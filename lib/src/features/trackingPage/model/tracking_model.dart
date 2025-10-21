class Tracking {
  final String id;
  final String trackingNumber;
  final String senderName;
  final String receiverName;
  final String origin;
  final String destination;
  final String paymentStatus;
  final String amount;
  final String status;
  final String estimatedDate;

  Tracking({
    required this.id,
    required this.trackingNumber,
    required this.senderName,
    required this.receiverName,
    required this.origin,
    required this.destination,
    required this.paymentStatus,
    required this.amount,
    required this.status,
    required this.estimatedDate,
  });

  factory Tracking.fromMap(Map<String, dynamic> map) {
    return Tracking(
      id: map['id'].toString(),
      trackingNumber: map['tracking_number'] ?? '',
      senderName: map['sender_name'] ?? '',
      receiverName: map['receiver_name'] ?? '',
      origin: map['dispatch_location'] ?? '',
      destination: map['destination'] ?? '',
      paymentStatus: map['payment_status'] ?? 'Pending',
      amount: map['amount_due']?.toString() ?? '0',
      status: map['status'] ?? 'Pending',
      estimatedDate: map['estimated_delivery'] ?? '',
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'tracking_number': trackingNumber,
      'sender_name': senderName,
      'receiver_name': receiverName,
      'dispatch_location': origin,
      'destination': destination,
      'payment_status': paymentStatus,
      'amount_due': amount,
      'status': status,
      'estimated_delivery': estimatedDate,
    };
  }
}
