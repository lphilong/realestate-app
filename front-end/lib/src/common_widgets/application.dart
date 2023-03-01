import 'package:flutter/material.dart';
import '../constants/controllers.dart';
import '../features/home/screens/home.dart';
import '../features/message/screens/contact_screen.dart';
import '../features/message/screens/messages.dart';
import 'keepalive_page.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int _selectedIndex = 0;

  static const List<Widget> _widgetOptions = <Widget>[
    KeepAlivePage(child: HomePage()),
    KeepAlivePage(child: ContactScreen()),
    KeepAlivePage(child: MessageScreen())
  ];

  void _onItemTapped(int index) {
    setState(() {
      messageController.clearValue();
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Center(
          child: _widgetOptions.elementAt(_selectedIndex),
        ),
        bottomNavigationBar: BottomNavigationBar(
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.people_alt_outlined),
              label: 'Contact',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.mail_outline_rounded),
              label: 'Message',
            ),
          ],
          currentIndex: _selectedIndex,
          selectedItemColor: Colors.amber[800],
          onTap: _onItemTapped,
        ),
      ),
    );
  }
}
