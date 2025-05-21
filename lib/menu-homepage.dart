import 'package:flutter/material.dart';
import 'dashboard/dashboard.dart';
import 'dashboard/ins-upd-del-product.dart';
import 'contact-page.dart';
import 'feature_page.dart';
import 'Product-Details.dart';
import 'login.dart';
import 'navbar-bottom.dart'; // Import the Bottom Navigation Bar

class MenuHomepage extends StatefulWidget {
  const MenuHomepage({super.key});

  @override
  _MenuHomepageState createState() => _MenuHomepageState();
}

class _MenuHomepageState extends State<MenuHomepage> {
  // Function to handle the item tap and update the selected index
  int _selectedIndex = 0;

  void _onTabChanged(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    // Get screen size
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(title: Text("Menu Homepage")),
      backgroundColor: Colors.purple[300],
      body: Column(
        children: [
          // Search TextField with responsive padding
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: screenWidth * 0.05,
              vertical: screenHeight * 0.02,
            ),
            child: TextField(
              decoration: InputDecoration(
                prefixIcon: Icon(Icons.search),
                hintText: "Search for products",
                filled: true,
                fillColor: Colors.grey[300],
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                  borderSide: BorderSide.none,
                ),
              ),
            ),
          ),
          // Slideshow Section
          Container(
            padding: EdgeInsets.symmetric(vertical: screenHeight * 0.02),
            child: Slideshow(),
          ),
          Expanded(
            child: GridView.count(
              // Use a dynamic number of columns based on screen width
              crossAxisCount:
                  screenWidth > 600 ? 3 : 2, // 3 columns for larger screens
              crossAxisSpacing: 10,
              mainAxisSpacing: 10,
              padding: EdgeInsets.all(10),
              children: [
                ProductCard("T-shirt", "4.7", Colors.black),
                ProductCard("Long sleeve", "4.5", Colors.black87),
                ProductCard("Jacket", "5.0", Colors.red),
                ProductCard("Hoodie", "5.0", Colors.white),
              ],
            ),
          ),
        ],
      ),
      drawer: Drawer(
        child: ListView(
          children: [
            DrawerHeader(
              decoration: BoxDecoration(color: Colors.blue),
              child: Text("Menu",
                  style: TextStyle(color: Colors.white, fontSize: 24)),
            ),
            ListTile(
              title: Text("Feature"),
              onTap: () => Navigator.push(context,
                  MaterialPageRoute(builder: (context) => FeaturePage())),
            ),
            ListTile(
              title: Text("Blog"),
              onTap: () => Navigator.push(
                  context, MaterialPageRoute(builder: (context) => DashboardPage())),
            ),
            ListTile(
              title: Text("Contact"),
              onTap: () => Navigator.push(context,
                  MaterialPageRoute(builder: (context) => ContactDetailPage())),
            ),
            ListTile(
              title: Text("About"),
              onTap: () => Navigator.push(context,
                  MaterialPageRoute(builder: (context) => ProductPage())),
            ),
            ListTile(
              title: Text("Settings"),
              onTap: () => Navigator.push(context,
                  MaterialPageRoute(builder: (context) => ProductListPage())),
            ),

            ListTile(
              title: Text("Register"),
              onTap: () => Navigator.push(context,
                  MaterialPageRoute(builder: (context) => SignUpPage())),
            ),
            ListTile(
              title: Text("Login"),
              onTap: () => Navigator.push(context,
                  MaterialPageRoute(builder: (context) => LoginPage())),
            ),
          ],
        ),
      ),
      // Add BottomNavigationBar
      bottomNavigationBar: BottomNavBar(
        currentIndex: _selectedIndex,
        onTabChanged: _onTabChanged,
      ),
    );
  }
}

class Slideshow extends StatefulWidget {
  const Slideshow({super.key});

  @override
  _SlideshowState createState() => _SlideshowState();
}

class _SlideshowState extends State<Slideshow> {
  final List<String> _imageList = [
    'https://m.media-amazon.com/images/I/618ccBJI9EL._SX1500_.jpg',
    'https://m.media-amazon.com/images/I/81eUWClMbHL._SX3000_.jpg',
    'https://m.media-amazon.com/images/I/618ccBJI9EL._SX1500_.jpg',
  ];

  int _currentIndex = 0;

  void _nextImage() {
    setState(() {
      _currentIndex = (_currentIndex + 1) % _imageList.length;
    });
  }

  void _previousImage() {
    setState(() {
      _currentIndex =
          (_currentIndex - 1 + _imageList.length) % _imageList.length;
    });
  }

  @override
  Widget build(BuildContext context) {
    // Get the screen size
    double screenWidth = MediaQuery.of(context).size.width;

    // Calculate responsive width and height for images
    double imageWidth = screenWidth * 0.9; // 90% of screen width
    double imageHeight = screenWidth * 0.6; // 60% of screen width

    return Column(
      children: [
        Container(
          width: imageWidth,
          height: imageHeight,
          decoration: BoxDecoration(
            border: Border.all(color: Colors.grey.shade400, width: 2),
            borderRadius: BorderRadius.circular(10),
            boxShadow: [
              BoxShadow(
                color: Colors.black12,
                blurRadius: 6,
                offset: Offset(2, 2),
              )
            ],
          ),
          clipBehavior: Clip.antiAlias,
          child: Image.network(
            _imageList[_currentIndex],
            fit: BoxFit.cover,
          ),
        ),
        SizedBox(height: 5),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            IconButton(
              icon: Icon(Icons.arrow_back),
              onPressed: _previousImage,
            ),
            IconButton(
              icon: Icon(Icons.arrow_forward),
              onPressed: _nextImage,
            ),
          ],
        ),
      ],
    );
  }
}

class ProductCard extends StatelessWidget {
  final String title;
  final String rating;
  final Color color;

  const ProductCard(this.title, this.rating, this.color, {super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ProductDetailsPage(
              title: title,
              rating: rating,
              color: color,
            ),
          ),
        );
      },
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white24,
          borderRadius: BorderRadius.circular(15),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              // 'assets/images/${title.toLowerCase().replaceAll(" ", "_")}.png',
              'assets/images/jeans.png', //Dynamic image path
              width: 80,
              height: 80,
              fit: BoxFit.cover,
            ),
            const SizedBox(height: 10),
            Text(
              "★ $rating",
              style: const TextStyle(
                  fontSize: 16, fontWeight: FontWeight.bold, color: Colors.white),
            ),
            const SizedBox(height: 5),
            Text(
              title,
              style: const TextStyle(
                  fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white),
            ),
          ],
        ),
      ),
    );
  }
}
//Page

class BlogPage extends StatelessWidget {
  const BlogPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Blog")),
      body: Center(child: Text("Blog Page")),
    );
  }
}

class ContactPage extends StatelessWidget {
  const ContactPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Contact")),
      body: Center(child: Text("Contact Page")),
    );
  }
}

class AboutPage extends StatelessWidget {
  const AboutPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("About")),
      body: Center(child: Text("About Page")),
    );
  }
}

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Settings")),
      body: Center(
        child: Image.asset(
          'assets/images/women.png',
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
