import 'package:flutter/material.dart';

class FeaturePage extends StatelessWidget {
  const FeaturePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Feature")),
      backgroundColor: Colors.purple[300],
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              "Menu",
              style: TextStyle(
                  fontSize: 26,
                  fontWeight: FontWeight.bold,
                  color: Colors.black),
            ),
            const SizedBox(height: 5),
            const Text(
              "Hello Sem sithyreach",
              style: TextStyle(fontSize: 16, color: Colors.black),
            ),
            // Subtitle
            const Text(
              "Explore Our New Collections",
              style: TextStyle(fontSize: 16, color: Colors.black),
            ),
            const SizedBox(height: 20),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Column(
                  children: [
                    CircleAvatar(
                      radius: 30,
                      backgroundImage: NetworkImage(
                        "https://m.media-amazon.com/images/I/71RCpARjYNL._AC_UL320_.jpg",
                      ),
                    ),
                    const SizedBox(height: 15),
                    ClipRRect(
                      borderRadius: BorderRadius.circular(30), // Radius of 30
                      child: Image.network(
                        "https://m.media-amazon.com/images/I/710gXpgq+WL._AC_UL320_.jpg",
                        width: 60,
                        height: 60,
                        fit: BoxFit.cover,
                      ),
                    ), // **Added missing comma here**
                    const SizedBox(height: 5),
                    const Text(
                      "Women",
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                  ],

                ),
                Column(
                  children: [
                    CircleAvatar(
                      radius: 30,
                      backgroundImage: NetworkImage(
                        "https://m.media-amazon.com/images/I/61UAwxBzgpL._AC_UL320_.jpg",
                      ),
                    ),
                    const SizedBox(height: 15),
                    ClipRRect(
                      borderRadius: BorderRadius.circular(30), // Radius of 30
                      child: Image.network(
                        "https://img.businessoffashion.com/resizer/v2/https%3A%2F%2Fprod-bof-media.s3.eu-west-1.amazonaws.com%2Fimport%2Fprofiles%2Fasset%2F1777760340287944%2Fburna-boy-crop-1777760441394679.jpg?auth=8435179b7ddd8c279542725afe389d66464d9b16c79627ec939db6918ce8eb88&width=960&height=540&smart=true",
                        width: 60,
                        height: 60,
                        fit: BoxFit.cover,
                      ),
                    ), // **Added missing comma here**
                    const SizedBox(height: 5),
                    const Text(
                      "Women",
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                  ],

                ),
                Column(
                  children: [
                    CircleAvatar(
                      radius: 30,
                      backgroundImage: NetworkImage(
                        "https://media.istockphoto.com/id/1393137501/photo/teen-boy-with-braces-smiling-outside-in-summer.webp?b=1&s=612x612&w=0&k=20&c=Pm5briUUbfS6lwIfle4odz9MtcQJhzONIQor7h7eGOA=",
                      ),
                    ),
                    const SizedBox(height: 15),
                    ClipRRect(
                      borderRadius: BorderRadius.circular(30), // Radius of 30
                      child: Image.network(
                        "https://m.media-amazon.com/images/I/71Ix9gS23uL._AC_UL320_.jpg",
                        width: 60,
                        height: 60,
                        fit: BoxFit.cover,
                      ),
                    ), // **Added missing comma here**
                    const SizedBox(height: 5),
                    const Text(
                      "Women",
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                  ],

                ),
                Column(
                  children: [
                    CircleAvatar(
                      radius: 30,
                      backgroundImage: NetworkImage(
                        "https://m.media-amazon.com/images/I/715V+XSz1GL._AC_UL320_.jpg",
                      ),
                    ),
                    const SizedBox(height: 15),
                    ClipRRect(
                      borderRadius: BorderRadius.circular(30), // Radius of 30
                      child: Image.network(
                        "https://img.freepik.com/free-photo/front-view-smiley-girl-outdoors_52683-99768.jpg",
                        width: 60,
                        height: 60,
                        fit: BoxFit.cover,
                      ),
                    ), // **Added missing comma here**
                    const SizedBox(height: 5),
                    const Text(
                      "Women",
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                  ],

                ),
              ],
            ),
            // Add an image (ensure you have an asset image or network image)
            const SizedBox(height: 25),
            // Search Bar
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: TextField(
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.white,
                  prefixIcon: const Icon(Icons.search, color: Colors.grey),
                  hintText: "Search for products",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(25),
                    borderSide: BorderSide.none,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 40),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: GridView.count(
                  crossAxisCount: 2, // 2 columns
                  crossAxisSpacing: 12,
                  mainAxisSpacing: 12,
                  children: [
                    ProductItem(
                        "https://static.vecteezy.com/system/resources/thumbnails/041/714/543/small_2x/ai-generated-black-blank-t-shirt-front-mockup-on-a-transparent-background-png.png",
                        "T-shirt",
                        "4.7"
                    ),
                    ProductItem(
                        "https://static.vecteezy.com/system/resources/thumbnails/041/714/543/small_2x/ai-generated-black-blank-t-shirt-front-mockup-on-a-transparent-background-png.png",
                        "Long sleeve",
                        "4.5"),
                    ProductItem(
                        "https://static.vecteezy.com/system/resources/thumbnails/041/714/543/small_2x/ai-generated-black-blank-t-shirt-front-mockup-on-a-transparent-background-png.png",
                        "Jacket",
                        "5.0"),
                    ProductItem(
                        "https://static.vecteezy.com/system/resources/thumbnails/041/714/543/small_2x/ai-generated-black-blank-t-shirt-front-mockup-on-a-transparent-background-png.png",
                        "Hoodie",
                        "5.0"),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

Widget ProductItem(String imageUrl, String name, String rating) {
  return Container(
    decoration: BoxDecoration(
      color: Colors.white24,
      borderRadius: BorderRadius.circular(12),
    ),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.network(imageUrl, width: 80, height: 80, fit: BoxFit.contain),
        const SizedBox(height: 5),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(Icons.star, color: Colors.white, size: 18),
            const SizedBox(width: 3),
            Text(rating,
                style: const TextStyle(fontSize: 14, color: Colors.white)),
          ],
        ),
        const SizedBox(height: 5),
        Text(name,
            style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Colors.white)),
      ],
    ),
  );
}
