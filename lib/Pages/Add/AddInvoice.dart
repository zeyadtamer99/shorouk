import 'package:flutter/material.dart';

class AddInvoiceForm extends StatefulWidget {
  @override
  _AddInvoiceFormState createState() => _AddInvoiceFormState();
}

class _AddInvoiceFormState extends State<AddInvoiceForm> {
  final _formKey = GlobalKey<FormState>();
  String hotelName = '';
  DateTime invoiceDate = DateTime.now();
  String invoiceId = '';
  List<Map<String, dynamic>> items = [];

  void addItem(String name, int quantity, double price) {
    setState(() {
      items.add({
        'name': name,
        'quantity': quantity,
        'price': price,
        'total': quantity * price,
      });
    });
  }

  void deleteItem(int index) {
    setState(() {
      items.removeAt(index);
    });
  }

  double getTotal() {
    return items.fold(0, (sum, item) => sum + item['total']);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add Invoice'),
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
                decoration: InputDecoration(
                  labelText: 'Hotel Name',
                  prefixIcon: Icon(Icons.hotel),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter a hotel name';
                  }
                  return null;
                },
                onChanged: (value) {
                  hotelName = value;
                },
              ),
              TextFormField(
                readOnly: true,
                decoration: InputDecoration(
                  labelText: 'Invoice Date',
                  prefixIcon: Icon(Icons.date_range),
                ),
                onTap: () async {
                  final date = await showDatePicker(
                    context: context,
                    initialDate: DateTime.now(),
                    firstDate: DateTime(2000),
                    lastDate: DateTime(2100),
                  );
                  if (date != null) {
                    setState(() {
                      invoiceDate = date;
                    });
                  }
                },
                controller: TextEditingController(
                    text: '${invoiceDate.toLocal()}'.split(' ')[0]),
              ),
              TextFormField(
                decoration: InputDecoration(
                  labelText: 'Invoice ID',
                  prefixIcon: Icon(Icons.confirmation_number),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter an invoice ID';
                  }
                  return null;
                },
                onChanged: (value) {
                  invoiceId = value;
                },
              ),
              Container(
                margin: EdgeInsets.symmetric(vertical: 10.0),
                padding: EdgeInsets.all(10.0),
                decoration: BoxDecoration(
                  color: Colors.blue[50],
                  borderRadius: BorderRadius.circular(15.0),
                ),
                child: Column(
                  children: items.asMap().entries.map((entry) {
                    int idx = entry.key;
                    Map<String, dynamic> item = entry.value;
                    return ListTile(
                      leading: Icon(Icons.inventory_2, color: Colors.blue),
                      title: Text(item['name'],
                          style: TextStyle(fontWeight: FontWeight.bold)),
                      subtitle: Text(
                          'Quantity: ${item['quantity']}, Price: ${item['price']}, Total: ${item['total']}'),
                      trailing: IconButton(
                        icon: Icon(Icons.delete, color: Colors.red),
                        onPressed: () {
                          deleteItem(idx);
                        },
                      ),
                    );
                  }).toList(),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 100.0),
                child: ElevatedButton.icon(
                  onPressed: () {
                    showDialog(
                      context: context,
                      builder: (context) {
                        final _addItemFormKey = GlobalKey<FormState>();
                        String name = '';
                        int quantity = 0;
                        double price = 0.0;
                        return AlertDialog(
                          title: Text('Add Item'),
                          content: Form(
                            key: _addItemFormKey,
                            child: Column(
                              children: <Widget>[
                                TextFormField(
                                  onChanged: (value) {
                                    name = value;
                                  },
                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return 'Please enter an item name';
                                    }
                                    return null;
                                  },
                                  decoration:
                                      InputDecoration(labelText: 'Item Name'),
                                ),
                                TextFormField(
                                  onChanged: (value) {
                                    quantity = int.parse(value);
                                  },
                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return 'Please enter a quantity';
                                    }
                                    if (int.tryParse(value) == null) {
                                      return 'Please enter a valid number';
                                    }
                                    return null;
                                  },
                                  decoration: const InputDecoration(
                                      labelText: 'Quantity'),
                                ),
                                TextFormField(
                                  onChanged: (value) {
                                    price = double.parse(value);
                                  },
                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return 'Please enter a unit price';
                                    }
                                    if (double.tryParse(value) == null) {
                                      return 'Please enter a valid number';
                                    }
                                    return null;
                                  },
                                  decoration: const InputDecoration(
                                      labelText: 'Unit Price'),
                                ),
                              ],
                            ),
                          ),
                          actions: <Widget>[
                            TextButton(
                              child: const Text('Submit'),
                              onPressed: () {
                                if (_addItemFormKey.currentState!.validate()) {
                                  addItem(name, quantity, price);
                                  Navigator.of(context).pop();
                                }
                              },
                            ),
                          ],
                        );
                      },
                    );
                  },
                  icon: Icon(Icons.add),
                  label: Text('Add'),
                ),
              ),
              ListTile(
                tileColor: Colors.blue[100],
                leading: Icon(Icons.attach_money, color: Colors.green),
                title: Text('Total',
                    style: TextStyle(fontWeight: FontWeight.bold)),
                subtitle: Text('${getTotal()}',
                    style: TextStyle(color: Colors.red, fontSize: 20)),
              ),
              const SizedBox(
                height: 10,
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
    );
  }
}
