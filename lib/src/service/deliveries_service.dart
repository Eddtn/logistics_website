// import 'dart:async';
// import 'package:supabase_flutter/supabase_flutter.dart';

// class DeliveryService {
//   final SupabaseClient _client = Supabase.instance.client;

//   /// Stream all deliveries with realtime updates
//   Stream<List<Map<String, dynamic>>> subscribeToAllDeliveries() {
//     final controller = StreamController<List<Map<String, dynamic>>>();

//     // Initial load
//     _client.from('deliveries').select().then((data) {
//       controller.add(List<Map<String, dynamic>>.from(data));
//     });

//     final channel = _client.channel('public:deliveries');

//     channel.onPostgresChanges(
//       event: PostgresChangeEvent.all,
//       schema: 'public',
//       table: 'deliveries',
//       callback: (payload) async {
//         final data = await _client.from('deliveries').select();
//         controller.add(List<Map<String, dynamic>>.from(data));
//       },
//     );

//     channel.subscribe();

//     controller.onCancel = () {
//       _client.removeChannel(channel);
//     };

//     return controller.stream;
//   }

//   /// Update delivery (used by admin)
//   Future<void> updateDelivery(
//     String trackingNumber,
//     Map<String, dynamic> data,
//   ) async {
//     await _client
//         .from('deliveries')
//         .update(data)
//         .eq('tracking_number', trackingNumber);
//   }

//    Future<void> createDelivery(Map<String, dynamic> delivery) async {
//     final response = await _supabase.from('deliveries').insert(delivery);
//     print(response);
//   }

// }

import 'dart:async';
import 'package:supabase_flutter/supabase_flutter.dart';

class DeliveryService {
  final SupabaseClient _client = Supabase.instance.client;

  /// Stream all deliveries with realtime updates
  Stream<List<Map<String, dynamic>>> subscribeToAllDeliveries() {
    final controller = StreamController<List<Map<String, dynamic>>>();

    // Initial load
    _client.from('deliveries').select().then((data) {
      controller.add(List<Map<String, dynamic>>.from(data));
    });

    final channel = _client.channel('public:deliveries');

    channel.onPostgresChanges(
      event: PostgresChangeEvent.all,
      schema: 'public',
      table: 'deliveries',
      callback: (payload) async {
        final data = await _client.from('deliveries').select();
        controller.add(List<Map<String, dynamic>>.from(data));
      },
    );

    channel.subscribe();

    controller.onCancel = () {
      _client.removeChannel(channel);
    };

    return controller.stream;
  }

  /// Update delivery (used by admin)
  Future<void> updateDelivery(
    String trackingNumber,
    Map<String, dynamic> data,
  ) async {
    await _client
        .from('deliveries')
        .update(data)
        .eq('tracking_number', trackingNumber);
  }

  /// Create new delivery record
  Future<void> createDelivery(Map<String, dynamic> delivery) async {
    final response = await _client.from('deliveries').insert(delivery);
    print(response);
  }
}
