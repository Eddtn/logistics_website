import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:logistics_website/pages/price/widget/formfield.dart';

class RequestQuoteWidget extends StatefulWidget {
  const RequestQuoteWidget({super.key});

  @override
  State<RequestQuoteWidget> createState() => _RequestQuoteWidgetState();
}

class _RequestQuoteWidgetState extends State<RequestQuoteWidget> {
  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    final bool isMobile = screenWidth <= 600;
    final bool isTablet = screenWidth > 600 && screenWidth <= 1000;
    final bool isDesktop = screenWidth > 1000;
    return isDesktop
        ? Container(
            height: screenHeight * 0.6,

            color: Color(0xffF2F2F4),

            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  width: screenWidth * 0.5,
                  margin: EdgeInsets.only(right: 0, left: 40),
                  padding: EdgeInsets.all(40),

                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "GET A QUOTE",
                        style: GoogleFonts.poppins(
                          fontSize: 20,
                          fontWeight: FontWeight.w600,
                          color: Color(0xFFFF4800),
                        ),
                      ),
                      SizedBox(height: 10),
                      Text(
                        "Request A Free Quote",
                        style: GoogleFonts.poppins(
                          fontSize: 35,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                      SizedBox(height: 15),
                      Text(
                        "Dolores lorem lorem ipsum sit et ipsum. Sadip sea amet diam dolore sed et. Sit rebum labore sit sit ut vero no sit. Et elitr stet dolor sed sit et sed ipsum et kasd ut. Erat duo eos et erat sed diam duo ",
                        style: GoogleFonts.poppins(fontSize: 14),
                      ),

                      const SizedBox(height: 30),

                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        // spacing: 20,
                        // runSpacing: 20,
                        children: [
                          _statBlock("225", "Skilled Experts"),
                          _statBlock("1050", "Happy Clients"),
                          _statBlock("2500", "Complete Projects"),
                        ],
                      ),
                    ],
                  ),
                ),

                //  _buildTextSection(isMobile)),
                // const SizedBox(width: 30),
                FormSection(),
                const SizedBox(width: 50),
                // Expanded(
                //   child: FormSection(),

                //   //  _buildFormSection(isMobile, isTablet),
                // ),
              ],
            ),
          )
        : isTablet
        ? Container(
            color: Color(0xffF2F2F4),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,

              children: [
                Container(
                  // width: screenWidth * 0.4,
                  margin: EdgeInsets.only(left: 80, right: 80),
                  padding: EdgeInsets.only(top: 40, bottom: 40),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "GET A QUOTE",
                        style: GoogleFonts.poppins(
                          fontSize: 20,
                          fontWeight: FontWeight.w600,
                          color: Color(0xFFFF4800),
                        ),
                      ),
                      SizedBox(height: 10),
                      Text(
                        "Request A Free Quote",
                        style: GoogleFonts.poppins(
                          fontSize: 35,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                      SizedBox(height: 15),
                      Text(
                        "Dolores lorem lorem ipsum sit et ipsum. Sadip sea amet diam dolore sed et. Sit rebum labore sit sit ut vero no sit. Et elitr stet dolor sed sit et sed ipsum et kasd ut. Erat duo eos et erat sed diam duo ",
                        style: GoogleFonts.poppins(fontSize: 14),
                      ),

                      const SizedBox(height: 30),

                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        // spacing: 20,
                        // runSpacing: 20,
                        children: [
                          _statBlock("225", "Skilled Experts"),
                          _statBlock("1050", "Happy Clients"),
                          _statBlock("2500", "Complete Projects"),
                        ],
                      ),
                    ],
                  ),
                ),

                // _buildTextSection(isMobile),
                Container(
                  margin: const EdgeInsets.only(left: 80, right: 80),

                  // padding: EdgeInsets.all(40),
                  child: FormSection(),
                ),
              ],
            ),
          )
        : Container(
            // height: screenHeight * 0.8,
            color: Color(0xffF2F2F4),

            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Expanded(
                    child: Container(
                      // width: screenWidth * 0.4,
                      margin: EdgeInsets.all(20),

                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "GET A QUOTE",
                            style: GoogleFonts.poppins(
                              fontSize: 20,
                              fontWeight: FontWeight.w600,
                              color: Color(0xFFFF4800),
                            ),
                          ),
                          SizedBox(height: 10),
                          Text(
                            "Request A Free Quote",
                            style: GoogleFonts.poppins(
                              fontSize: 35,
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                            ),
                          ),
                          SizedBox(height: 15),
                          Text(
                            "Dolores lorem lorem ipsum sit et ipsum. Sadip sea amet diam dolore sed et. Sit rebum labore sit sit ut vero no sit. Et elitr stet dolor sed sit et sed ipsum et kasd ut. Erat duo eos et erat sed diam duo ",
                            style: GoogleFonts.poppins(fontSize: 14),
                          ),

                          const SizedBox(height: 30),

                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            // mainAxisAlignment: MainAxisAlignment.start,
                            // spacing: 20,
                            // runSpacing: 20,
                            children: [
                              _statBlock("225", "Skilled Experts"),
                              _statBlock("1050", "Happy Clients"),
                              _statBlock("2500", "Complete Projects"),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  //
                  //
                  //
                  // _buildTextSection(isMobile),
                ),
                const SizedBox(height: 30),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    margin: EdgeInsets.all(20),

                    child: FormSection(),
                  ),
                ),

                // _buildFormSection(isMobile, isTablet),
              ],
            ),
          );
  }

  Widget _statBlock(String number, String label) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          number,
          style: GoogleFonts.poppins(
            fontSize: 32,
            fontWeight: FontWeight.bold,
            color: Color(0xFFFF4800),
          ),
        ),

        const SizedBox(height: 4),

        Text(
          label,
          style: GoogleFonts.poppins(
            fontSize: 14,
            fontWeight: FontWeight.bold,
            color: Color(0xff000000),
          ),
        ),
      ],
    );
  }
}
