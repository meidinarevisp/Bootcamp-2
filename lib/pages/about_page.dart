import 'package:flutter/material.dart';
import '../components/footer.dart';

class AboutPage extends StatelessWidget {
  final List<Map<String, String>> teamMembers = [
    {'name': 'Anna', 'position': 'Manager', 'image': 'assets/person.jpg'},
    {'name': 'Mark', 'position': 'Head Baker', 'image': 'assets/person.jpg'},
    {'name': 'Sophie', 'position': 'Pastry Chef', 'image': 'assets/person.jpg'},
    {
      'name': 'James',
      'position': 'Production Assistant',
      'image': 'assets/person.jpg',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          // Removed Hero Section with Background Image

          // Short Statement About the Bakery
          Container(
            padding: EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: Colors.brown[50],
              border: Border.all(color: Colors.brown[300]!),
            ),
            child: Center(
              child: Text(
                "At our bakery, we craft delicious, freshly baked goods made with the finest ingredients. Our mission is to bring joy to every customer with our artisanal bread, pastries, and cakes.",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                  color: Colors.brown[700],
                ),
              ),
            ),
          ),
          SizedBox(height: 30),

          // Our Team Section
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Meet Our Team",
                  style: TextStyle(
                    fontSize: 26,
                    fontWeight: FontWeight.bold,
                    color: Colors.brown[800],
                  ),
                ),
                SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children:
                      teamMembers.map((member) {
                        return _buildTeamMember(
                          member['name']!,
                          member['position']!,
                          member['image']!,
                        );
                      }).toList(),
                ),
              ],
            ),
          ),
          SizedBox(height: 30),

          // Short Statement About the Bakery's Story
          Container(
            padding: EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Colors.white,
              border: Border.all(color: Colors.brown[300]!),
            ),
            child: Column(
              children: [
                Text(
                  "About Our Bakery",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.brown[900], // Warna gelap seperti hitam
                  ),
                ),
                SizedBox(height: 10),
                Text(
                  "Founded in 2010, our bakery started with a simple goal: to make the best bread and pastries in town. Over the years, we've expanded our menu and our passion for baking has only grown stronger. We believe in quality, craftsmanship, and most importantly, the love that goes into every loaf we bake.",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 16,
                    color:
                        Colors
                            .brown[800], // Teks utama tetap dominan coklat gelap
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 30),

          // Bakery History
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Our Journey",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.brown[800],
                  ),
                ),
                SizedBox(height: 10),
                Row(
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          _buildHistoryItem(
                            "2010",
                            "Our bakery was founded with a passion for creating high-quality baked goods.",
                          ),
                          _buildHistoryItem(
                            "2012",
                            "We introduced a variety of pastries, including croissants and danishes.",
                          ),
                        ],
                      ),
                    ),
                    SizedBox(width: 20),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          _buildHistoryItem(
                            "2015",
                            "Expanded our menu to include gluten-free options and seasonal cakes.",
                          ),
                          _buildHistoryItem(
                            "2020",
                            "Opened a new location to accommodate our growing customer base.",
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Footer(),
        ],
      ),
    );
  }

  Widget _buildHistoryItem(String year, String description) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "$year:",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.brown[800],
            ),
          ),
          SizedBox(width: 8),
          Expanded(
            child: Text(
              description,
              style: TextStyle(fontSize: 14, color: Colors.brown[600]),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTeamMember(String name, String position, String imagePath) {
    return Column(
      children: [
        Container(
          width: 80,
          height: 80,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            image: DecorationImage(
              image: AssetImage(imagePath),
              fit: BoxFit.cover,
            ),
            border: Border.all(color: Colors.brown[300]!),
          ),
        ),
        SizedBox(height: 8),
        Text(
          name,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 16,
            color: Colors.brown[800],
          ),
          textAlign: TextAlign.center,
        ),
        SizedBox(height: 4),
        // Display truncated position below the name
        Text(
          position.length > 12 ? "${position.substring(0, 12)}..." : position,
          style: TextStyle(color: Colors.brown[600], fontSize: 14),
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}
