import 'package:flutter/material.dart';
import 'package:shorouk/Pages/Edit/EditOrderForm.dart';
import 'package:url_launcher/url_launcher.dart';

class OrderCard extends StatelessWidget {
  final String hotelName;
  final String phoneNumber;
  final String productType;
  final String deliveryName;
  final double unitPrice;
  final int finishedQuantity;
  final int totalQuantity;
  final DateTime date;

  OrderCard({
    required this.hotelName,
    required this.phoneNumber,
    required this.productType,
    required this.deliveryName,
    required this.unitPrice,
    required this.finishedQuantity,
    required this.totalQuantity,
    required this.date,
  });

  Color getProgressColor(double progress) {
    if (progress < 0.1) {
      return Colors.red;
    } else if (progress < 0.25) {
      return Colors.orange;
    } else if (progress < 0.5) {
      return Colors.yellow;
    } else if (progress < 0.75) {
      return Colors.lightGreen;
    } else {
      return Colors.green;
    }
  }

  @override
  Widget build(BuildContext context) {
    double progress = finishedQuantity / (totalQuantity);
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => EditOrderForm(
              hotelName: hotelName,
              phoneNumber: phoneNumber,
              productType: productType,
              deliveryName: deliveryName,
              unitPrice: unitPrice,
              date: date,finishedQuantity: finishedQuantity, totalQuantity: totalQuantity,
            ),
          ),
        );
      },
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15.0),
        ),
        elevation: 5,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Stack(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SizedBox(width: 50,),
                      Text(hotelName,style: TextStyle(fontSize: 24,color: Colors.blue),),
                      Container(
                        decoration: BoxDecoration(
                          color: Colors.green,
                          shape: BoxShape.circle,
                        ),
                        child: IconButton(
                          icon: Icon(Icons.phone, color: Colors.white),
                          onPressed: () => launch('tel:$phoneNumber'),
                        ),
                      )
                    ],
                  ),
                  Row(
                    children: [
                      Icon(Icons.fastfood, color: Colors.red),
                      SizedBox(width: 8),
                      Text('Product Type: $productType'),
                    ],
                  ),
                  Row(
                    children: [
                      Icon(Icons.delivery_dining, color: Colors.orange),
                      SizedBox(width: 8),
                      Text('Delivery Name: $deliveryName'),
                    ],
                  ),
                  Row(
                    children: [
                      Icon(Icons.attach_money, color: Colors.purple),
                      SizedBox(width: 8),
                      Text('Unit Price: \$${unitPrice.toStringAsFixed(2)}'),
                    ],
                  ),
                  Row(
                    children: [
                      Icon(Icons.check_circle, color: Colors.green),
                      SizedBox(width: 8),
                      Text('Finished Quantity: $finishedQuantity'),
                    ],
                  ),
                  Row(
                    children: [
                      Icon(Icons.hourglass_empty, color: Colors.red),
                      SizedBox(width: 8),
                      Text('Total Quantity: $totalQuantity'),
                    ],
                  ),
                  Row(
                    children: [
                      Icon(Icons.calendar_today, color: Colors.teal),
                      SizedBox(width: 8),
                      Text('Date: ${date.day}/${date.month}/${date.year}'),
                    ],
                  ),
                ],
              ),
              Positioned(
                bottom: 55,
                right: 10,
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    SizedBox(
                      height: 50,
                      width: 50,
                      child: CircularProgressIndicator(
                        value: progress,
                        backgroundColor: Colors.grey,
                        valueColor: AlwaysStoppedAnimation<Color>(getProgressColor(progress)),
                      ),
                    ),
                    Text('${(progress * 100).round()}%'),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
