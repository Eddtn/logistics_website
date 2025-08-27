import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:google_fonts/google_fonts.dart';

class TestimonySection extends StatefulWidget {
  const TestimonySection({super.key});

  @override
  State<TestimonySection> createState() => _TestimonySectionState();
}

class _TestimonySectionState extends State<TestimonySection> {
  int currentIndex = 0;

  final List<Map<String, String>> items = const [
    {
      'name': 'Alice Johnson',
      'image': 'assets/images/testimonial-1.jpg',
      'quote': '“Be the change you wish to see.”',
      'desc': 'A passionate Flutter developer.',
    },
    {
      'name': 'Alice Johnson',
      'image': 'assets/images/testimonial-2.jpg',
      'quote': '“Be the change you wish to see.”',
      'desc': 'A passionate Flutter developer.',
    },
    {
      'name': 'Bob Smith',
      'image': 'assets/images/testimonial-3.jpg',
      'quote': '“Code is poetry.”',
      'desc': 'Enjoys building mobile apps.',
    },
    {
      'name': 'Carol White',
      'image': 'assets/images/testimonial-4.jpg',
      'quote': '“Stay hungry, stay foolish.”',
      'desc': 'UI/UX designer turned coder.',
    },
  ];

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    final bool isMobile = screenWidth < 600;
    final bool isTablet = screenWidth > 600 && screenWidth <= 1000;
    final bool isDesktop = screenWidth > 1000;

    return Container(
      margin: EdgeInsets.only(left: 80, right: 80),
      width: screenWidth * 0.9,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "Testimonial",
            style: GoogleFonts.poppins(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Color(0xFFFF4800),
            ),
          ),

          Text(
            "Our Clients Say",
            style: GoogleFonts.poppins(
              fontSize: 40,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
          CarouselSlider.builder(
            itemCount: items.length,

            options: CarouselOptions(
              height: isMobile ? screenHeight * 0.3 : screenHeight * 0.25,

              aspectRatio: 1.5,
              autoPlay: true,
              viewportFraction: isMobile ? 0.9 : 0.34,
              enlargeCenterPage: true,
              enlargeStrategy: CenterPageEnlargeStrategy.scale,
              enableInfiniteScroll: true,
              onPageChanged: (index, reason) {
                setState(() {
                  currentIndex = index;
                });
              },
            ),
            itemBuilder: (context, index, realIndex) {
              bool isCenter = index == currentIndex;
              return TestimonyCard(data: items[index], isHighlighted: isCenter);
            },
          ),
          const SizedBox(height: 16),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: items.asMap().entries.map((entry) {
              bool isActive = currentIndex == entry.key;
              return AnimatedContainer(
                duration: const Duration(milliseconds: 1000),
                margin: const EdgeInsets.symmetric(horizontal: 4),
                width: isActive ? 12 : 8,
                height: isActive ? 12 : 8,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: isActive ? Color(0xFFFF4800) : Colors.grey[400],
                ),
              );
            }).toList(),
          ),
        ],
      ),
    );
  }
}

class TestimonyCard extends StatelessWidget {
  final Map<String, String> data;
  final bool isHighlighted;

  const TestimonyCard({
    super.key,
    required this.data,
    this.isHighlighted = false,
  });

  @override
  Widget build(BuildContext context) {
    // padding: const EdgeInsets.only(left: 60, right: 60),
    return AnimatedOpacity(
      duration: const Duration(milliseconds: 500),
      opacity: isHighlighted ? 1.0 : 0.4, // inactive = transparent
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 1000),
        // margin: const EdgeInsets.symmetric(horizontal: 6),
        // padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(color: Colors.grey.shade100),
        child: Stack(
          clipBehavior: Clip.none, // allow icon to overflow
          children: [
            Positioned(
              top: -30, // push slightly above container
              right: -10, // push slightly beyond container edge
              child: Icon(
                Icons.format_quote,
                size: 80,
                color: const Color(0xffFF4800),
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 15),
                Row(
                  children: [
                    CircleAvatar(
                      radius: 24,
                      backgroundImage: AssetImage(data['image']!),
                    ),
                    const SizedBox(width: 10),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          data['name']!,
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 15,
                          ),
                        ),
                        Text(
                          data['desc']!,
                          style: TextStyle(
                            fontSize: 13,
                            color: Colors.grey[800],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                Text(
                  data['quote']!,
                  style: TextStyle(
                    fontStyle: FontStyle.italic,
                    fontSize: 14,
                    color: Colors.grey[600],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
