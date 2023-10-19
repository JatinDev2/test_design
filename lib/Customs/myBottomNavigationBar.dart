import 'package:flutter/material.dart';
import '../Screens/portfolioscreen.dart';

class MyBottomNavigationBar extends StatefulWidget {
  const MyBottomNavigationBar({super.key});

  @override
  State<MyBottomNavigationBar> createState() => _MyBottomNavigationBarState();
}

class _MyBottomNavigationBarState extends State<MyBottomNavigationBar> {
  int _selectedIndex = 0;
  final List<Widget> _widgetOptions = const [
    Text('Home Page'),
    PortfolioScreen(),
    Text('Input'),
    Text('Profile')
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
            icon: ImageIcon(
              const AssetImage("assets/Home.png"),
              color:
                  _selectedIndex == 0 ? const Color(0xffDF5532) : Colors.grey,
            ),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: ImageIcon(
              const AssetImage("assets/Portfoliopng.png"),
              color:
                  _selectedIndex == 1 ? const Color(0xffDF5532) : Colors.grey,
            ),
            label: 'Portfolio',
          ),
          BottomNavigationBarItem(
            icon: ImageIcon(
              const AssetImage("assets/Input.png"),
              color:
                  _selectedIndex == 2 ? const Color(0xffDF5532) : Colors.grey,
            ),
            label: 'Input',
          ),
          BottomNavigationBarItem(
            icon: ImageIcon(
              const AssetImage("assets/Profile.png"),
              color:
                  _selectedIndex == 3 ? const Color(0xffDF5532) : Colors.grey,
            ),
            label: 'Profile',
          ),
        ],
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        selectedLabelStyle: TextStyle(color: const Color(0xffdf5532)),
        type: BottomNavigationBarType.fixed,
        selectedItemColor: const Color(0xffdf5532),
        unselectedItemColor: const Color(0xffd6d1d5),
        unselectedLabelStyle: TextStyle(
          color: const Color(0xffd6d1d5),
        ),
      ),
    );
  }
}
