
class QuoteRequestModel {
  final String customerName;
  final String email;
  final String phone;
  final String pickupLocation;
  final String deliveryLocation;
  final double weight;
  final int packageCount;
  final String shipmentType;
  final String deliverySpeed;
  final String? pickupDate;
  final String additionalDetails;

  const QuoteRequestModel({
    required this.customerName,
    required this.email,
    required this.phone,
    required this.pickupLocation,
    required this.deliveryLocation,
    required this.weight,
    required this.packageCount,
    required this.shipmentType,
    required this.deliverySpeed,
    this.pickupDate,
    this.additionalDetails = '',
  });

  Map<String, dynamic> toMap() {
    return {
      'customer_name': customerName,
      'email': email,
      'phone': phone,
      'pickup_location': pickupLocation,
      'delivery_location': deliveryLocation,
      'weight': weight,
      'package_count': packageCount,
      'shipment_type': shipmentType,
      'delivery_speed': deliverySpeed,
      'pickup_date': pickupDate,
      'additional_details': additionalDetails,
      'status': 'pending',
    };
  }

  factory QuoteRequestModel.fromMap(
    Map<String, dynamic> map,
  ) {
    return QuoteRequestModel(
      customerName: map['customer_name'] as String,
      email: map['email'] as String,
      phone: map['phone'] as String,
      pickupLocation: map['pickup_location'] as String,
      deliveryLocation: map['delivery_location'] as String,
      weight: (map['weight'] as num).toDouble(),
      packageCount: (map['package_count'] as num).toInt(),
      shipmentType: map['shipment_type'] as String,
      deliverySpeed: map['delivery_speed'] as String,
      pickupDate: map['pickup_date'] as String?,
      additionalDetails:
          map['additional_details'] as String? ?? '',
    );
  }
}
