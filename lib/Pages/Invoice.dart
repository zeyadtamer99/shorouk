import 'package:flutter/material.dart';
import 'package:shorouk/Pages/Add/AddInvoice.dart';
import 'package:shorouk/Widgets/InvoiceCard.dart';

class InvoicePage extends StatefulWidget {
  @override
  State<InvoicePage> createState() => _InvoicePageState();
}

class _InvoicePageState extends State<InvoicePage> {
  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    const Text(
                      "Invoice",
                      style: TextStyle(
                        fontSize:
                            24, // change this value to increase or decrease the font size
                        fontWeight: FontWeight.bold, // makes the text bold
                        color: Colors
                            .black, // change this value to change the text color
                      ),
                    ),
                    Row(
                      children: <Widget>[
                        Expanded(
                          child: TextField(
                            decoration: InputDecoration(
                              labelText: 'Search',
                              prefixIcon: Icon(Icons.search),
                            ),
                            onChanged: (value) {
                              // Handle your search logic here
                            },
                          ),
                        ),
                        PopupMenuButton<String>(
                          icon: Icon(Icons.filter_list),
                          onSelected: (String result) {
                            switch (result) {
                              case 'Sort A-Z':
                                // Handle your 'Sort A-Z' logic here
                                break;
                              case 'Sort Ascending':
                                // Handle your 'Sort Ascending' logic here
                                break;
                              // Add more cases here for other filter options
                            }
                          },
                          itemBuilder: (BuildContext context) =>
                              <PopupMenuEntry<String>>[
                            const PopupMenuItem<String>(
                              value: 'Sort A-Z',
                              child: Text('Sort A-Z'),
                            ),
                            const PopupMenuItem<String>(
                              value: 'Sort Ascending',
                              child: Text('Sort Ascending'),
                            ),
                            // Add more filter options here
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              InvoiceCard(
                invoiceId: '123',
                hotelName: 'Hotel ABC',
                totalPrice: 100.99,
                date: DateTime.now(),
              ),
              InvoiceCard(
                invoiceId: '123',
                hotelName: 'Hotel ABC',
                totalPrice: 100.99,
                date: DateTime.now(),
              ),
              InvoiceCard(
                invoiceId: '123',
                hotelName: 'Hotel ABC',
                totalPrice: 100.99,
                date: DateTime.now(),
              ),
              InvoiceCard(
                invoiceId: '123',
                hotelName: 'Hotel ABC',
                totalPrice: 100.99,
                date: DateTime.now(),
              ),
              InvoiceCard(
                invoiceId: '123',
                hotelName: 'Hotel ABC',
                totalPrice: 100.99,
                date: DateTime.now(),
              ),
              InvoiceCard(
                invoiceId: '123',
                hotelName: 'Hotel ABC',
                totalPrice: 100.99,
                date: DateTime.now(),
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => AddInvoiceForm()),
          );
        },
        child: Icon(Icons.add),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
    );
  }
}
