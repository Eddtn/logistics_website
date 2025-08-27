import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ServiceWidget extends StatefulWidget {
  const ServiceWidget({super.key});

  @override
  State<ServiceWidget> createState() => _ServiceWidgetState();
}

class _ServiceWidgetState extends State<ServiceWidget> {
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        double screenWidth = constraints.maxWidth;
        double screenHeight = constraints.maxHeight;
        final bool isMobile = screenWidth <= 600;
        final bool isTablet = screenWidth > 600 && screenWidth <= 1000;
        final bool isDesktop = screenWidth > 1000;

        return isDesktop
            ? Container(
                color: isMobile ? const Color(0xffF2F2F4) : null,
                height: isDesktop ? screenHeight * 0.6 : null,

                margin: EdgeInsets.all(40),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,

                  children: [
                    Text(
                      "OUR SERVICES",
                      style: GoogleFonts.poppins(
                        fontSize: 22,
                        fontWeight: FontWeight.w600,
                        color: const Color(0xFFFF4800),
                      ),
                    ),
                    Text(
                      "Best Logistics Services",
                      style: GoogleFonts.poppins(
                        fontSize: 22,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const SizedBox(height: 20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Flexible(
                          flex: 1,
                          child: Container(
                            width: 300,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  height: 80,
                                  color: const Color(0xFFFF4800),

                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Icon(
                                        Icons.airplanemode_active_outlined,
                                        color: Colors.black,
                                      ),
                                      const SizedBox(width: 10),
                                      Text(
                                        "Air Freight",
                                        style: const TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.white,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                const SizedBox(height: 10),
                                Text(
                                  "Diam amet eos at no eos sit lorem, amet rebum ipsum clita stet diam sea est diam",
                                  style: GoogleFonts.poppins(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                                const SizedBox(height: 10),
                                Center(
                                  child: Text(
                                    "Read More",
                                    style: GoogleFonts.poppins(
                                      fontSize: 14,
                                      fontWeight: FontWeight.bold,
                                      color: const Color(0xFFFF4800),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        SizedBox(width: 5),
                        Flexible(
                          flex: 1,
                          child: Container(
                            width: 300,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  height: 80,
                                  color: const Color(0xFFFF4800),
                                  // padding: const EdgeInsets.symmetric(
                                  //   horizontal: 16,
                                  // ),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Icon(
                                        Icons.airplanemode_active_outlined,

                                        color: Colors.black,
                                      ),
                                      const SizedBox(width: 10),
                                      Text(
                                        "Ocean Freight",
                                        style: const TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.white,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                const SizedBox(height: 10),
                                Text(
                                  "Diam amet eos at no eos sit lorem, amet rebum ipsum clita stet diam sea est diam",
                                  style: GoogleFonts.poppins(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                                const SizedBox(height: 10),
                                Center(
                                  child: Text(
                                    "Read More",
                                    style: GoogleFonts.poppins(
                                      fontSize: 14,
                                      fontWeight: FontWeight.bold,
                                      color: const Color(0xFFFF4800),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        SizedBox(width: 5),
                        Flexible(
                          flex: 1,
                          child: Container(
                            width: 300,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  height: 80,
                                  color: const Color(0xFFFF4800),
                                  // padding: const EdgeInsets.symmetric(
                                  //   horizontal: 16,
                                  // ),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Icon(
                                        Icons.fire_truck_sharp,
                                        color: Colors.black,
                                      ),
                                      const SizedBox(width: 10),
                                      Text(
                                        "Land Transport",
                                        style: const TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.white,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                const SizedBox(height: 10),
                                Text(
                                  "Diam amet eos at no eos sit lorem, amet rebum ipsum clita stet diam sea est diam",
                                  style: GoogleFonts.poppins(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                                const SizedBox(height: 10),
                                Center(
                                  child: Text(
                                    "Read More",
                                    style: GoogleFonts.poppins(
                                      fontSize: 14,
                                      fontWeight: FontWeight.bold,
                                      color: const Color(0xFFFF4800),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        SizedBox(width: 5),

                        Flexible(
                          flex: 1,
                          child: Container(
                            width: 300,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  height: 80,
                                  color: const Color(0xFFFF4800),
                                  // padding: const EdgeInsets.symmetric(
                                  //   horizontal: 16,
                                  // ),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Icon(
                                        Icons.storefront_sharp,
                                        color: Colors.black,
                                      ),
                                      const SizedBox(width: 10),
                                      Text(
                                        "Cargo Storage",
                                        style: const TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.white,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                const SizedBox(height: 10),
                                Text(
                                  "Diam amet eos at no eos sit lorem, amet rebum ipsum clita stet diam sea est diam",
                                  style: GoogleFonts.poppins(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                                const SizedBox(height: 10),
                                Center(
                                  child: Text(
                                    "Read More",
                                    style: GoogleFonts.poppins(
                                      fontSize: 14,
                                      fontWeight: FontWeight.bold,
                                      color: const Color(0xFFFF4800),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              )
            : isTablet
            ? Container(
                color: isMobile ? const Color(0xffF2F2F4) : null,
                height: isDesktop ? screenHeight * 0.7 : null,
                padding: const EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      "OUR SERVICES",
                      style: GoogleFonts.poppins(
                        fontSize: 22,
                        fontWeight: FontWeight.w600,
                        color: const Color(0xFFFF4800),
                      ),
                    ),
                    Text(
                      "Best Logistics Services",
                      style: GoogleFonts.poppins(
                        fontSize: 22,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const SizedBox(height: 10),

                    // GridView wrapped with SizedBox to constrain height
                    SizedBox(
                      height: isMobile
                          ? 900
                          : 500, // Adjust based on expected content
                      child: GridView.count(
                        crossAxisCount: 2,

                        crossAxisSpacing: 20,
                        mainAxisSpacing: 20,
                        childAspectRatio: 1.75,
                        physics: const NeverScrollableScrollPhysics(),
                        children: List.generate(4, (index) => _serviceCard()),
                      ),
                    ),
                  ],
                ),
              )
            : Container(
                color: isMobile ? const Color(0xffF2F2F4) : null,
                height: isDesktop ? screenHeight * 0.9 : null,
                padding: const EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      "OUR SERVICES",
                      style: GoogleFonts.poppins(
                        fontSize: 22,
                        fontWeight: FontWeight.w600,
                        color: const Color(0xFFFF4800),
                      ),
                    ),
                    Text(
                      "Best Logistics Services",
                      style: GoogleFonts.poppins(
                        fontSize: 22,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const SizedBox(height: 20),
                    SizedBox(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            height: 80,
                            color: const Color(0xFFFF4800),
                            // padding: const EdgeInsets.symmetric(
                            //   horizontal: 16,
                            // ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(
                                  Icons.airplanemode_active_outlined,
                                  color: Colors.black,
                                  textDirection: TextDirection.ltr,
                                ),
                                const SizedBox(width: 10),
                                Text(
                                  "Air Freight",
                                  style: const TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(height: 10),
                          Text(
                            "Diam amet eos at no eos sit lorem, amet rebum ipsum clita stet diam sea est diam",
                            style: GoogleFonts.poppins(
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          const SizedBox(height: 10),
                          Center(
                            child: Text(
                              "Read More",
                              style: GoogleFonts.poppins(
                                fontSize: 14,
                                fontWeight: FontWeight.bold,
                                color: const Color(0xFFFF4800),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),

                    SizedBox(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            height: 80,
                            color: const Color(0xFFFF4800),
                            // padding: const EdgeInsets.symmetric(
                            //   horizontal: 16,
                            // ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(
                                  Icons.airplanemode_active_outlined,
                                  color: Colors.black,
                                ),
                                const SizedBox(width: 10),
                                Text(
                                  "Ocean Freight",
                                  style: const TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(height: 10),
                          Text(
                            "Diam amet eos at no eos sit lorem, amet rebum ipsum clita stet diam sea est diam",
                            style: GoogleFonts.poppins(
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          const SizedBox(height: 10),
                          Center(
                            child: Text(
                              "Read More",
                              style: GoogleFonts.poppins(
                                fontSize: 14,
                                fontWeight: FontWeight.bold,
                                color: const Color(0xFFFF4800),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),

                    SizedBox(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            height: 80,
                            color: const Color(0xFFFF4800),
                            // padding: const EdgeInsets.symmetric(
                            //   horizontal: 16,
                            // ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(
                                  Icons.airplanemode_active_outlined,
                                  color: Colors.black,
                                ),
                                const SizedBox(width: 10),
                                Text(
                                  "Land Transport",
                                  style: const TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(height: 10),
                          Text(
                            "Diam amet eos at no eos sit lorem, amet rebum ipsum clita stet diam sea est diam",
                            style: GoogleFonts.poppins(
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          const SizedBox(height: 10),
                          Center(
                            child: Text(
                              "Read More",
                              style: GoogleFonts.poppins(
                                fontSize: 14,
                                fontWeight: FontWeight.bold,
                                color: const Color(0xFFFF4800),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),

                    SizedBox(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            height: 80,
                            color: const Color(0xFFFF4800),
                            // padding: const EdgeInsets.symmetric(
                            //   horizontal: 16,
                            // ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(
                                  Icons.storefront_sharp,
                                  color: Colors.black,
                                ),
                                const SizedBox(width: 10),
                                Text(
                                  "Cargo Storage",
                                  style: const TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(height: 10),
                          Text(
                            "Diam amet eos at no eos sit lorem, amet rebum ipsum clita stet diam sea est diam",
                            style: GoogleFonts.poppins(
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          const SizedBox(height: 10),
                          Center(
                            child: Text(
                              "Read More",
                              style: GoogleFonts.poppins(
                                fontSize: 14,
                                fontWeight: FontWeight.bold,
                                color: const Color(0xFFFF4800),
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
    );
  }

  Widget _serviceCard() {
    return SizedBox(
      // height: 300,
      width: 300,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 80,
            color: const Color(0xFFFF4800),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                Icon(Icons.airplanemode_active_outlined, color: Colors.white),
                SizedBox(width: 10),
                Text(
                  "Air Freight",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 10),
          Flexible(
            child: Text(
              "Diam amet eos at no eos sit lorem, amet rebum ipsum clita stet diam sea est diam",
              style: GoogleFonts.poppins(
                fontSize: 14,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          const SizedBox(height: 10),
          Center(
            child: Text(
              "Read More",
              style: GoogleFonts.poppins(
                fontSize: 14,
                fontWeight: FontWeight.bold,
                color: const Color(0xFFFF4800),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
