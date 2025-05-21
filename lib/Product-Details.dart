import 'package:flutter/material.dart';
import 'navbar-bottom.dart';
import 'payments.dart';

class ProductListPage extends StatefulWidget {
  const ProductListPage({super.key});

  @override
  _ProductListPageState createState() => _ProductListPageState();
}

class _ProductListPageState extends State<ProductListPage> {
  int _selectedIndex = 0;

  void _onTabChanged(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  void _navigateToProductDetails(String title, String rating, Color color) {
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
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(title: Text("Product List"),
        automaticallyImplyLeading: false,
      ),

      backgroundColor: Colors.purple[300],
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.05, vertical: 10),
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
          Expanded(
            child: GridView.count(
              crossAxisCount: screenWidth > 600 ? 3 : 2,
              crossAxisSpacing: 10,
              mainAxisSpacing: 10,
              padding: EdgeInsets.all(10),
              children: [
                ProductCard("T-shirt", "4.7", Colors.white24, onTap: () => _navigateToProductDetails("T-shirt", "4.7", Colors.black)),
                ProductCard("Long sleeve", "4.5", Colors.white24, onTap: () => _navigateToProductDetails("Long sleeve", "4.5", Colors.black87)),
                ProductCard("Jacket", "5.0", Colors.white24, onTap: () => _navigateToProductDetails("Jacket", "5.0", Colors.red)),
                ProductCard("Hoodie", "5.0", Colors.white24, onTap: () => _navigateToProductDetails("Hoodie", "5.0", Colors.white)),
                ProductCard("Sweater", "4.8", Colors.white24, onTap: () => _navigateToProductDetails("Sweater", "4.8", Colors.blueGrey)),
                ProductCard("Jeans", "4.6", Colors.white24, onTap: () => _navigateToProductDetails("Jeans", "4.6", Colors.blue)),
              ],
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavBar(
        currentIndex: _selectedIndex,
        onTabChanged: _onTabChanged,
      ),
    );
  }
}



class ProductCard extends StatelessWidget {
  final String title;
  final String rating;
  final Color color;
  final VoidCallback onTap;

  const ProductCard(this.title, this.rating, this.color, {super.key, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap, // Navigate to product details
      child: Card(
        color: color,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                'assets/images/jeans.png', // Ensure imagePath is correctly passed to this widget
                width: 90,
                height: 90,
                fit: BoxFit.cover,
              ),
              Text(title, style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.lightBlueAccent)),
              SizedBox(height: 5),
              Text("⭐ $rating", style: TextStyle(color: Colors.lightBlueAccent)),
            ],
          ),
        ),
      ),
    );
  }
}

class ProductDetailsPage extends StatelessWidget {
  final String title;
  final String rating;
  final Color color;

  const ProductDetailsPage({super.key, required this.title, required this.rating, required this.color});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(title)),
      body: Stack(
        children: [
          // Background with Product Color
          Container(color: color),
          // Dark overlay for readability
          Container(color: Colors.black.withOpacity(0.5)),
          // Product Details Content
          Center(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    'assets/images/jeans.png', // Ensure correct image path
                    width: 160,
                    height: 160,
                    fit: BoxFit.cover,
                  ),
                  Text(
                    title,
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.white),
                  ),
                  SizedBox(height: 10),
                  Text(
                    "⭐ $rating",
                    style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: Colors.orangeAccent),
                  ),
                  SizedBox(height: 20),

                  // "Add to Cart" Button
                  ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => PaymentPage()), // Navigate to Payment Page
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.orange,
                      padding: EdgeInsets.symmetric(horizontal: 30, vertical: 15),
                    ),
                    child: Text("Proceed to Payment", style: TextStyle(color: Colors.white, fontSize: 18)),
                  ),

                  SizedBox(height: 20),
                  Text(
                    "This stylish $title offers premium comfort and a modern fit. Available in multiple colors.",
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 16, color: Colors.white),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}