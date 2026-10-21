import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class RequestQuoteWidget extends StatefulWidget {
  const RequestQuoteWidget({super.key});

  @override
  State<RequestQuoteWidget> createState() =>
      _RequestQuoteWidgetState();
}

class _RequestQuoteWidgetState extends State<RequestQuoteWidget> {
  static const Color _orange = Color(0xFFFF4800);
  static const Color _background = Color(0xFFF2F2F4);
  static const Color _textColor = Color(0xFF202124);
  static const Color _mutedColor = Color(0xFF737373);

  final _formKey = GlobalKey<FormState>();

  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _phoneController = TextEditingController();
  final _pickupController = TextEditingController();
  final _destinationController = TextEditingController();
  final _weightController = TextEditingController();
  final _quantityController = TextEditingController();
  final _notesController = TextEditingController();

  String? _shipmentType;
  String? _deliverySpeed;
  DateTime? _pickupDate;
  bool _isSubmitting = false;

  final List<String> _shipmentTypes = [
    'Documents',
    'Parcels and Packages',
    'Food and Groceries',
    'Electronics',
    'Furniture and Bulky Goods',
    'Commercial Cargo',
    'Other',
  ];

  final List<String> _deliverySpeeds = [
    'Standard Delivery',
    'Express Delivery',
    'Same-Day Delivery',
  ];

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _phoneController.dispose();
    _pickupController.dispose();
    _destinationController.dispose();
    _weightController.dispose();
    _quantityController.dispose();
    _notesController.dispose();
    super.dispose();
  }

  TextStyle get _bodyStyle => GoogleFonts.poppins(
        fontSize: 13,
        color: _textColor,
      );

  InputDecoration _decoration(
    String hint, {
    IconData? icon,
  }) {
    return InputDecoration(
      hintText: hint,
      hintStyle: GoogleFonts.poppins(
        fontSize: 12,
        color: _mutedColor,
      ),
      prefixIcon: icon == null
          ? null
          : Icon(icon, size: 19, color: _mutedColor),
      filled: true,
      fillColor: Colors.white,
      contentPadding: const EdgeInsets.symmetric(
        horizontal: 16,
        vertical: 15,
      ),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: const BorderSide(color: Color(0xFFE3E3E3)),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: const BorderSide(color: Color(0xFFE3E3E3)),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: const BorderSide(color: _orange, width: 1.5),
      ),
      errorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: const BorderSide(color: Colors.red),
      ),
      focusedErrorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: const BorderSide(color: Colors.red, width: 1.5),
      ),
    );
  }

  Widget _label(String text, {bool required = false}) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: RichText(
        text: TextSpan(
          style: GoogleFonts.poppins(
            fontSize: 12,
            fontWeight: FontWeight.w600,
            color: _textColor,
          ),
          children: [
            TextSpan(text: text),
            if (required)
              const TextSpan(
                text: ' *',
                style: TextStyle(color: _orange),
              ),
          ],
        ),
      ),
    );
  }

  Widget _field({
    required String label,
    required String hint,
    required TextEditingController controller,
    required String? Function(String?) validator,
    IconData? icon,
    TextInputType keyboardType = TextInputType.text,
    int maxLines = 1,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _label(label, required: true),
        TextFormField(
          controller: controller,
          style: _bodyStyle,
          keyboardType: keyboardType,
          maxLines: maxLines,
          validator: validator,
          decoration: _decoration(hint, icon: icon),
        ),
      ],
    );
  }

  Widget _dropdown({
    required String label,
    required String hint,
    required String? value,
    required List<String> items,
    required ValueChanged<String?> onChanged,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _label(label, required: true),
        DropdownButtonFormField<String>(
          initialValue: value,
          isExpanded: true,
          style: _bodyStyle,
          decoration: _decoration(hint),
          icon: const Icon(
            Icons.keyboard_arrow_down_rounded,
            color: _mutedColor,
          ),
          items: items
              .map(
                (item) => DropdownMenuItem<String>(
                  value: item,
                  child: Text(
                    item,
                    overflow: TextOverflow.ellipsis,
                    style: _bodyStyle,
                  ),
                ),
              )
              .toList(),
          onChanged: onChanged,
          validator: (value) =>
              value == null || value.isEmpty
                  ? 'Please select $label'
                  : null,
        ),
      ],
    );
  }

  Widget _sectionHeading({
    required String number,
    required String title,
    required String subtitle,
  }) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          width: 34,
          height: 34,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: _orange.withValues(alpha: 0.10),
            borderRadius: BorderRadius.circular(9),
          ),
          child: Text(
            number,
            style: GoogleFonts.poppins(
              color: _orange,
              fontSize: 13,
              fontWeight: FontWeight.w700,
            ),
          ),
        ),
        const SizedBox(width: 12),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: GoogleFonts.poppins(
                  fontSize: 15,
                  fontWeight: FontWeight.w700,
                  color: _textColor,
                ),
              ),
              const SizedBox(height: 3),
              Text(
                subtitle,
                style: GoogleFonts.poppins(
                  fontSize: 11,
                  color: _mutedColor,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _sectionCard({
    required Widget child,
  }) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(14),
        border: Border.all(color: const Color(0xFFEAEAEA)),
      ),
      child: child,
    );
  }

  Widget _responsiveFields({
    required BoxConstraints constraints,
    required List<Widget> children,
  }) {
    final columns = constraints.maxWidth >= 560 ? 2 : 1;
    const spacing = 18.0;

    return LayoutBuilder(
      builder: (context, innerConstraints) {
        final width = innerConstraints.maxWidth;
        final fieldWidth = columns == 2
            ? (width - spacing) / 2
            : width;

        return Wrap(
          spacing: spacing,
          runSpacing: 18,
          children: children
              .map(
                (child) => SizedBox(
                  width: fieldWidth,
                  child: child,
                ),
              )
              .toList(),
        );
      },
    );
  }

  Future<void> _selectPickupDate() async {
    final now = DateTime.now();

    final selected = await showDatePicker(
      context: context,
      initialDate: _pickupDate != null &&
              _pickupDate!.isBefore(now)
          ? now
          : _pickupDate ?? now,
      firstDate: DateTime(now.year, now.month, now.day),
      lastDate: DateTime(now.year + 2),
      builder: (context, child) {
        return Theme(
          data: Theme.of(context).copyWith(
            colorScheme: const ColorScheme.light(
              primary: _orange,
              onPrimary: Colors.white,
            ),
          ),
          child: child!,
        );
      },
    );

    if (selected != null && mounted) {
      setState(() => _pickupDate = selected);
    }
  }




 
Future<void> _submitQuote() async {
  FocusScope.of(context).unfocus();

  if (!_formKey.currentState!.validate()) return;

  if (_shipmentType == null || _deliverySpeed == null) {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Please select shipment type and delivery speed.'),
      ),
    );
    return;
  }

  setState(() => _isSubmitting = true);

  try {
    await Supabase.instance.client.from('quote_requests').insert({
      'customer_name': _nameController.text.trim(),
      'email': _emailController.text.trim(),
      'phone': _phoneController.text.trim(),
      'pickup_location': _pickupController.text.trim(),
      'delivery_location': _destinationController.text.trim(),
      'weight': double.parse(_weightController.text.trim()),
      'package_count': int.parse(_quantityController.text.trim()),
      'shipment_type': _shipmentType,
      'delivery_speed': _deliverySpeed,
      'pickup_date': _pickupDate == null
          ? null
          : '${_pickupDate!.year.toString().padLeft(4, '0')}-'
            '${_pickupDate!.month.toString().padLeft(2, '0')}-'
            '${_pickupDate!.day.toString().padLeft(2, '0')}',
      'additional_details': _notesController.text.trim(),
      'status': 'pending',
    });

    if (!mounted) return;

    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Quote request submitted successfully.'),
        backgroundColor: Colors.green,
      ),
    );
  } on PostgrestException catch (e) {
    if (!mounted) return;

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('Supabase error: ${e.message}'),
        backgroundColor: Colors.red,
      ),
    );
  } catch (e) {
    if (!mounted) return;

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('Submission failed: $e'),
        backgroundColor: Colors.red,
      ),
    );
  } finally {
    if (mounted) {
      setState(() => _isSubmitting = false);
    }
  }
}


  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      color: _background,
      padding: const EdgeInsets.symmetric(
        horizontal: 20,
        vertical: 64,
      ),
      child: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 1050),
          child: LayoutBuilder(
            builder: (context, constraints) {
              final isDesktop = constraints.maxWidth >= 850;

              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Center(
                    child: Column(
                      children: [
                        Text(
                          'GET A QUOTE',
                          style: GoogleFonts.poppins(
                            fontSize: 12,
                            fontWeight: FontWeight.w700,
                            color: _orange,
                            letterSpacing: 2,
                          ),
                        ),
                        const SizedBox(height: 12),
                        Text(
                          'Let’s Get Your Cargo Moving',
                          textAlign: TextAlign.center,
                          style: GoogleFonts.poppins(
                            fontSize: isDesktop ? 32 : 25,
                            fontWeight: FontWeight.w700,
                            color: _textColor,
                          ),
                        ),
                        const SizedBox(height: 10),
                        ConstrainedBox(
                          constraints: const BoxConstraints(
                            maxWidth: 580,
                          ),
                          child: Text(
                            'Tell us what you need to ship, where it is '
                            'going, and how quickly it needs to arrive.',
                            textAlign: TextAlign.center,
                            style: GoogleFonts.poppins(
                              fontSize: 13,
                              height: 1.8,
                              color: _mutedColor,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 36),
                  Form(
                    key: _formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        _sectionCard(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              _sectionHeading(
                                number: '01',
                                title: 'Your Details',
                                subtitle:
                                    'How can we contact you?',
                              ),
                              const SizedBox(height: 24),
                              _responsiveFields(
                                constraints: constraints,
                                children: [
                                  _field(
                                    label: 'Full Name',
                                    hint: 'Enter your full name',
                                    controller: _nameController,
                                    icon: Icons.person_outline,
                                    validator: (value) {
                                      if (value == null ||
                                          value.trim().isEmpty) {
                                        return 'Enter your full name';
                                      }
                                      return null;
                                    },
                                  ),
                                  _field(
                                    label: 'Email Address',
                                    hint: 'you@example.com',
                                    controller: _emailController,
                                    icon: Icons.mail_outline,
                                    keyboardType:
                                        TextInputType.emailAddress,
                                    validator: (value) {
                                      final email =
                                          value?.trim() ?? '';
                                      if (email.isEmpty) {
                                        return 'Enter your email';
                                      }
                                      if (!RegExp(
                                        r'^[^@\s]+@[^@\s]+\.[^@\s]+$',
                                      ).hasMatch(email)) {
                                        return 'Enter a valid email';
                                      }
                                      return null;
                                    },
                                  ),
                                  _field(
                                    label: 'Phone Number',
                                    hint: '+234 800 000 0000',
                                    controller: _phoneController,
                                    icon: Icons.phone_outlined,
                                    keyboardType:
                                        TextInputType.phone,
                                    validator: (value) {
                                      if (value == null ||
                                          value.trim().length < 7) {
                                        return 'Enter a valid phone number';
                                      }
                                      return null;
                                    },
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(height: 20),
                        _sectionCard(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              _sectionHeading(
                                number: '02',
                                title: 'Shipment Details',
                                subtitle:
                                    'Where is your shipment going?',
                              ),
                              const SizedBox(height: 24),
                              _responsiveFields(
                                constraints: constraints,
                                children: [
                                  _field(
                                    label: 'Pickup Location',
                                    hint: 'City, state or full address',
                                    controller: _pickupController,
                                    icon: Icons.location_on_outlined,
                                    validator: (value) =>
                                        value == null ||
                                                value.trim().isEmpty
                                            ? 'Enter pickup location'
                                            : null,
                                  ),
                                  _field(
                                    label: 'Delivery Location',
                                    hint: 'Destination city or address',
                                    controller: _destinationController,
                                    icon: Icons.flag_outlined,
                                    validator: (value) =>
                                        value == null ||
                                                value.trim().isEmpty
                                            ? 'Enter delivery location'
                                            : null,
                                  ),
                                  _dropdown(
                                    label: 'Shipment Type',
                                    hint: 'Select shipment type',
                                    value: _shipmentType,
                                    items: _shipmentTypes,
                                    onChanged: (value) {
                                      setState(() {
                                        _shipmentType = value;
                                      });
                                    },
                                  ),
                                  _field(
                                    label: 'Package Weight (kg)',
                                    hint: 'e.g. 5',
                                    controller: _weightController,
                                    icon: Icons.scale_outlined,
                                    keyboardType:
                                        const TextInputType.numberWithOptions(
                                      decimal: true,
                                    ),
                                    validator: (value) {
                                      final weight = double.tryParse(
                                        value?.trim() ?? '',
                                      );
                                      if (weight == null ||
                                          weight <= 0) {
                                        return 'Enter a valid weight';
                                      }
                                      return null;
                                    },
                                  ),
                                  _field(
                                    label: 'Number of Packages',
                                    hint: 'e.g. 2',
                                    controller: _quantityController,
                                    icon: Icons.inventory_2_outlined,
                                    keyboardType:
                                        TextInputType.number,
                                    validator: (value) {
                                      final quantity = int.tryParse(
                                        value?.trim() ?? '',
                                      );
                                      if (quantity == null ||
                                          quantity <= 0) {
                                        return 'Enter package quantity';
                                      }
                                      return null;
                                    },
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(height: 20),
                        _sectionCard(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              _sectionHeading(
                                number: '03',
                                title: 'Delivery Preferences',
                                subtitle:
                                    'Choose when and how you want it delivered.',
                              ),
                              const SizedBox(height: 24),
                              _responsiveFields(
                                constraints: constraints,
                                children: [
                                  _dropdown(
                                    label: 'Delivery Speed',
                                    hint: 'Choose delivery speed',
                                    value: _deliverySpeed,
                                    items: _deliverySpeeds,
                                    onChanged: (value) {
                                      setState(() {
                                        _deliverySpeed = value;
                                      });
                                    },
                                  ),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      _label('Preferred Pickup Date'),
                                      InkWell(
                                        onTap: _selectPickupDate,
                                        borderRadius:
                                            BorderRadius.circular(10),
                                        child: InputDecorator(
                                          decoration: _decoration(
                                            'Select pickup date',
                                            icon: Icons.calendar_month,
                                          ),
                                          child: Text(
                                            _pickupDate == null
                                                ? 'Choose a date'
                                                : '${_pickupDate!.day.toString().padLeft(2, '0')}/'
                                                    '${_pickupDate!.month.toString().padLeft(2, '0')}/'
                                                    '${_pickupDate!.year}',
                                            style: GoogleFonts.poppins(
                                              fontSize: 12,
                                              color: _pickupDate == null
                                                  ? _mutedColor
                                                  : _textColor,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                              const SizedBox(height: 20),
                              _label('Additional Details'),
                              TextFormField(
                                controller: _notesController,
                                style: _bodyStyle,
                                maxLines: 4,
                                maxLength: 500,
                                decoration: _decoration(
                                  'Describe your package or any special '
                                  'delivery requirements...',
                                ).copyWith(
                                  alignLabelWithHint: true,
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(height: 24),
                        SizedBox(
                          width: double.infinity,
                          child: ElevatedButton.icon(
                            onPressed:
                                _isSubmitting ? null : _submitQuote,
                            icon: _isSubmitting
                                ? const SizedBox(
                                    width: 18,
                                    height: 18,
                                    child: CircularProgressIndicator(
                                      strokeWidth: 2,
                                      color: Colors.white,
                                    ),
                                  )
                                : const Icon(
                                    Icons.arrow_forward_rounded,
                                    size: 18,
                                  ),
                            label: Text(
                              _isSubmitting
                                  ? 'Processing...'
                                  : 'Request My Quote',
                              style: GoogleFonts.poppins(
                                fontSize: 13,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            style: ElevatedButton.styleFrom(
                              backgroundColor: _orange,
                              foregroundColor: Colors.white,
                              disabledBackgroundColor:
                                  _orange.withValues(alpha: 0.6),
                              padding: const EdgeInsets.symmetric(
                                vertical: 19,
                                horizontal: 24,
                              ),
                              elevation: 0,
                              shape: RoundedRectangleBorder(
                                borderRadius:
                                    BorderRadius.circular(10),
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(height: 12),
                        Center(
                          child: Text(
                            'Your shipment details will be used to prepare '
                            'your delivery quote.',
                            textAlign: TextAlign.center,
                            style: GoogleFonts.poppins(
                              fontSize: 10,
                              color: _mutedColor,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}


