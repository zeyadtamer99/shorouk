import 'package:flutter/material.dart';

class EditInvoiceForm extends StatefulWidget {
  final String hotelName;
  final DateTime invoiceDate;
  final String invoiceId;
  final List<Map<String, dynamic>> items;

  EditInvoiceForm({
    required this.hotelName,
    required this.invoiceDate,
    required this.invoiceId,
    required this.items,
  });

  @override
  _EditInvoiceFormState createState() => _EditInvoiceFormState();
}

class _EditInvoiceFormState extends State<EditInvoiceForm> {
  final _formKey = GlobalKey<FormState>();
  late TextEditingController _hotelNameController;
  late TextEditingController _invoiceIdController;
  late List<TextEditingController> _itemControllers;

  @override
  void initState() {
    super.initState();
    _hotelNameController = TextEditingController(text: widget.hotelName);
    _invoiceIdController = TextEditingController(text: widget.invoiceId);
    _itemControllers = widget.items.map((item) {
      return TextEditingController(text: item['name']);
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Edit Invoice'),
        backgroundColor: Colors.blueAccent,
      ),
      body: Form(
        key: _formKey,
        child: Container(
          margin: EdgeInsets.all(10.0),
          padding: EdgeInsets.all(10.0),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(15.0),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.5),
                spreadRadius: 5,
                blurRadius: 7,
                offset: Offset(0, 3),
              ),
            ],
          ),
          child: ListView(
            padding: EdgeInsets.all(16.0),
            children: <Widget>[
              TextFormField(
                controller: _hotelNameController,
                decoration: InputDecoration(
                  labelText: 'Hotel Name',
                  prefixIcon: Icon(Icons.hotel, color: Colors.blue),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15.0),
                  ),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter a hotel name';
                  }
                  return null;
                },
              ),
              SizedBox(height: 10,),
              TextFormField(
                readOnly: true,
                decoration: InputDecoration(
                  labelText: 'Invoice Date',
                  prefixIcon: Icon(Icons.date_range, color: Colors.green),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15.0),
                  ),
                ),
                controller: TextEditingController(text: '${widget.invoiceDate.toLocal()}'.split(' ')[0]),
              ),
              SizedBox(height: 10,),
              TextFormField(
                controller: _invoiceIdController,
                decoration: InputDecoration(
                  labelText: 'Invoice ID',
                  prefixIcon: Icon(Icons.confirmation_number, color: Colors.red),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15.0),
                  ),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter an invoice ID';
                  }
                  return null;
                },
              ),
              SizedBox(height: 10,),
              ..._itemControllers.asMap().entries.map((entry) {
                int idx = entry.key;
                TextEditingController controller = entry.value;
                return Column(
                  children: [
                    TextFormField(
                      controller: controller,
                      decoration: InputDecoration(
                        labelText: 'Item ${idx + 1}',
                        prefixIcon: Icon(Icons.inventory_2, color: Colors.blue),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15.0),
                        ),
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter an item name';
                        }
                        return null;
                      },
                    ),
                    SizedBox(height: 10,),
                  ],
                );
              }).toList(),
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    Navigator.pop(context);
                  }
                },
                child: Text('Submit'),
                style: ElevatedButton.styleFrom(
                  primary: Colors.blueAccent,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15.0),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
