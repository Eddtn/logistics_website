// src/features/admin_page/delivery/view_model/deliveries_viewmodel.dart
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:logistics_website/src/service/network_service.dart';
import '../model/delivery_model.dart';

class DeliveryNotifier extends StateNotifier<AsyncValue<List<DeliveryModel>>> {
  DeliveryNotifier() : super(const AsyncLoading()) {
    fetchDeliveries(); // Auto-load
  }

  final DeliveryNetworkService _service = DeliveryNetworkService();

  Future<void> fetchDeliveries() async {
    state = const AsyncLoading();
    try {
      // CORRECT PATH: Just 'deliveries' — baseUrl already has /rest/v1
      final response = await _service.getRequest('deliveries');

      final deliveries = (response as List)
          .map((e) => DeliveryModel.fromMap(e as Map<String, dynamic>))
          .toList();

      state = AsyncData(deliveries);
    } catch (e, stack) {
      state = AsyncError(e, stack);
      print('Error fetching: $e');
    }
  }

  Future<bool> deleteDelivery(String trackingNumber) async {
    try {
      await _service.deleteRequest(
        'deliveries',
        matchColumn: 'tracking_number', // Match DB column
        matchValue: trackingNumber,
      );
      await fetchDeliveries();
      return true;
    } catch (e) {
      print('Delete error: $e');
      return false;
    }
  }

  Future<bool> updateDelivery(
    String trackingNumber,
    Map<String, dynamic> updates,
  ) async {
    try {
      await _service.updateRequest(
        'deliveries',
        updates,
        matchColumn: 'tracking_number',
        matchValue: trackingNumber,
      );
      await fetchDeliveries();
      return true;
    } catch (e) {
      print('Update error: $e');
      return false;
    }
  }
}

// PROVIDER
final deliveryProvider =
    StateNotifierProvider<DeliveryNotifier, AsyncValue<List<DeliveryModel>>>(
      (ref) => DeliveryNotifier(),
    );
