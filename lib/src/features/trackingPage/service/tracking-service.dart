// // src/features/trackingPage/service/tracking_service.dart
// import 'package:logistics_website/src/features/trackingPage/model/tracking_model.dart';
// import 'package:logistics_website/src/service/network_service.dart';

// class TrackingService {
//   final DeliveryNetworkService _network = DeliveryNetworkService();

//   TrackingService();

//   /// Fetch a single delivery by tracking number
//   Future<TrackingModel?> getTrackingByNumber(String tracking_number) async {
//     try {
//       final data = await _network.getRequest(
//         'deliveries',
//         queryParams: {'tracking_number': 'eq.$tracking_number', 'select': '*'},
//       );

//       // Dio returns List<dynamic> for GET with filters
//       if (data is List && data.isNotEmpty) {
//         return TrackingModel.fromMap(data.first as Map<String, dynamic>);
//       }

//       return null; // Not found
//     } catch (e) {
//       // Re-throw with context
//       throw Exception('Failed to fetch tracking: $e');
//     }
//   }
// }

// src/features/trackingPage/service/tracking_service.dart
import 'package:logistics_website/src/features/trackingPage/model/tracking_model.dart';
import 'package:logistics_website/src/service/network_service.dart';

class TrackingService {
  final DeliveryNetworkService _network = DeliveryNetworkService();

  TrackingService();

  /// Fetch a single delivery by tracking number
  Future<TrackingModel?> getTrackingByNumber(String tracking_number) async {
    try {
      final data = await _network.getRequest(
        'deliveries',
        queryParams: {'tracking_number': 'eq.$tracking_number', 'select': '*'},
      );

      if (data is List && data.isNotEmpty) {
        return TrackingModel.fromMap(data.first as Map<String, dynamic>);
      }
      return null;
    } catch (e) {
      throw Exception('Failed to fetch tracking: $e');
    }
  }

  /// Fetch ALL deliveries (for admin list)
  Future<List<TrackingModel>> getAllDeliveries() async {
    try {
      final data = await _network.getRequest('deliveries');

      if (data is List) {
        return data
            .map((e) => TrackingModel.fromMap(e as Map<String, dynamic>))
            .toList();
      }
      return [];
    } catch (e) {
      throw Exception('Failed to fetch all deliveries: $e');
    }
  }
}
