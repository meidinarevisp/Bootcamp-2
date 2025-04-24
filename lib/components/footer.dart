import 'package:flutter/material.dart';

class Footer extends StatelessWidget {
  const Footer({super.key}); // Menambahkan konstruktor const

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color.fromARGB(255, 44, 43, 44),
      padding: const EdgeInsets.all(15),
      child: Column(
        children: [
          // Nama Toko
          const Text(
            "RV Bakery", // Nama toko
            style: TextStyle(color: Colors.white, fontSize: 15),
          ),
          const SizedBox(
            height: 5,
          ), // Spacer between name and social media links
          // Social Media Links
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              IconButton(
                icon: const Icon(Icons.facebook, color: Colors.white),
                onPressed: () {},
              ),
              IconButton(
                icon: const Icon(Icons.link, color: Colors.white),
                onPressed: () {},
              ),
              IconButton(
                icon: const Icon(Icons.telegram, color: Colors.white),
                onPressed: () {},
              ),
            ],
          ),
        ],
      ),
    );
  }
}
