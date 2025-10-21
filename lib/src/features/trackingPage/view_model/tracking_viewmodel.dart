import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:logistics_website/src/features/trackingPage/model/tracking_model.dart';
import 'package:logistics_website/src/features/trackingPage/service/tracking-service.dart';

final trackingServiceProvider = Provider((ref) => TrackingService());

final trackingProvider = FutureProvider.family<Tracking?, String>((
  ref,
  trackingNumber,
) async {
  final service = ref.read(trackingServiceProvider);
  return service.getTrackingByNumber(trackingNumber);
});
