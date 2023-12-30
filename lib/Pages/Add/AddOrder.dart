import 'package:flutter/material.dart';

class AddOrderForm extends StatefulWidget {
  @override
  _AddOrderFormState createState() => _AddOrderFormState();
}

class _AddOrderFormState extends State<AddOrderForm> {
  final _formKey = GlobalKey<FormState>();
  final _hotelNameController = TextEditingController();
  final _phoneNumberController = TextEditingController();
  String _productType = 'Food';
  String _deliveryName = 'John Doe';
  final _unitPriceController = TextEditingController();
  final _quantityController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add Order Form'),
        backgroundColor: Colors.blue,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Form(
          key: _formKey,
          child: SingleChildScrollView(
            child: Column(
              children: <Widget>[
                TextFormField(
                  controller: _hotelNameController,
                  decoration: InputDecoration(
                    labelText: 'Hotel Name',
                    prefixIcon: Icon(Icons.hotel, color: Colors.blue),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter the hotel name';
                    }
                    return null;
                  },
                ),
                TextFormField(
                  controller: _phoneNumberController,
                  decoration: InputDecoration(
                    labelText: 'Phone Number',
                    prefixIcon: Icon(Icons.phone, color: Colors.green),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter the phone number';
                    }
                    return null;
                  },
                ),
                DropdownButtonFormField<String>(
                  value: _productType,
                  decoration: InputDecoration(
                    labelText: 'Product Type',
                    prefixIcon: Icon(Icons.fastfood, color: Colors.red),
                  ),
                  items: <String>['Food', 'Beverage', 'Dessert']
                      .map((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                  onChanged: (String? newValue) {
                    setState(() {
                      _productType = newValue!;
                    });
                  },
                ),
                DropdownButtonFormField<String>(
                  value: _deliveryName,
                  decoration: InputDecoration(
                    labelText: 'Delivery Name',
                    prefixIcon:
                        Icon(Icons.delivery_dining, color: Colors.orange),
                  ),
                  items: <String>['John Doe', 'Jane Doe', 'Jim Doe']
                      .map((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                  onChanged: (String? newValue) {
                    setState(() {
                      _deliveryName = newValue!;
                    });
                  },
                ),
                TextFormField(
                  controller: _unitPriceController,
                  decoration: InputDecoration(
                    labelText: 'Unit Price',
                    prefixIcon: Icon(Icons.attach_money, color: Colors.purple),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter the unit price';
                    }
                    return null;
                  },
                ),
                TextFormField(
                  controller: _quantityController,
                  decoration: InputDecoration(
                    labelText: 'Quantity',
                    prefixIcon:
                        Icon(Icons.format_list_numbered, color: Colors.brown),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter the quantity';
                    }
                    return null;
                  },
                ),
                ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      Navigator.pop(context);
                    }
                  },
                  child: Text('Submit'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
