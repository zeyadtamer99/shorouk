import 'package:flutter/material.dart';
import 'package:shorouk/Pages/Edit/EditOrderForm.dart';
import 'package:url_launcher/url_launcher.dart';

class EditOrderForm extends StatefulWidget {
  final String hotelName;
  final String phoneNumber;
  final String productType;
  final String deliveryName;
  final double unitPrice;
  final int finishedQuantity;
  final int totalQuantity;
  final DateTime date;

  EditOrderForm({
    required this.hotelName,
    required this.phoneNumber,
    required this.productType,
    required this.deliveryName,
    required this.unitPrice,
    required this.finishedQuantity,
    required this.totalQuantity,
    required this.date,
  });

  @override
  _EditOrderFormState createState() => _EditOrderFormState();
}

class _EditOrderFormState extends State<EditOrderForm> {
  final _formKey = GlobalKey<FormState>();
  late TextEditingController _hotelNameController;
  late TextEditingController _phoneNumberController;
  late String _productType;
  late String _deliveryName;
  late TextEditingController _unitPriceController;
  late TextEditingController _finishedQuantityController;
  late TextEditingController _totalQuantityController;

  @override
  void initState() {
    super.initState();
    _hotelNameController = TextEditingController(text: widget.hotelName);
    _phoneNumberController = TextEditingController(text: widget.phoneNumber);
    _productType = widget.productType;
    _deliveryName = widget.deliveryName;
    _unitPriceController =
        TextEditingController(text: widget.unitPrice.toString());
    _finishedQuantityController =
        TextEditingController(text: widget.finishedQuantity.toString());
    _totalQuantityController =
        TextEditingController(text: widget.totalQuantity.toString());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Edit Order Form'),
        backgroundColor: Colors.blue,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Form(
          key: _formKey,
          child: SingleChildScrollView(
            child: Container(
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
                    controller: _finishedQuantityController,
                    decoration: InputDecoration(
                      labelText: 'Finished Quantity',
                      prefixIcon: Icon(Icons.check_circle, color: Colors.green),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter the finished quantity';
                      }
                      return null;
                    },
                  ),
                  TextFormField(
                    controller: _totalQuantityController,
                    decoration: InputDecoration(
                      labelText: 'total Quantity',
                      prefixIcon: Icon(Icons.hourglass_empty, color: Colors.red),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter the total quantity';
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
      ),
    );
  }
}
