import 'package:logistics_website/src/features/trackingPage/model/tracking_model.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class TrackingService {
  final SupabaseClient _client = Supabase.instance.client;

  Future<Tracking?> getTrackingByNumber(String trackingNumber) async {
    final response = await _client
        .from('deliveries')
        .select()
        .eq('tracking_number', trackingNumber)
        .maybeSingle();

    if (response == null) return null;
    return Tracking.fromMap(response);
  }
}
