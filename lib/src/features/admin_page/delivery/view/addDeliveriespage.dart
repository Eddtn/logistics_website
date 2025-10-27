import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:logistics_website/src/features/admin_page/delivery/view_model/add_delivery_view_model.dart';
import 'package:logistics_website/src/features/admin_page/views/admin_page.dart';

class AddDeliveriesPage extends ConsumerStatefulWidget {
  const AddDeliveriesPage({super.key});

  @override
  ConsumerState<AddDeliveriesPage> createState() => _AddTrackingPageState();
}

class _AddTrackingPageState extends ConsumerState<AddDeliveriesPage> {
  final _formKey = GlobalKey<FormState>();

  // ✅ Text controllers
  final senderName = TextEditingController();
  final receiverName = TextEditingController();
  final dispatchLocation = TextEditingController();
  final destination = TextEditingController();
  final amountDue = TextEditingController();
  final dispatchDetails = TextEditingController();
  final estimatedDelivery = TextEditingController();
  final shipment = TextEditingController();
  final quantity = TextEditingController();
  final deliveryTime = TextEditingController();

  // ✅ Mutable dropdown values
  String? status;
  String? paymentMode;

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(addDeliveryProvider);
    final viewModel = ref.read(addDeliveryProvider.notifier);

    final isWide = MediaQuery.of(context).size.width >= 800;

    return Scaffold(
      appBar: AppBar(
        title: const Text("Add Tracking"),
        backgroundColor: Colors.blueAccent,
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _header(),
            const SizedBox(height: 20),

            // ✅ Form
            Form(
              key: _formKey,
              child: isWide
                  ? Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(child: _buildSenderCard()),
                        Expanded(child: _buildReceiverCard()),
                      ],
                    )
                  : Column(
                      children: [_buildSenderCard(), _buildReceiverCard()],
                    ),
            ),
            const SizedBox(height: 20),

            // ✅ Submit button
            Center(
              child: ElevatedButton.icon(
                onPressed: state.isLoading
                    ? null
                    : () async {
                        if (_formKey.currentState!.validate()) {
                          await viewModel.saveDelivery(
                            senderName: senderName.text,
                            receiverName: receiverName.text,
                            dispatchLocation: dispatchLocation.text,
                            destination: destination.text,
                            amountDue: double.tryParse(amountDue.text) ?? 0.0,
                            dispatchDetails: dispatchDetails.text,
                            estimatedDelivery: estimatedDelivery.text,
                            shipment: shipment.text,
                            quantity: int.tryParse(quantity.text) ?? 1,
                            deliveryTime: deliveryTime.text,
                            status: status ?? "Pending",
                            paymentMode: paymentMode ?? "Unpaid",
                          );

                          if (state.isSuccess && context.mounted) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                content: Text("Tracking Added Successfully"),
                                backgroundColor: Colors.green,
                              ),
                            );
                            Navigator.of(context).push(
                              MaterialPageRoute(
                                builder: (context) => AdminPanel(),
                              ),
                            );
                          } else if (state.error != null) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: Text("Error: ${state.error}"),
                                backgroundColor: Colors.red,
                              ),
                            );
                          }
                        }
                      },

                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blueAccent,
                  padding: const EdgeInsets.symmetric(
                    horizontal: 40,
                    vertical: 15,
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                icon: state.isLoading
                    ? const CircularProgressIndicator(color: Colors.white)
                    : const Icon(Icons.save, color: Colors.white),
                label: const Text(
                  "Save Tracking",
                  style: TextStyle(color: Colors.white, fontSize: 16),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _header() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          "Add New Tracking",
          style: Theme.of(context).textTheme.headlineSmall?.copyWith(
            fontWeight: FontWeight.bold,
            color: Colors.blueGrey[800],
          ),
        ),
      ],
    );
  }

  Widget _buildSenderCard() => _card("Sender Details", Colors.blue, [
    _textField("Sender Name", senderName),
    _textField("Dispatch Location", dispatchLocation),
    _dropdown("Status", [
      "Order Placed"
          "Dispatched",
      "In Transit",
      "Out for Delivery"
          "Delivered",
    ], (val) => setState(() => status = val)),
    _dropdown("Payment Mode", [
      "Cash",
      "Card",
      "Bank Transfer",
    ], (val) => setState(() => paymentMode = val)),
    _textField("Amount Due", amountDue),
  ]);

  Widget _buildReceiverCard() => _card("Receiver Details", Colors.green, [
    _textField("Receiver Name", receiverName),
    _textField("Destination", destination),
    _textField("Dispatch Details", dispatchDetails),
    _textField("Estimated Delivery", estimatedDelivery),
    _textField("Shipment", shipment),
    _textField("Quantity", quantity),
    _textField("Delivery Time", deliveryTime),
  ]);

  Widget _card(String title, Color color, List<Widget> children) {
    return Card(
      elevation: 4,
      margin: const EdgeInsets.all(8),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: Theme.of(context).textTheme.titleMedium?.copyWith(
                fontWeight: FontWeight.bold,
                color: color,
              ),
            ),
            const Divider(),
            ...children,
          ],
        ),
      ),
    );
  }

  Widget _textField(String label, TextEditingController controller) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: TextFormField(
        controller: controller,
        decoration: InputDecoration(
          labelText: label,
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
          filled: true,
          fillColor: Colors.grey[100],
        ),
        validator: (v) => v == null || v.isEmpty ? "Enter $label" : null,
      ),
    );
  }

  Widget _dropdown(
    String label,
    List<String> options,
    void Function(String?) onChanged,
  ) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: DropdownButtonFormField<String>(
        decoration: InputDecoration(
          labelText: label,
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
          filled: true,
          fillColor: Colors.grey[100],
        ),
        value: label == "Status" ? status : paymentMode,
        items: options
            .map((e) => DropdownMenuItem(value: e, child: Text(e)))
            .toList(),
        onChanged: onChanged,
        validator: (v) => v == null ? "Select $label" : null,
      ),
    );
  }
}
