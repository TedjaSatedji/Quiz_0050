import 'package:flutter/material.dart';

import '../models/food.dart';

class FoodDetailPage extends StatefulWidget {
  final Food food;

  const FoodDetailPage({super.key, required this.food});

  @override
  State<FoodDetailPage> createState() => _FoodDetailPageState();
}

class _FoodDetailPageState extends State<FoodDetailPage> {
  final TextEditingController _qtyController = TextEditingController(text: '1');

  @override
  void dispose() {
    _qtyController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: const Text(
          'Detail Page',
          style: TextStyle(
            color: Colors.black87,
            fontWeight: FontWeight.bold,
          ),
        ),
        iconTheme: const IconThemeData(color: Colors.black87),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start, // Rata kiri
          children: [
            Image.network(
              widget.food.image,
              width: double.infinity,
              height: 220,
              fit: BoxFit.cover,
              loadingBuilder: (context, child, loadingProgress) {
                if (loadingProgress == null) return child; // Loading selesai
                return Container(
                  height: 220,
                  color: Colors.grey.shade200,
                  child: const Center(child: CircularProgressIndicator()),
                );
              },
              errorBuilder: (context, error, stackTrace) {
                return Container(
                  height: 220,
                  color: Colors.grey.shade300,
                  child: const Center(
                    child:
                        Icon(Icons.broken_image, size: 60, color: Colors.grey),
                  ),
                );
              },
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child: Text(
                          widget.food.name,
                          style: const TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.bold,
                            color: Colors.black87,
                          ),
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 10,
                          vertical: 4,
                        ),
                        decoration: BoxDecoration(
                          color:
                              Colors.orange.shade100, // Background oranye muda
                          borderRadius: BorderRadius.circular(20), // Pill shape
                        ),
                        child: Text(
                          widget.food.category,
                          style: TextStyle(
                            fontSize: 12,
                            color: Colors.orange.shade800,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 8),

                  Row(
                    children: [
                      Text(
                        'Rp ${widget.food.price}',
                        style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.orange,
                        ),
                      ),
                      const Spacer(),
                    ],
                  ),
                  const SizedBox(height: 16),

                  Text(
                    widget.food.description,
                    style: const TextStyle(
                      fontSize: 14,
                      color: Colors.black87,
                      height: 1.6, // Line height (jarak antar baris)
                    ),
                  ),
                  const SizedBox(height: 16),

                  RichText(
                    text: TextSpan(
                      style:
                          const TextStyle(fontSize: 14, color: Colors.black87),
                      children: [
                        const TextSpan(
                          text: 'Komposisi  ',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        TextSpan(text: widget.food.ingredients.join(', ')),
                      ],
                    ),
                  ),
                  const SizedBox(height: 24),

                  const Divider(), // Garis pembatas horizontal
                  const SizedBox(height: 12),

                  Row(
                    children: [],
                  ),
                  const SizedBox(height: 12),

                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: ()  {
                        final snackdemo = SnackBar(
                          content:
                              Text('Berhasil membeli ${widget.food.name}'),
                          backgroundColor: Colors.green,
                          elevation: 10,
                          behavior: SnackBarBehavior.floating,
                          margin: EdgeInsets.all(5),
                        );
                        ScaffoldMessenger.of(context).showSnackBar(snackdemo);
                      }, 
                      style: ElevatedButton.styleFrom(
                        backgroundColor:
                            Colors.orange, // Warna background tombol
                        foregroundColor: Colors.white, // Warna teks
                        padding: const EdgeInsets.symmetric(vertical: 14),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                        elevation: 0, // Tanpa bayangan
                      ),
                      child: const Text(
                        'Checkout',
                        style: TextStyle(fontSize: 16),
                      ),
                    ),
                  ),
                  const SizedBox(height: 24),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
