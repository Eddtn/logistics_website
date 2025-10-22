import 'dart:async';

import 'package:logistics_website/src/features/admin_page/delivery/model/delivery_model.dart';
import 'package:logistics_website/src/service/network_service.dart';

class DeliveryService {
  final DeliveryNetworkService _network = DeliveryNetworkService();

  /// ✅ Add new delivery (via REST API)
  Future<void> addDelivery(DeliveryModel delivery) async {
    print("Delivery JSON: ${delivery.toMap()}");

    try {
      final data = delivery.toMap();

      final response = await _network.postRequest(
        'deliveries', // 👈 Full Supabase REST path
        data,
      );

      print("✅ Delivery added: $response");
    } catch (e) {
      print("❌ Error adding delivery: $e");
      rethrow;
    }
  }

  /// ✅ Fetch all deliveries
  Future<List<DeliveryModel>> fetchDeliveries() async {
    try {
      final response = await _network.getRequest('rest/v1/deliveries');
      print('✅ Response from Supabase: $response');
      if (response is List) {
        return response
            .map((e) => DeliveryModel.fromMap(e as Map<String, dynamic>))
            .toList();
      } else {
        return [];
      }
    } catch (e) {
      print("❌ Error fetching deliveries: $e");
      rethrow;
    }
  }

  Future<void> updateDelivery(
    String trackingNumber,
    Map<String, dynamic> data,
  ) async {
    try {
      await _network.updateRequest(
        'rest/v1/deliveries',
        data,
        matchColumn: 'trackingNumber', // 👈 match by trackingNumber
        matchValue: trackingNumber,
      );
    } catch (e) {
      print("❌ Error updating delivery: $e");
      rethrow;
    }
  }

  Future<void> deleteDelivery(String trackingNumber) async {
    try {
      await _network.deleteRequest(
        'rest/v1/deliveries',
        matchColumn: 'trackingNumber', // 👈 match by trackingNumber
        matchValue: trackingNumber,
      );
    } catch (e) {
      print("❌ Error deleting delivery: $e");
      rethrow;
    }
  }
}
