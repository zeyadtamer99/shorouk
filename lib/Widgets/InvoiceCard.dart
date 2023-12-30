import 'package:flutter/material.dart';
import 'package:shorouk/Pages/Details/InvoiceDetails.dart';
import 'package:shorouk/Pages/Edit/EditInvoiceForm.dart'; // Make sure to import the EditInvoiceForm page

class InvoiceCard extends StatelessWidget {
  final String invoiceId;
  final String hotelName;
  final double totalPrice;
  final DateTime date;

  InvoiceCard({
    required this.invoiceId,
    required this.hotelName,
    required this.totalPrice,
    required this.date,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => InvoiceDetailsPage(hotelName: hotelName, invoiceDate: date, invoiceId: invoiceId, items: [],)),
        );
      },
      child: Card(
        color: Colors.lightBlue[100], // Changed color to light blue
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15.0),
        ),
        elevation: 5,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: <Widget>[
              ListTile(
                leading: Icon(Icons.receipt, color: Colors.black),
                title: Text('Invoice ID: $invoiceId', style: TextStyle(color: Colors.black, fontFamily: 'Arial')),
                subtitle: Text('Hotel Name: $hotelName', style: TextStyle(color: Colors.black, fontFamily: 'Arial')),
              ),
              Text('Total Price: \$${totalPrice.toStringAsFixed(2)}', style: TextStyle(color: Colors.black, fontFamily: 'Arial')),
              Text('Date: ${date.day}/${date.month}/${date.year}', style: TextStyle(color: Colors.black, fontFamily: 'Arial')),
              IconButton(
                icon: Icon(Icons.edit, color: Colors.blue), // Pen icon
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => EditInvoiceForm(hotelName: hotelName, invoiceDate: date, invoiceId: invoiceId, items: [],)), // Navigates to EditInvoiceForm page
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
