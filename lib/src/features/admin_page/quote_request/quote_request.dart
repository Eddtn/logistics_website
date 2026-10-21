import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class QuoteRequestsPage extends StatefulWidget {
  const QuoteRequestsPage({super.key});

  @override
  State<QuoteRequestsPage> createState() => _QuoteRequestsPageState();
}

class _QuoteRequestsPageState extends State<QuoteRequestsPage> {
  final SupabaseClient _client = Supabase.instance.client;

  static const Color _orange = Color(0xFFFF4800);

  late Future<List<Map<String, dynamic>>> _requestsFuture;
  String _filter = 'all';

  final List<String> _statuses = const [
    'pending',
    'quoted',
    'approved',
    'rejected',
  ];

  @override
  void initState() {
    super.initState();
    _loadRequests();
  }

  

//   void _loadRequests() {
//   _requestsFuture = _fetchRequests();
// }




void _loadRequests() {
  _requestsFuture = _fetchRequests();
}

// }
Future<List<Map<String, dynamic>>> _fetchRequests() async {
  final response = await _client
      .from('quote_requests')
      .select()
      .order('created_at', ascending: false);

  return List<Map<String, dynamic>>.from(response);
}

Future<void> _refresh() async {
  final newFuture = _fetchRequests();

  setState(() {
    _requestsFuture = newFuture;
  });

  await newFuture;
}




Future<void> _updateRequest(
  Map<String, dynamic> request, {
  required String status,
  required String amount,
  required String notes,
}) async {
  final rawAmount = amount.trim();
  final parsedAmount =
      rawAmount.isEmpty ? null : double.tryParse(rawAmount);

  if (rawAmount.isNotEmpty &&
      (parsedAmount == null ||
          !parsedAmount.isFinite ||
          parsedAmount < 0)) {
    throw const FormatException(
      'Enter a valid quotation amount.',
    );
  }

  final requestId = request['id'];

  if (requestId == null) {
    throw Exception(
      'Cannot update this request: its ID is missing.',
    );
  }

  try {
    final updatedRows = await _client
        .from('quote_requests')
        .update({
          'status': status,
          'quotation_amount': parsedAmount,
          'admin_notes': notes.trim(),
        })
        .eq('id', requestId)
        .select('id, status, quotation_amount, admin_notes');

    debugPrint('Request ID: $requestId');
    debugPrint('Updated rows: $updatedRows');

    if (updatedRows.isEmpty) {
      throw Exception(
        'No row updated. Check the request ID and '
        'Supabase UPDATE/SELECT policies.',
      );
    }

    debugPrint('Saved status: ${updatedRows.first['status']}');

    if (!mounted) return;

    // Reload the quote requests and rebuild the UI.
    await _refresh();

    if (!mounted) return;

    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Quote request updated successfully.'),
        backgroundColor: Colors.green,
      ),
    );
  } on PostgrestException catch (e) {
    debugPrint('Update error message: ${e.message}');
    debugPrint('Update error code: ${e.code}');
    debugPrint('Update error details: ${e.details}');
    debugPrint('Update error hint: ${e.hint}');

    throw Exception(
      'Supabase error (${e.code ?? 'unknown'}): ${e.message}',
    );
  }
}




  Future<void> _editRequest(
    Map<String, dynamic> request,
  ) async {
    final amountController = TextEditingController(
      text: request['quotation_amount']?.toString() ?? '',
    );
    final notesController = TextEditingController(
      text: request['admin_notes']?.toString() ?? '',
    );

    String status = (request['status'] ?? 'pending').toString();
    if (!_statuses.contains(status)) status = 'pending';

    final formKey = GlobalKey<FormState>();

    await showDialog<void>(
      context: context,
      builder: (dialogContext) {
        bool saving = false;

        return StatefulBuilder(
          builder: (context, setDialogState) {
            return AlertDialog(
              title: Text(
                'Review Quote Request',
                style: GoogleFonts.poppins(
                  fontWeight: FontWeight.w700,
                ),
              ),
              content: SizedBox(
                width: 440,
                child: SingleChildScrollView(
                  child: Form(
                    key: formKey,
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          (request['customer_name'] ?? 'Customer')
                              .toString(),
                          style: GoogleFonts.poppins(
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        const SizedBox(height: 4),
                        Text(
                          '${request['email'] ?? ''}\n'
                          '${request['phone'] ?? ''}',
                          style: GoogleFonts.poppins(fontSize: 12),
                        ),
                        const SizedBox(height: 18),
                        TextFormField(
                          controller: amountController,
                          keyboardType:
                              const TextInputType.numberWithOptions(
                            decimal: true,
                          ),
                          decoration: const InputDecoration(
                            labelText: 'Quotation amount',
                            prefixText: '₦ ',
                            border: OutlineInputBorder(),
                          ),
                          validator: (value) {
                            final text = value?.trim() ?? '';
                            if (text.isEmpty) return null;

                            final amount = double.tryParse(text);
                            if (amount == null || amount < 0) {
                              return 'Enter a valid amount';
                            }
                            return null;
                          },
                        ),
                        const SizedBox(height: 16),
                        DropdownButtonFormField<String>(
                          initialValue: status,
                          decoration: const InputDecoration(
                            labelText: 'Request status',
                            border: OutlineInputBorder(),
                          ),
                          items: _statuses.map((item) {
                            return DropdownMenuItem(
                              value: item,
                              child: Text(_capitalize(item)),
                            );
                          }).toList(),
                          onChanged: (value) {
                            if (value != null) {
                              setDialogState(() => status = value);
                            }
                          },
                        ),
                        const SizedBox(height: 16),
                        TextFormField(
                          controller: notesController,
                          maxLines: 4,
                          maxLength: 1000,
                          decoration: const InputDecoration(
                            labelText: 'Admin notes',
                            alignLabelWithHint: true,
                            border: OutlineInputBorder(),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              actions: [
                TextButton(
                  onPressed: saving
                      ? null
                      : () => Navigator.pop(dialogContext),
                  child: const Text('Cancel'),
                ),
                FilledButton(
                  style: FilledButton.styleFrom(
                    backgroundColor: _orange,
                  ),
                  onPressed: saving
                      ? null
                      : () async {
                          if (!formKey.currentState!.validate()) {
                            return;
                          }

                          setDialogState(() => saving = true);

                          try {
                            await _updateRequest(
                              request,
                              status: status,
                              amount: amountController.text,
                              notes: notesController.text,
                            );

                            if (dialogContext.mounted) {
                              Navigator.pop(dialogContext);
                            }
                          } catch (error) {
                            setDialogState(() => saving = false);

                            if (dialogContext.mounted) {
                              ScaffoldMessenger.of(dialogContext)
                                  .showSnackBar(
                                SnackBar(
                                  content: Text('Update failed: $error'),
                                  backgroundColor: Colors.red,
                                ),
                              );
                            }
                          }
                        },
                  child: Text(saving ? 'Saving...' : 'Save changes'),
                ),
              ],
            );
          },
        );
      },
    );

    amountController.dispose();
    notesController.dispose();
  }

  static String _capitalize(String value) =>
      value.isEmpty ? value : '${value[0].toUpperCase()}${value.substring(1)}';

  Color _statusColor(String status) {
    switch (status.toLowerCase()) {
      case 'quoted':
        return Colors.blue;
      case 'approved':
        return Colors.green;
      case 'rejected':
        return Colors.red;
      default:
        return Colors.orange;
    }
  }

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: _refresh,
      child: ListView(
        padding: const EdgeInsets.all(24),
        children: [
          Text(
            'Quote Requests',
            style: GoogleFonts.poppins(
              fontSize: 28,
              fontWeight: FontWeight.w700,
            ),
          ),
          const SizedBox(height: 6),
          Text(
            'Review customer enquiries and prepare quotations.',
            style: GoogleFonts.poppins(
              color: Colors.grey,
              fontSize: 13,
            ),
          ),
          const SizedBox(height: 20),
          Wrap(
            spacing: 8,
            runSpacing: 8,
            children: [
              ('all', 'All requests'),
              ('pending', 'Pending'),
              ('quoted', 'Quoted'),
              ('approved', 'Approved'),
              ('rejected', 'Rejected'),
            ].map((item) {
              return ChoiceChip(
                label: Text(item.$2),
                selected: _filter == item.$1,
                selectedColor: _orange.withValues(alpha: 0.15),
                onSelected: (_) => setState(() => _filter = item.$1),
              );
            }).toList(),
          ),
          const SizedBox(height: 20),
          FutureBuilder<List<Map<String, dynamic>>>(
            future: _requestsFuture,
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Padding(
                  padding: EdgeInsets.all(40),
                  child: Center(child: CircularProgressIndicator()),
                );
              }

              if (snapshot.hasError) {
                return Card(
                  child: Padding(
                    padding: const EdgeInsets.all(20),
                    child: Column(
                      children: [
                        const Icon(Icons.error_outline, color: Colors.red),
                        const SizedBox(height: 8),
                        Text('Could not load requests: ${snapshot.error}'),
                        const SizedBox(height: 12),
                        FilledButton(
                          onPressed: () => setState(_loadRequests),
                          child: const Text('Try again'),
                        ),
                      ],
                    ),
                  ),
                );
              }

              final requests = (snapshot.data ?? []).where((request) {
                return _filter == 'all' ||
                    (request['status'] ?? 'pending')
                        .toString()
                        .toLowerCase() == _filter;
              }).toList();

              if (requests.isEmpty) {
                return const Padding(
                  padding: EdgeInsets.all(40),
                  child: Center(
                    child: Text('No quote requests found.'),
                  ),
                );
              }

              return Column(
                children: requests.map((request) {
                  final status =
                      (request['status'] ?? 'pending').toString();

                  return Card(
                    margin: const EdgeInsets.only(bottom: 14),
                    elevation: 0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16),
                      side: BorderSide(
                        color: Theme.of(context).dividerColor,
                      ),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(18),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Wrap(
                            alignment: WrapAlignment.spaceBetween,
                            crossAxisAlignment: WrapCrossAlignment.center,
                            spacing: 12,
                            runSpacing: 8,
                            children: [
                              Text(
                                (request['customer_name'] ?? 'Customer')
                                    .toString(),
                                style: GoogleFonts.poppins(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                              Chip(
                                label: Text(_capitalize(status)),
                                backgroundColor:
                                    _statusColor(status).withValues(
                                  alpha: 0.12,
                                ),
                                labelStyle: TextStyle(
                                  color: _statusColor(status),
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 8),
                          Text('Email: ${request['email'] ?? '-'}'),
                          Text('Phone: ${request['phone'] ?? '-'}'),
                          const Divider(height: 24),
                          Text(
                            'Pickup: ${request['pickup_location'] ?? '-'}',
                          ),
                          Text(
                            'Destination: ${request['delivery_location'] ?? '-'}',
                          ),
                          const SizedBox(height: 8),
                          Text(
                            'Shipment: ${request['shipment_type'] ?? '-'}'
                            '  •  Weight: ${request['weight'] ?? '-'}'
                            '  •  Packages: ${request['package_count'] ?? '-'}',
                          ),
                          Text(
                            'Delivery speed: ${request['delivery_speed'] ?? '-'}',
                          ),
                          Text(
                            'Pickup date: ${request['pickup_date'] ?? 'Not specified'}',
                          ),
                          if ((request['additional_details'] ?? '')
                              .toString()
                              .trim()
                              .isNotEmpty) ...[
                            const SizedBox(height: 8),
                            Text(
                              'Customer details: '
                              '${request['additional_details']}',
                            ),
                          ],
                          if (request['quotation_amount'] != null) ...[
                            const SizedBox(height: 8),
                            Text(
                              'Quotation: ₦${request['quotation_amount']}',
                              style: const TextStyle(
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                          ],
                          if ((request['admin_notes'] ?? '')
                              .toString()
                              .trim()
                              .isNotEmpty) ...[
                            const SizedBox(height: 6),
                            Text('Admin notes: ${request['admin_notes']}'),
                          ],
                          const SizedBox(height: 14),
                          Align(
                            alignment: Alignment.centerRight,
                            child: FilledButton.icon(
                              style: FilledButton.styleFrom(
                                backgroundColor: _orange,
                              ),
                              onPressed: () => _editRequest(request),
                              icon: const Icon(Icons.edit_outlined),
                              label: const Text('Review request'),
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                }).toList(),
              );
            },
          ),
        ],
      ),
    );
  }
}
