import 'package:flutter/material.dart';
import 'package:shorouk/Pages/Invoice.dart';
import 'package:shorouk/Pages/Orders.dart';
import 'package:shorouk/Widgets/CustomAppBar.dart';
import 'package:shorouk/Widgets/CustomBottomNavigationbar.dart';

class MainMenu extends StatefulWidget {
  MainMenu({Key? key}) : super(key: key);

  @override
  _MainMenuState createState() => _MainMenuState();
}

class _MainMenuState extends State<MainMenu> {
  int _selectedIndex = 0;
  static List<Widget> _widgetOptions = <Widget>[
    OrderPage(),
    InvoicePage(),
    WorkPage(),
    SettingsPage(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(),
      body: _widgetOptions.elementAt(_selectedIndex),
      bottomNavigationBar:
          CustomBottomNavigationBar(onItemTapped: _onItemTapped),
    );
  }
}

class WorkPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(child: Text('Work Page'));
  }
}

class SettingsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(child: Text('Settings Page'));
  }
}
