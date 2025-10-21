// // import 'dart:developer';
// import 'dart:developer' show log;

// import 'package:flutter_riverpod/flutter_riverpod.dart';
// import 'package:uuid/uuid.dart';
// import 'package:logistics_website/src/service/deliveries_service.dart';
// import 'package:logistics_website/src/features/admin_page/delivery/model/delivery_model.dart';

// enum addDeliveriesState { idle, loading, success, error }

// /// ✅ Provider for DeliveryService
// final deliveryServiceProvider = Provider<DeliveryService>((ref) {
//   return DeliveryService();
// });

// /// ✅ Provider for AddDeliveryViewModel
// final addTrackingViewModelProvider =
//     StateNotifierProvider<AddDeliveryViewModel, AsyncValue<void>>(
//       (ref) => AddDeliveryViewModel(ref),
//     );

// final addDeliveriesProvider =
//     StateNotifierProvider<AddDeliveryViewModel, addDeliveriesState>((ref) {
//       final addDeliveriesService = DeliveryService();
//       return AddDeliveryViewModel(addDeliveriesService);
//     });

// /// ✅ ViewModel Class (manages adding a delivery)
// class AddDeliveryViewModel extends StateNotifier<AsyncValue<void>> {
//   // final Ref ref;
//   final DeliveryService _service;
//   final Uuid _uuid = const Uuid();

//   AddDeliveryViewModel() : super();

//   // AddDeliveryViewModel(this._service)
//   //   : _service = ref.read(deliveryServiceProvider),
//   //     super(const AsyncData(null));

//   /// ✅ Save (Add) a new delivery
//   Future<void> saveDelivery({
//     required String senderName,
//     required String receiverName,
//     required String dispatchLocation,
//     required String destination,
//     required double amountDue,
//     required String dispatchDetails,
//     required String estimatedDelivery,
//     required String shipment,
//     required int quantity,
//     required String deliveryTime,
//     required String status,
//     required String paymentMode,
//   }) async {
//     state = const AsyncLoading();

//     try {
//       // ✅ Generate unique tracking number
//       final trackingNumber = "TRK-${DateTime.now().millisecondsSinceEpoch}";

//       // ✅ Create delivery object
//       final delivery = DeliveryModel(
//         id: _uuid.v4(),
//         trackingNumber: trackingNumber,
//         senderName: senderName,
//         receiverName: receiverName,
//         dispatchLocation: dispatchLocation,
//         destination: destination,
//         amountDue: amountDue,
//         dispatchDetails: dispatchDetails,
//         estimatedDelivery: estimatedDelivery,
//         shipment: shipment,
//         quantity: quantity,
//         deliveryTime: deliveryTime,
//         status: status,
//         paymentMode: paymentMode,
//       );

//       // ✅ Save to backend via service (now simplified)
//       await _service.addDelivery(delivery);

//       state = const AsyncData(null);
//       print('✅ Delivery added successfully!');
//     } catch (e, st) {
//       print('❌ Error adding delivery: $e\n$st');
//       state = AsyncError(e, st);
//     }
//   }
// }

import 'dart:developer' show log;
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:uuid/uuid.dart';
import 'package:logistics_website/src/features/admin_page/delivery/model/delivery_model.dart';
import 'package:logistics_website/src/service/deliveries_service.dart';

/// ----------------------
/// 🧱 STATE CLASS
/// ----------------------
class AddDeliveryState {
  final bool isLoading;
  final bool isSuccess;
  final String? error;

  const AddDeliveryState({
    this.isLoading = false,
    this.isSuccess = false,
    this.error,
  });

  AddDeliveryState copyWith({bool? isLoading, bool? isSuccess, String? error}) {
    return AddDeliveryState(
      isLoading: isLoading ?? this.isLoading,
      isSuccess: isSuccess ?? this.isSuccess,
      error: error,
    );
  }
}

/// ----------------------
/// 🧩 VIEWMODEL / NOTIFIER
/// ----------------------
class AddDeliveryViewModel extends StateNotifier<AddDeliveryState> {
  final DeliveryService _deliveryService;
  final Uuid _uuid = const Uuid();

  AddDeliveryViewModel(this._deliveryService) : super(const AddDeliveryState());

  /// ✅ Save (Add) a new delivery
  Future<void> saveDelivery({
    required String senderName,
    required String receiverName,
    required String dispatchLocation,
    required String destination,
    required double amountDue,
    required String dispatchDetails,
    required String estimatedDelivery,
    required String shipment,
    required int quantity,
    required String deliveryTime,
    required String status,
    required String paymentMode,
  }) async {
    state = state.copyWith(isLoading: true, isSuccess: false, error: null);

    try {
      // ✅ Generate a unique tracking number
      final trackingNumber = "TRK-${DateTime.now().millisecondsSinceEpoch}";

      // ✅ Create delivery object
      final delivery = DeliveryModel(
        trackingNumber: "TRK-${DateTime.now().millisecondsSinceEpoch}",
        senderName: senderName,
        receiverName: receiverName,
        dispatchLocation: dispatchLocation,
        destination: destination,
        amountDue: amountDue,
        dispatchDetails: dispatchDetails,
        estimatedDelivery: estimatedDelivery,
        shipment: shipment,
        quantity: quantity,
        deliveryTime: deliveryTime,
        status: status,
        paymentMode: paymentMode,
      );

      // ✅ Save to backend via the service
      await _deliveryService.addDelivery(delivery);

      log('✅ Delivery added successfully!');
      state = state.copyWith(isLoading: false, isSuccess: true);
    } catch (e, st) {
      log('❌ Error adding delivery: $e\n$st');
      state = state.copyWith(
        isLoading: false,
        isSuccess: false,
        error: e.toString(),
      );
    }
  }
}

/// ----------------------
/// 🪣 PROVIDERS
/// ----------------------

// ✅ Provides a single instance of DeliveryService
final deliveryServiceProvider = Provider<DeliveryService>((ref) {
  return DeliveryService();
});

// ✅ Provides AddDeliveryViewModel (ViewModel logic)
final addDeliveryProvider =
    StateNotifierProvider<AddDeliveryViewModel, AddDeliveryState>((ref) {
      final deliveryService = ref.read(deliveryServiceProvider);
      return AddDeliveryViewModel(deliveryService);
    });
