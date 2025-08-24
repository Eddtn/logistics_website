import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:logistics_website/pages/price/widget/formfield.dart';

class QuoteWidget extends StatefulWidget {
  const QuoteWidget({super.key});

  @override
  State<QuoteWidget> createState() => _QuoteWidgetState();
}

class _QuoteWidgetState extends State<QuoteWidget> {
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
                height: screenHeight * 0.9,
                // margin: EdgeInsets.all(20),
                color: Color(0xffF2F2F4),

                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(child: _buildTextSection(isMobile)),
                    const SizedBox(width: 30),
                    FormSection(),

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
                    Column(
                      children: [
                        _buildTextSection(isMobile),
                        // const SizedBox(width: 20),
                        FormSection(),

                        // _buildFormSection(isMobile, isTablet),
                      ],
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
                      child: _buildTextSection(isMobile),
                    ),
                    const SizedBox(height: 30),
                    FormSection(),

                    // _buildFormSection(isMobile, isTablet),
                  ],
                ),
              );
      },
    );
  }
}

Widget _buildTextSection(bool isMobile) {
  return Container(
    margin: EdgeInsets.all(40),
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

        // 👇 Responsive stats layout
        isMobile
            ? Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _statBlock("225", "Skilled Experts"),
                  SizedBox(height: 15),
                  _statBlock("1050", "Happy Clients"),
                  SizedBox(height: 15),
                  _statBlock("2500", "Complete Projects"),
                ],
              )
            : Row(
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
