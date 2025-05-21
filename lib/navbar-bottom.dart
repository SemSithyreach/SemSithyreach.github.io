import 'package:flutter/material.dart';
import 'Product-Details.dart';
import 'menu-homepage.dart';
import 'Profile-user.dart';
import 'AddToCarts.dart';

class BottomNavBar extends StatelessWidget {
  final int currentIndex;
  final Function(int) onTabChanged;

  const BottomNavBar({super.key, required this.currentIndex, required this.onTabChanged});

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: currentIndex,
      onTap: (index) {
        onTabChanged(index);
        if (index == 0) {
          // Example: Navigate to ProductPage when Home icon is tapped
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => MenuHomepage()),
          );
        }
        if (index == 1) {
          // Example: Navigate to ProductPage when Home icon is tapped
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => ProductListPage()),
          );
        }
        if (index == 2) {
          // Example: Navigate to ProductPage when Home icon is tapped
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => CartPage()),
          );
        }
        if (index == 3) {
          // Example: Navigate to ProductPage when Home icon is tapped
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => ProfilePage()),
          );
        }
        // You can add other cases for different icons like 'Search', 'Notifications', etc.
      },
      items: const [
        BottomNavigationBarItem(
          icon: Icon(Icons.home, size: 30, color: Colors.black),
          activeIcon: Icon(Icons.home,
              size: 30, color: Colors.black), // Icon when active
          label: 'Home',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.search, size: 30, color: Colors.black),
          activeIcon: Icon(Icons.search,
              size: 30, color: Colors.black), // Icon when active
          label: 'Search',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.shopping_cart_checkout_sharp, size: 30, color: Colors.black),
          activeIcon: Icon(Icons.notifications,
              size: 30, color: Colors.black), // Icon when active
          label: 'Carts',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.person, size: 30, color: Colors.black),
          activeIcon: Icon(Icons.person,
              size: 30, color: Colors.black), // Icon when active
          label: 'Profile',
        ),
      ],
    );
  }
}
