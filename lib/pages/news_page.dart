import 'package:flutter/material.dart';
import '../components/footer.dart';

class NewsPage extends StatefulWidget {
  @override
  _NewsPageState createState() => _NewsPageState();
}

class _NewsPageState extends State<NewsPage> {
  int _currentCarouselIndex = 0;
  final PageController _carouselController = PageController();

  final List<String> newsImages = [
    'assets/news2.jpg',
    'assets/news3.jpg',
    'assets/news4.jpg',
    'assets/news5.jpg',
  ];

  final List<String> newsTitles = [
    "Roti Baru Rasa Pandan Meluncur Minggu Ini!",
    "Workshop Baking Gratis, Yuk Daftar Sekarang!",
    "Promo Spesial HUT ke-10 Toko Kami!",
    "Chef Sophie Raih Penghargaan Pastry Nasional",
  ];

  @override
  void dispose() {
    _carouselController.dispose();
    super.dispose();
  }

  void _nextCarousel() {
    final nextIndex = (_currentCarouselIndex + 1) % 3;
    _carouselController.animateToPage(
      nextIndex,
      duration: Duration(milliseconds: 300),
      curve: Curves.easeInOut,
    );
  }

  void _previousCarousel() {
    final prevIndex = (_currentCarouselIndex - 1 + 3) % 3;
    _carouselController.animateToPage(
      prevIndex,
      duration: Duration(milliseconds: 300),
      curve: Curves.easeInOut,
    );
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Container(
            height: 200,
            child: Stack(
              children: [
                PageView.builder(
                  controller: _carouselController,
                  itemCount: 3,
                  onPageChanged: (index) {
                    setState(() {
                      _currentCarouselIndex = index;
                    });
                  },
                  itemBuilder: (context, index) {
                    return Container(
                      margin: EdgeInsets.all(3),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        image: DecorationImage(
                          image: AssetImage("assets/news1.jpg"),
                          fit: BoxFit.cover,
                        ),
                      ),
                    );
                  },
                ),
                Positioned.fill(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      IconButton(
                        icon: Icon(
                          Icons.chevron_left,
                          size: 32,
                          color: Colors.white,
                        ),
                        onPressed: _previousCarousel,
                      ),
                      IconButton(
                        icon: Icon(
                          Icons.chevron_right,
                          size: 32,
                          color: Colors.white,
                        ),
                        onPressed: _nextCarousel,
                      ),
                    ],
                  ),
                ),
                Positioned(
                  bottom: 10,
                  left: 0,
                  right: 0,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: List.generate(
                      3,
                      (index) => AnimatedContainer(
                        duration: Duration(milliseconds: 300),
                        margin: EdgeInsets.symmetric(horizontal: 4),
                        width: _currentCarouselIndex == index ? 12 : 8,
                        height: 8,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color:
                              _currentCarouselIndex == index
                                  ? Colors.brown
                                  : Colors.grey[400],
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 24),

          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: GridView.builder(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 16,
                mainAxisSpacing: 16,
                childAspectRatio: 0.73,
              ),
              itemCount: newsImages.length,
              itemBuilder: (context, index) {
                return Card(
                  elevation: 3,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  color: Colors.brown[50],
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.vertical(
                          top: Radius.circular(12),
                        ),
                        child: Image.asset(
                          newsImages[index],
                          height: 120,
                          width: double.infinity,
                          fit: BoxFit.cover,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              newsTitles[index],
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 14,
                                color: Colors.brown[800],
                              ),
                              maxLines: 2, // maksimal 2 baris
                              overflow:
                                  TextOverflow.ellipsis, // potong dengan ...
                            ),
                            SizedBox(height: 4),
                            Align(
                              alignment: Alignment.center,
                              child: Padding(
                                padding: const EdgeInsets.only(top: 8.0),
                                child: ElevatedButton(
                                  onPressed: () {
                                    // Navigasi ke detail
                                  },
                                  child: Text(
                                    "Read More",
                                    style: TextStyle(color: Colors.white),
                                  ),
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: Color.fromARGB(
                                      255,
                                      107,
                                      69,
                                      38,
                                    ),
                                    padding: EdgeInsets.symmetric(
                                      horizontal: 16,
                                      vertical: 8,
                                    ),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(8),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
          SizedBox(height: 20),

          Center(
            child: TextButton.icon(
              onPressed: () {},
              icon: Icon(Icons.keyboard_arrow_down, color: Colors.brown),
              label: Text("More News", style: TextStyle(color: Colors.brown)),
            ),
          ),
          Footer(),
        ],
      ),
    );
  }
}
