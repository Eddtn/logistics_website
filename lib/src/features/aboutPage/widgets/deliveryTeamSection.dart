import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:logistics_website/src/features/homescreen/widgets/teamWidget.dart';

class DeliveryTeamSection extends StatefulWidget {
  const DeliveryTeamSection({super.key});

  @override
  State<DeliveryTeamSection> createState() => _DeliveryTeamSectionState();
}

class _DeliveryTeamSectionState extends State<DeliveryTeamSection> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: LayoutBuilder(
        builder: (context, constraints) {
          double width = constraints.maxWidth;

          // Define breakpoints
          bool isMobile = width < 600;
          bool isTablet = width >= 600 && width < 1100;
          bool isDesktop = width >= 1100;

          Widget content;

          if (isMobile) {
            // Column layout for mobile
            content = Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: List.generate(4, (index) {
                return Padding(
                  padding: const EdgeInsets.symmetric(
                    vertical: 8.0,
                    horizontal: 8,
                  ),
                  child: SizedBox(
                    height: 500,
                    width: 400, // Set a fixed height for each card0
                    child: HoverCardWithPeek(
                      imagePath: 'assets/images/team-${index + 1}.jpg',
                      name: 'Full Name',
                      designation: 'Designation',
                    ),
                  ),
                );
              }),
            );
          } else if (isTablet) {
            // Grid layout for tablet
            content = GridView.count(
              crossAxisCount: 2,
              crossAxisSpacing: 10,
              mainAxisSpacing: 10,
              childAspectRatio: 1.2,
              physics: NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              children: List.generate(4, (index) {
                return HoverCardWithPeek(
                  imagePath: 'assets/images/team-${index + 1}.jpg',
                  name: 'Full Name',
                  designation: 'Designation',
                );
              }),
            );
          } else {
            // Row layout for desktop
            content = Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: List.generate(4, (index) {
                return SizedBox(
                  width: width / 5, // You can adjust this value as needed
                  height: 300, // Set a fixed height
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: HoverCardWithPeek(
                      imagePath: 'assets/images/team-${index + 1}.jpg',
                      name: 'Full Name',
                      designation: 'Designation',
                    ),
                  ),
                );
              }),
            );
          }

          return Column(
            children: [
              Text(
                "DELIVERY TEAM",
                style: TextStyle(
                  color: Color(0xFFFF4800),
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                "Meet Our Delivery Team",
                style: GoogleFonts.poppins(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
              const SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.only(left: 80, right: 80),
                child: content,
              ),
            ],
          );
        },
      ),
    );
  }
}
