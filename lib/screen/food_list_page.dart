

import 'package:flutter/material.dart';

import '../models/food.dart';

import 'food_detail_page.dart';

class FoodListPage extends StatelessWidget {
  final String username;

  const FoodListPage({super.key, required this.username});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white, // Warna latar belakang halaman

      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0, // Menghilangkan bayangan di bawah AppBar

        title: Text(
          'Selamat datang, $username!',
          style: const TextStyle(
            color: Colors.black87,
            fontWeight: FontWeight.bold,
            fontSize: 18,
          ),
        ),

        automaticallyImplyLeading: false,
      ),

      body: ListView.builder(
        padding: const EdgeInsets.all(12), // Padding di semua sisi list

        itemCount: dummyFoods.length,

        itemBuilder: (context, index) {
          final Food food = dummyFoods[index];

          return GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => FoodDetailPage(food: food),
                ),
              );
            },

            child: Card(
              margin: const EdgeInsets.symmetric(vertical: 6, horizontal: 4),

              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),

              elevation: 2, // Tinggi bayangan (0 = flat, semakin besar = lebih tinggi)

              child: Padding(
                padding: const EdgeInsets.all(10), // Padding dalam card

                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(8),

                      child: Image.network(
                        food.image, // URL gambar dari data makanan
                        width: 80,
                        height: 80,
                        fit: BoxFit.cover, // Gambar memenuhi area, dipotong jika perlu

                        loadingBuilder: (context, child, loadingProgress) {
                          if (loadingProgress == null) return child;

                          return Container(
                            width: 80,
                            height: 80,
                            color: Colors.grey.shade200,
                            child: const Center(
                              child: CircularProgressIndicator(strokeWidth: 2),
                            ),
                          );
                        },

                        errorBuilder: (context, error, stackTrace) {
                          return Container(
                            width: 80,
                            height: 80,
                            color: Colors.grey.shade300,
                            child: const Icon(Icons.broken_image, color: Colors.grey),
                          );
                        },
                      ),
                    ),

                    const SizedBox(width: 12), // Spacing antara gambar dan info

                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start, // Rata kiri
                        children: [
                          Text(
                            food.name,
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 15,
                            ),
                          ),

                          const SizedBox(height: 4), // Spacing vertikal

                          Text(
                            food.category,
                            style: const TextStyle(
                              color: Colors.grey,
                              fontSize: 13,
                            ),
                          ),

                          const SizedBox(height: 6),

                          Text(
                            'Rp ${food.price}',
                            style: const TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w600,
                              color: Colors.orange,
                            ),
                          ),
                        ],
                      ),
                    ),

                    Align(
                      alignment: Alignment.centerRight, // Rata kanan tengah

                      child: OutlinedButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => FoodDetailPage(food: food),
                            ),
                          );
                        },

                        style: OutlinedButton.styleFrom(
                          foregroundColor: Colors.orange, // Warna teks dan icon
                          side: const BorderSide(color: Colors.orange), // Warna border
                          padding: const EdgeInsets.symmetric(
                            horizontal: 14,
                            vertical: 6,
                          ),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(6),
                          ),
                        ),

                        child: const Text('Pesan', style: TextStyle(fontSize: 12)),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

