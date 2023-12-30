import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';

class CustomBottomNavigationBar extends StatefulWidget {
  final Function(int) onItemTapped;

  CustomBottomNavigationBar({required this.onItemTapped});

  @override
  _CustomBottomNavigationBarState createState() =>
      _CustomBottomNavigationBarState();
}

class _CustomBottomNavigationBarState extends State<CustomBottomNavigationBar> {
  GlobalKey<CurvedNavigationBarState> _bottomNavigationKey = GlobalKey();
  int _currentIndex = 0; // Add this line

  @override
  Widget build(BuildContext context) {
    return CurvedNavigationBar(
      key: _bottomNavigationKey,
      index: 0,
      height: 60.0,
      items: <Widget>[
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.task_sharp,
                size: 30,
                color: _currentIndex == 0 ? Colors.blueAccent : Colors.white),
            Text("Orders",
                style: TextStyle(
                    color:
                        _currentIndex == 0 ? Colors.blueAccent : Colors.white))
          ],
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.inventory_outlined,
                size: 30,
                color: _currentIndex == 1 ? Colors.blueAccent : Colors.white),
            Text("Invoice",
                style: TextStyle(
                    color:
                        _currentIndex == 1 ? Colors.blueAccent : Colors.white))
          ],
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.attach_money_rounded,
                size: 30,
                color: _currentIndex == 2 ? Colors.blueAccent : Colors.white),
            Text("Payment",
                style: TextStyle(
                    color:
                        _currentIndex == 2 ? Colors.blueAccent : Colors.white))
          ],
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.inventory_2_rounded,
                size: 30,
                color: _currentIndex == 3 ? Colors.blueAccent : Colors.white),
            Text("Stock",
                style: TextStyle(
                    color:
                        _currentIndex == 3 ? Colors.blueAccent : Colors.white))
          ],
        ),
      ],
      color: Colors.blueAccent,
      buttonBackgroundColor: Colors.transparent,
      backgroundColor: Colors.yellowAccent,
      animationCurve: Curves.easeInOut,
      animationDuration: Duration(milliseconds: 600),
      onTap: (index) {
        setState(() {
          // Add this line
          _currentIndex = index; // Add this line
        }); // Add this line
        widget.onItemTapped(index);
      },
      letIndexChange: (index) => true,
    );
  }
}
