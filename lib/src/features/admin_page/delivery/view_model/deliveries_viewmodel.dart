// import 'package:flutter_riverpod/flutter_riverpod.dart';
// import 'package:logistics_website/src/features/admin_page/delivery/model/delivery_model.dart';
// import 'package:logistics_website/src/service/network_service.dart'; // your Dio-based DeliveryNetworkService

// /// ✅ Enum to track UI state
// enum DeliveryListState { idle, loading, success, error }

// /// ✅ Notifier Class
// class DeliveryNotifier extends StateNotifier<List<DeliveryModel>> {
//   DeliveryNotifier(this.ref) : super([]);

//   final DeliveryNetworkService _deliveryService = DeliveryNetworkService();
//   final Ref ref;

//   /// Fetch all deliveries
//   Future<void> fetchDeliveries() async {
//     final stateController = ref.read(deliveryStateProvider.notifier);
//     try {
//       stateController.state = DeliveryListState.loading;

//       final response = await _deliveryService.getRequest("deliveries");

//       final deliveries = (response as List)
//           .map((e) => DeliveryModel.fromMap(e as Map<String, dynamic>))
//           .toList();

//       state = deliveries;
//       stateController.state = DeliveryListState.success;
//     } catch (e, stack) {
//       print('❌ Error fetching deliveries: $e\n$stack');
//       stateController.state = DeliveryListState.error;
//     }
//   }

//   /// Delete a delivery by ID
//   Future<bool> deleteDelivery(String id) async {
//     try {
//       await _deliveryService.deleteRequest(
//         "deliveries",
//         matchColumn: "id",
//         matchValue: id,
//       );
//       await fetchDeliveries(); // refresh after delete
//       return true;
//     } catch (e) {
//       print('❌ Error deleting delivery: $e');
//       return false;
//     }
//   }

//   /// Update delivery details
//   Future<bool> updateDelivery(String id, Map<String, dynamic> updates) async {
//     try {
//       await _deliveryService.updateRequest(
//         "deliveries",
//         updates,
//         matchColumn: "id",
//         matchValue: id,
//       );

//       await fetchDeliveries(); // refresh after update
//       return true;
//     } catch (e) {
//       print('❌ Error updating delivery: $e');
//       return false;
//     }
//   }
// }

// /// ✅ Providers
// final deliveryStateProvider = StateProvider<DeliveryListState>(
//   (ref) => DeliveryListState.idle,
// );

// final deliveryProvider =
//     StateNotifierProvider<DeliveryNotifier, List<DeliveryModel>>((ref) {
//       return DeliveryNotifier(ref);
//     });

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:logistics_website/src/features/admin_page/delivery/model/delivery_model.dart';
import 'package:logistics_website/src/service/network_service.dart';

/// ✅ Enum to track UI state
enum DeliveryListState { idle, loading, success, error }

/// ✅ Notifier Class
class DeliveryNotifier extends StateNotifier<List<DeliveryModel>> {
  DeliveryNotifier() : super([]);

  final DeliveryNetworkService _deliveryService = DeliveryNetworkService();
  // final Ref ref;

  /// Fetch all deliveries from Supabase
  Future<void> fetchDeliveries() async {
    // final stateController = ref.read(deliveryStateProvider.notifier);

    try {
      // stateController.state = DeliveryListState.loading;

      // 👇 Corrected endpoint
      final response = await _deliveryService.getRequest('rest/v1/deliveries');

      final deliveries = (response as List)
          .map((e) => DeliveryModel.fromMap(e as Map<String, dynamic>))
          .toList();

      state = deliveries;
      // stateController.state = DeliveryListState.success;
    } catch (e, stack) {
      print('❌ Error fetching deliveries: $e\n$stack');
      // stateController.state = DeliveryListState.error;
    }
  }

  /// Delete delivery by tracking number
  Future<bool> deleteDelivery(String trackingNumber) async {
    try {
      await _deliveryService.deleteRequest(
        'rest/v1/deliveries',
        matchColumn: 'trackingNumber', // 👈 fixed
        matchValue: trackingNumber,
      );

      await fetchDeliveries(); // refresh list
      return true;
    } catch (e) {
      print('❌ Error deleting delivery: $e');
      return false;
    }
  }

  /// Update delivery details
  Future<bool> updateDelivery(
    String trackingNumber,
    Map<String, dynamic> updates,
  ) async {
    try {
      await _deliveryService.updateRequest(
        'rest/v1/deliveries',
        updates,
        matchColumn: 'trackingNumber', // 👈 fixed
        matchValue: trackingNumber,
      );

      await fetchDeliveries(); // refresh list
      return true;
    } catch (e) {
      print('❌ Error updating delivery: $e');
      return false;
    }
  }
}

/// ✅ Providers
final deliveryStateProvider = StateProvider<DeliveryListState>(
  (ref) => DeliveryListState.idle,
);

final deliveryProvider =
    StateNotifierProvider<DeliveryNotifier, List<DeliveryModel>>(
      (ref) => DeliveryNotifier(),
    );
