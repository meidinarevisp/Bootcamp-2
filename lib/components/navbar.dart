import 'package:flutter/material.dart';

class Navbar extends StatelessWidget implements PreferredSizeWidget {
  final int currentIndex;
  final Function(int) onTabSelected;

  Navbar({required this.currentIndex, required this.onTabSelected});

  @override
  Size get preferredSize => Size.fromHeight(60);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: false,
      backgroundColor: const Color.fromARGB(255, 44, 43, 44),
      elevation: 1,
      title: Row(
        children: [
          // Logo
          Container(
            height: 33,
            width: 33,
            decoration: BoxDecoration(
              color: const Color.fromARGB(255, 248, 252, 228),
              borderRadius: BorderRadius.circular(20),
            ),
            child: Center(
              child: Text(
                "RV",
                style: TextStyle(
                  color: const Color.fromARGB(255, 72, 71, 71),
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
              ),
            ),
          ),
          SizedBox(width: 8),
          // Tambahan Teks "Bakery"
          Text(
            "Bakery",
            style: TextStyle(
              color: Colors.white,
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),

      centerTitle: false,
      leadingWidth: 0,
      actions: [
        _buildNavItem("Home", 0),
        _buildNavItem("Product", 1),
        _buildNavItem("About", 2),
        _buildNavItem("News", 3),
        // IconButton with search is removed here
      ],
    );
  }

  Widget _buildNavItem(String title, int index) {
    final isSelected = currentIndex == index;
    return Container(
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(
            color: isSelected ? Colors.grey.shade300 : Colors.transparent,
            width: 2,
          ),
        ),
      ),
      child: TextButton(
        onPressed: () => onTabSelected(index),
        child: Text(
          title,
          style: TextStyle(
            color: Colors.white,
            fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
          ),
        ),
      ),
    );
  }
}
