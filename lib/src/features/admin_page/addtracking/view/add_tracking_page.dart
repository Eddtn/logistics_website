import 'package:flutter/material.dart';
import 'package:logistics_website/src/service/deliveries_service.dart';

class AddTrackingForm extends StatefulWidget {
  const AddTrackingForm({super.key});

  @override
  State<AddTrackingForm> createState() => _AddTrackingFormState();
}

class _AddTrackingFormState extends State<AddTrackingForm> {
  final _formKey = GlobalKey<FormState>();
  String trackingNumber = "TRK-${DateTime.now().millisecondsSinceEpoch}";

  final TextEditingController senderName = TextEditingController();
  final TextEditingController receiverName = TextEditingController();
  final TextEditingController dispatchLocation = TextEditingController();
  final TextEditingController destination = TextEditingController();
  final TextEditingController amountDue = TextEditingController();
  // final TextEditingController packageDescription = TextEditingController();
  final TextEditingController dispatchDetails = TextEditingController();
  final TextEditingController estimatedDelivery = TextEditingController();
  final TextEditingController shipment = TextEditingController();
  final TextEditingController quantity = TextEditingController();
  final TextEditingController deliveryTime = TextEditingController();

  String? status;
  String? paymentMode;

  @override
  Widget build(BuildContext context) {
    bool isWide = MediaQuery.of(context).size.width >= 800;

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
            // Title Row
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Add New Tracking",
                  style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                    fontWeight: FontWeight.bold,
                    color: Colors.blueGrey[800],
                  ),
                ),
                Chip(
                  label: Text(
                    "Tracking ID: $trackingNumber",
                    style: const TextStyle(color: Colors.white),
                  ),
                  backgroundColor: Colors.blueAccent,
                  padding: const EdgeInsets.all(8),
                ),
              ],
            ),
            const SizedBox(height: 20),

            // Form
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

            // Save Button
            Align(
              alignment: Alignment.center,
              child: ElevatedButton.icon(
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
                icon: const Icon(Icons.save, color: Colors.white),
                label: const Text(
                  "Save Tracking",
                  style: TextStyle(color: Colors.white, fontSize: 16),
                ),

                // onPressed: () {
                //   if (_formKey.currentState!.validate()) {
                //     ScaffoldMessenger.of(context).showSnackBar(
                //       const SnackBar(
                //         content: Text("Tracking Added Successfully"),
                //       ),
                //     );
                //   }
                // },
                onPressed: () async {
                  if (_formKey.currentState!.validate()) {
                    try {
                      final delivery = {
                        'tracking_number': trackingNumber,
                        'sender_name': senderName.text,
                        'receiver_name': receiverName.text,
                        'dispatch_location': dispatchLocation.text,
                        'destination': destination.text,
                        'status': status,
                        'payment_mode': paymentMode,
                        'amount_due': double.tryParse(amountDue.text) ?? 0,
                        // 'package_description': packageDescription.text,
                        'dispatch_details': dispatchDetails.text,
                        'estimated_delivery': estimatedDelivery.text,
                        'shipment': shipment.text,
                        'quantity': int.tryParse(quantity.text) ?? 1,
                        'delivery_time': deliveryTime.text,
                        'created_at': DateTime.now().toIso8601String(),
                      };

                      await DeliveryService().createDelivery(delivery);

                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text("Tracking Added Successfully"),
                          backgroundColor: Colors.green,
                        ),
                      );

                      Navigator.pop(context);
                    } catch (e) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text("Error: $e"),
                          backgroundColor: Colors.red,
                        ),
                      );
                    }
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSenderCard() {
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
              "Sender Details",
              style: Theme.of(context).textTheme.titleMedium?.copyWith(
                fontWeight: FontWeight.bold,
                color: Colors.blue,
              ),
            ),
            const Divider(),
            _buildTextField("Sender Name", senderName),
            // _buildTextField("Dispatch Location"),
            _buildTextField("Dispatch Location", dispatchLocation),

            _buildDropdown("Status", [
              "Pending",
              "In Transit",
              "Delivered",
            ], (val) => status = val),
            _buildDropdown("Payment Mode", [
              "Cash",
              "Card",
              "Bank Transfer",
            ], (val) => paymentMode = val),

            _buildTextField("Amount Due"),
          ],
        ),
      ),
    );
  }

  Widget _buildReceiverCard() {
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
              "Receiver Details",
              style: Theme.of(context).textTheme.titleMedium?.copyWith(
                fontWeight: FontWeight.bold,
                color: Colors.green,
              ),
            ),
            const Divider(),
            _buildTextField("Receiver Name", receiverName),
            // _buildTextField("Destination"),
            _buildTextField("Destination", destination),
            _buildTextField("Dispatch Details", dispatchDetails),
            _buildTextField("Estimated Delivery", estimatedDelivery),
            _buildTextField("Shipment", shipment),
            _buildTextField("Quantity", quantity),
            _buildTextField("Delivery Time", deliveryTime),
            // _buildTextField("Package Description"),
            // _buildTextField("Package Description", packageDescription),
            // _buildTextField("Dispatch Details"),
            // _buildTextField("Estimated Delivery"),
            // _buildTextField("Shipment"),
            // _buildTextField("Quantity"),
            // _buildTextField("Delivery Time"),
          ],
        ),
      ),
    );
  }

  Widget _buildTextField(String label, [TextEditingController? controller]) {
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
        validator: (value) =>
            value == null || value.isEmpty ? "Enter $label" : null,
      ),
    );
  }

  Widget _buildDropdown(
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
        initialValue: null,
        items: options
            .map((e) => DropdownMenuItem(value: e, child: Text(e)))
            .toList(),
        onChanged: onChanged,
        validator: (val) => val == null ? "Select $label" : null,
      ),
    );
  }
}
