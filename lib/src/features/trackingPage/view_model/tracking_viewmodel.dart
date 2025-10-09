// lib/src/features/trackingPage/providers/tracking_provider.dart
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:logistics_website/src/service/deliveries_service.dart';

final trackingProvider = StreamProvider.family
    .autoDispose<Map<String, dynamic>?, String>((ref, trackingNumber) {
      final service = DeliveryService();
      return service.subscribeToAllDeliveries()
      // get all deliveries
      .map(
        (deliveries) => deliveries.firstWhere(
          (d) => d['tracking_number'] == trackingNumber,
          orElse: () => {},
        ),
      );
    });
