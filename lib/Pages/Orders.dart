import 'package:flutter/material.dart';
import 'package:shorouk/Pages/Add/AddOrder.dart';
import 'package:shorouk/Widgets/OrderCard.dart';

class OrderPage extends StatefulWidget {
  @override
  _OrderPageState createState() => _OrderPageState();
}

class _OrderPageState extends State<OrderPage> {
  @override
  Widget build(BuildContext context) {
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
                    Text(
                      "Orders",
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
              OrderCard(
                hotelName: 'Hotel GHI',
                phoneNumber: '456-789-0123',
                productType: 'Dessert',
                deliveryName: 'Jim Doe',
                unitPrice: 7.99,
                totalQuantity: 100,
                finishedQuantity: 5,
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
            MaterialPageRoute(builder: (context) => AddOrderForm()),
          );
        },
        child: Icon(Icons.add),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
    );
  }
}
