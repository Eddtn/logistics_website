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
        tracking_number: "TRK-${DateTime.now().millisecondsSinceEpoch}",
        sender_name: senderName,
        receiver_name: receiverName,
        dispatch_location: dispatchLocation,
        destination: destination,
        amount_due: amountDue,
        dispatch_details: dispatchDetails,
        estimated_delivery: estimatedDelivery,
        shipment: shipment,
        quantity: quantity,
        delivery_time: deliveryTime,
        status: status,
        payment_mode: paymentMode,
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
