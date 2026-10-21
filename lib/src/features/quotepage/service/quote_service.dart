
import 'package:logistics_website/src/features/quotepage/quotemodel/quotemodel.dart';
import 'package:supabase_flutter/supabase_flutter.dart';



class QuoteService {
  final SupabaseClient _client;

  QuoteService({SupabaseClient? client})
      : _client = client ?? Supabase.instance.client;

  Future<void> submitQuote(QuoteRequestModel quote) async {
    await _client
        .from('quote_requests')
        .insert(quote.toMap());
  }
}
