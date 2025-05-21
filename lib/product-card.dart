import 'package:flutter/material.dart';
import 'Product-Details.dart'; // Import the ProductDetailsPage

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
          color: Colors.pinkAccent,
          borderRadius: BorderRadius.circular(15),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/images/${title.toLowerCase().replaceAll(" ", "_")}.png', // Dynamic image path
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
