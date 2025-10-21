import 'package:flutter/material.dart';
import 'package:logistics_website/onstants/highlightedText.dart';
import 'package:logistics_website/onstants/drop_menu_text.dart';
import 'package:logistics_website/onstants/responsiveness.dart';
import 'package:logistics_website/onstants/socialIcons.dart';

import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class AppBarWidget extends StatefulWidget {
  const AppBarWidget({super.key});

  @override
  State<AppBarWidget> createState() => _AppBarWidgetState();
}

class _AppBarWidgetState extends State<AppBarWidget> {
  bool _isExpanded = false;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        LayoutBuilder(
          builder: (context, constraints) {
            // final bool isMobile = constraints.maxWidth < 600;

            return Responsive.isMobile(context)
                // isMobile
                ? Container(
                    height: 80,
                    color: Color(0xFF1F1F2E), // ✅ This works

                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(Icons.phone, color: Colors.white, size: 15),
                              // SizedBox(width: 5),
                              Text(
                                '+234813231124',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 15,
                                ),
                              ),
                              SizedBox(width: 5),
                              Text('|', style: TextStyle(color: Colors.white)),
                              SizedBox(width: 5),
                              Icon(
                                Icons.messenger_sharp,
                                color: Colors.white,
                                size: 15,
                              ),
                              SizedBox(width: 5),
                              Text(
                                'info@logisticssite.com',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 15,
                                ),
                              ),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              // Spacer(),
                              SocialIcon(
                                icon: FontAwesomeIcons.facebookF,

                                // color: Colors.white,
                                url: '',
                                //  'https://facebook.com/khairfoundation',
                              ),
                              SocialIcon(
                                icon: FontAwesomeIcons.instagram,
                                color: Colors.white,
                                url: '',
                                // 'https://instagram.com/khairfoundation',
                              ),
                              SocialIcon(
                                icon: FontAwesomeIcons.twitter,
                                color: Colors.white,
                                url: '',
                                // 'https://twitter.com/khairfoundation',
                              ),
                              SocialIcon(
                                icon: FontAwesomeIcons.envelope,
                                color: Colors.white,
                                url: '',
                                // 'mailto:support@khairfoundations.com',
                              ),

                              // SizedBox(width: 25),
                            ],
                          ),
                        ],
                      ),
                    ),
                  )
                : Container(
                    height: 40,
                    color: Color(0xFF1F1F2E),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        SizedBox(width: 25),
                        Icon(Icons.phone, color: Colors.white, size: 15),
                        SizedBox(width: 5),
                        Text(
                          '+234813231124',
                          style: TextStyle(color: Colors.white, fontSize: 15),
                        ),
                        SizedBox(width: 5),
                        Text('|', style: TextStyle(color: Colors.white)),
                        SizedBox(width: 5),
                        Icon(
                          Icons.messenger_sharp,
                          color: Colors.white,
                          size: 15,
                        ),
                        SizedBox(width: 5),
                        Text(
                          'info@logisticssite.com',
                          style: TextStyle(color: Colors.white, fontSize: 15),
                        ),

                        Spacer(),
                        SocialIcon(
                          icon: FontAwesomeIcons.facebookF,

                          // color: Colors.white,
                          url: '',
                          //  'https://facebook.com/khairfoundation',
                        ),
                        SocialIcon(
                          icon: FontAwesomeIcons.instagram,
                          color: Colors.white,
                          url: '',
                          // 'https://instagram.com/khairfoundation',
                        ),
                        SocialIcon(
                          icon: FontAwesomeIcons.twitter,
                          color: Colors.white,
                          url: '',
                          // 'https://twitter.com/khairfoundation',
                        ),
                        SocialIcon(
                          icon: FontAwesomeIcons.envelope,
                          color: Colors.white,
                          url: '',
                          // 'mailto:support@khairfoundations.com',
                        ),

                        SizedBox(width: 25),
                      ],
                    ),
                  );
          },
        ),

        LayoutBuilder(
          builder: (context, constraints) {
            // final bool isMobile = constraints.maxWidth <= 640;
            final bool isMobile = MediaQuery.of(context).size.width <= 800;

            return isMobile
                ? Column(
                    children: [
                      Container(
                        color: Colors.white,
                        padding: const EdgeInsets.symmetric(
                          horizontal: 16,
                          vertical: 8,
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text(
                              'Logistics',
                              style: TextStyle(
                                fontSize: 20,
                                color: Color(0xFFFF4800),
                              ),
                            ),
                            IconButton(
                              icon: const Icon(Icons.menu),
                              onPressed: () {
                                setState(() {
                                  _isExpanded = !_isExpanded;
                                });
                              },
                            ),
                          ],
                        ),
                      ),
                      if (_isExpanded) const DropMenuText(),
                    ],
                  )
                : Container(
                    height: 90,

                    width: double.infinity,

                    color: Color(0xFFFFFFFF),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        // SizedBox(width: 25),
                        // Spacer(),
                        Text(
                          "Logistics",
                          style: TextStyle(
                            fontSize: 20,
                            color: Color.fromARGB(255, 72, 72, 72),
                          ),
                        ),

                        HighlightMultipleText(),

                        // Spacer(),
                        Flexible(
                          child: Container(
                            height: 45,
                            constraints: BoxConstraints(maxWidth: 150),
                            color: const Color(0xFFFF4800),
                            padding: const EdgeInsets.symmetric(horizontal: 8),
                            child: const Center(
                              child: Text(
                                "Get A Quote",
                                style: TextStyle(
                                  fontSize: 15,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  );
          },
        ),
      ],
    );
  }
}

// class _SocialIcon extends StatelessWidget {
//   final IconData icon;
//   final String url;
//   final Color? color;

//   const _SocialIcon({required this.icon, required this.url, this.color});

//   @override
//   Widget build(BuildContext context) {
//     return IconButton(
//       icon: FaIcon(icon, size: 15, color: color ?? Colors.white),
//       onPressed: () async {
//         // Navigator.of(context).push(
//         //   MaterialPageRoute(
//         //     builder: (context) => const HomePage(),
//         //   ),
//         // );
//         final uri = Uri.parse(url);
//         if (await canLaunchUrl(uri)) {
//           await launchUrl(uri, mode: LaunchMode.externalApplication);
//         }
//       },
//       tooltip: url,
//     );
//   }
// }
