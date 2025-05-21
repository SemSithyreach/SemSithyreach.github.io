import 'package:flutter/material.dart';

class ProductPage extends StatefulWidget {
  const ProductPage({super.key});

  @override
  State<ProductPage> createState() => _ProductPageState();
}

class _ProductPageState extends State<ProductPage> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();
  final TextEditingController priceController = TextEditingController();

  List<Map<String, String>> productList = [];

  void insertProduct() {
    setState(() {
      productList.add({
        'name': nameController.text,
        'description': descriptionController.text,
        'price': priceController.text,
      });
      clearFields();
    });
  }

  void updateProduct(int index) {
    setState(() {
      productList[index] = {
        'name': nameController.text,
        'description': descriptionController.text,
        'price': priceController.text,
      };
      clearFields();
    });
  }

  void deleteProduct(int index) {
    setState(() {
      productList.removeAt(index);
    });
  }

  void clearFields() {
    nameController.clear();
    descriptionController.clear();
    priceController.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Product Page')),
      body: LayoutBuilder(
        builder: (context, constraints) {
          bool isMobile = constraints.maxWidth < 600;

          return SingleChildScrollView(
            padding: const EdgeInsets.all(16),
            child: Column(
              children: [
                // Product Image Placeholder
                Container(
                  height: 150,
                  width: double.infinity,
                  color: Colors.grey[300],
                  child: const Icon(Icons.image, size: 100),
                ),
                const SizedBox(height: 16),

                // Input Fields
                TextField(
                  controller: nameController,
                  decoration: const InputDecoration(labelText: 'Text box'),
                ),
                const SizedBox(height: 8),

                TextField(
                  controller: descriptionController,
                  decoration: const InputDecoration(labelText: 'Text area'),
                  maxLines: 3,
                ),
                const SizedBox(height: 8),

                TextField(
                  controller: priceController,
                  decoration: const InputDecoration(labelText: 'Number text box'),
                  keyboardType: TextInputType.number,
                ),
                const SizedBox(height: 16),

                // Action Buttons
                Wrap(
                  spacing: 10,
                  runSpacing: 10,
                  children: [
                    ElevatedButton(
                      onPressed: insertProduct,
                      child: const Text('Insert'),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        if (productList.isNotEmpty) updateProduct(0); // Example: update first
                      },
                      child: const Text('Update'),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        if (productList.isNotEmpty) deleteProduct(0); // Example: delete first
                      },
                      child: const Text('Delete'),
                    ),
                  ],
                ),
                const SizedBox(height: 20),

                // Product List
                if (productList.isNotEmpty)
                  ListView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: productList.length,
                    itemBuilder: (context, index) {
                      final product = productList[index];
                      return Card(
                        child: ListTile(
                          title: Text(product['name']!),
                          subtitle: Text('Price: \$${product['price']}'),
                          trailing: IconButton(
                            icon: const Icon(Icons.delete),
                            onPressed: () => deleteProduct(index),
                          ),
                          onTap: () {
                            nameController.text = product['name']!;
                            descriptionController.text = product['description']!;
                            priceController.text = product['price']!;
                          },
                        ),
                      );
                    },
                  )
                else
                  const Text('No products added yet.'),
              ],
            ),
          );
        },
      ),
    );
  }
}
