import 'package:flutter/material.dart';

class InvoiceDetailsPage extends StatelessWidget {
  final String hotelName;
  final DateTime invoiceDate;
  final String invoiceId;
  final List<Map<String, dynamic>> items;

  InvoiceDetailsPage({
    required this.hotelName,
    required this.invoiceDate,
    required this.invoiceId,
    required this.items,
  });

  double getTotal() {
    return items.fold(0, (sum, item) => sum + item['total']);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Invoice Information'),
        backgroundColor: Colors.blueAccent,
      ),
      body: Container(
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
            ListTile(
              leading: Icon(Icons.hotel, color: Colors.blue),
              title: Text('Hotel Name', style: TextStyle(fontWeight: FontWeight.bold)),
              subtitle: Text(hotelName),
            ),
            ListTile(
              leading: Icon(Icons.date_range, color: Colors.green),
              title: Text('Invoice Date', style: TextStyle(fontWeight: FontWeight.bold)),
              subtitle: Text('${invoiceDate.toLocal()}'.split(' ')[0]),
            ),
            ListTile(
              leading: Icon(Icons.confirmation_number, color: Colors.red),
              title: Text('Invoice ID', style: TextStyle(fontWeight: FontWeight.bold)),
              subtitle: Text(invoiceId),
            ),
            ...items.map((item) {
              return ListTile(
                leading: Icon(Icons.inventory_2, color: Colors.blue),
                title: Text(item['name'], style: TextStyle(fontWeight: FontWeight.bold)),
                subtitle: Text('Quantity: ${item['quantity']}, Price: ${item['price']}, Total: ${item['total']}'),
              );
            }).toList(),
            ListTile(
              leading: Icon(Icons.attach_money, color: Colors.green),
              title: Text('Total', style: TextStyle(fontWeight: FontWeight.bold)),
              subtitle: Text('${getTotal()}', style: TextStyle(color: Colors.red, fontSize: 20)),
            ),
          ],
        ),
      ),
    );
  }
}
