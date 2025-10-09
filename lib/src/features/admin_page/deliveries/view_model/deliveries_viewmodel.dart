import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:logistics_website/src/service/deliveries_service.dart';

final deliveryListProvider =
    StreamProvider.autoDispose<List<Map<String, dynamic>>>((ref) {
      final service = DeliveryService();
      return service.subscribeToAllDeliveries();
    });
