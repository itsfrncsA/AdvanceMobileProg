import 'package:flutter/material.dart';

import '../models/product_model.dart';
import '../widgets/custom_text.dart';

// Enhancement 2: Product details page screen displaying complete product information.
class ProductScreen extends StatelessWidget {
  final Product product;

  const ProductScreen({
    super.key,
    required this.product,
  });

  @override
  Widget build(BuildContext context) {
    final gallery = product.images.isNotEmpty
        ? product.images
        : [product.thumbnail];

    return Scaffold(
      appBar: AppBar(
        title: const Text('Product Details'),
      ),
      body: ListView(
        padding: const EdgeInsets.only(bottom: 32),
        children: [
          Hero(
            tag: 'product-${product.id}',
            child: SizedBox(
              height: 280,
              child: Image.network(
                gallery.first,
                fit: BoxFit.cover,
                errorBuilder: (_, __, ___) => const Center(
                  child: Icon(Icons.image_not_supported, size: 64),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Wrap(
                  spacing: 8,
                  runSpacing: 8,
                  children: [
                    Chip(label: Text(product.category)),
                    if (product.brand.isNotEmpty)
                      Chip(label: Text(product.brand)),
                  ],
                ),
                const SizedBox(height: 12),
                CustomText(
                  product.title,
                  fontSize: 27,
                  fontWeight: FontWeight.bold,
                ),
                const SizedBox(height: 12),
                Text(
                  'PHP ${product.price.toStringAsFixed(2)}',
                  style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                    color: Theme.of(context).colorScheme.primary,
                  ),
                ),
                const SizedBox(height: 20),
                Row(
                  children: [
                    const Icon(Icons.star, color: Colors.amber),
                    const SizedBox(width: 5),
                    Text('${product.rating.toStringAsFixed(1)} rating'),
                    const SizedBox(width: 20),
                    const Icon(Icons.inventory_2_outlined),
                    const SizedBox(width: 5),
                    Text('${product.stock} in stock'),
                  ],
                ),
                const SizedBox(height: 24),
                const CustomText(
                  'Description',
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
                const SizedBox(height: 8),
                Text(
                  product.description,
                  style: const TextStyle(fontSize: 16, height: 1.6),
                ),
                const SizedBox(height: 24),
                const CustomText(
                  'Discount',
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
                const SizedBox(height: 8),
                Text(
                  '${product.discountPercentage.toStringAsFixed(1)}% off',
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
