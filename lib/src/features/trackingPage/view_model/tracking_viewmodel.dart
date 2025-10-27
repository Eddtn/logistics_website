// src/features/trackingPage/view_model/tracking_viewmodel.dart
import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:logistics_website/src/features/trackingPage/model/tracking_model.dart';
import 'package:logistics_website/src/service/network_service.dart';

class TrackingNotifier extends StateNotifier<AsyncValue<TrackingModel?>> {
  TrackingNotifier(this.tracking_number, this.ref)
    : _service = DeliveryNetworkService(),
      super(const AsyncLoading()) {
    fetchTracking(); // Auto-load when created
  }

  final String tracking_number;
  final Ref ref;
  final DeliveryNetworkService _service;

  Future<void> fetchTracking() async {
    state = const AsyncLoading();
    try {
      print('Searching for: $tracking_number');
      final response = await _service.getRequest(
        'deliveries',
        singleBy: 'tracking_number', // new shortcut
        value: tracking_number,
      );

      // response is either [] or [ {...} ]
      final List list = response is List ? response : [];
      if (list.isEmpty) {
        state = const AsyncData(null);
        return;
      }

      final tracking = TrackingModel.fromMap(
        list.first as Map<String, dynamic>,
      );
      print('Raw API response: $response');
      state = AsyncData(tracking);
    } catch (e, stack) {
      state = AsyncError(e, stack);
      debugPrint('Error fetching tracking $tracking_number: $e');
    }
  }

  /// Optional: refresh from UI
  Future<void> refresh() => fetchTracking();
}

// ──────────────────────────────
// FAMILY PROVIDER (by tracking_number)
// ──────────────────────────────
final trackingProvider =
    StateNotifierProvider.family<
      TrackingNotifier,
      AsyncValue<TrackingModel?>,
      String
    >((ref, tracking_number) {
      return TrackingNotifier(tracking_number, ref);
    });
