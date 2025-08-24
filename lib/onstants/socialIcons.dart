import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart' show FaIcon;
import 'package:url_launcher/url_launcher.dart';

class SocialIcon extends StatelessWidget {
  final IconData icon;
  final String url;
  final Color? color;

  const SocialIcon({required this.icon, required this.url, this.color});

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: FaIcon(icon, size: 15, color: color ?? Colors.white),
      onPressed: () async {
        // Navigator.of(context).push(
        //   MaterialPageRoute(
        //     builder: (context) => const HomePage(),
        //   ),
        // );
        final uri = Uri.parse(url);
        if (await canLaunchUrl(uri)) {
          await launchUrl(uri, mode: LaunchMode.externalApplication);
        }
      },
      tooltip: url,
    );
  }
}

// import 'package:flutter/material.dart';
// import 'package:font_awesome_flutter/font_awesome_flutter.dart' show FaIcon;
// import 'package:url_launcher/url_launcher.dart';

// class SocialIcon extends StatefulWidget {
//   final IconData icon;
//   final String url;
//   final Color? color;
//   final Color? isHighlighted;

//   const SocialIcon({
//     required this.icon,
//     required this.url,
//     this.color,
//     this.isHighlighted,
//   });

//   @override
//   State<SocialIcon> createState() => _SocialIconState();
// }

// class _SocialIconState extends State<SocialIcon> {
//   @override
//   Widget build(BuildContext context) {
//     bool _isHovered = false;
//     return MouseRegion(
//       onEnter: (_) => setState(() => _isHovered = true),
//       onExit: (_) => setState(() => _isHovered = false),
//       child: IconButton(
//         icon: FaIcon(
//           widget.icon,
//           size: 15,
//           color: _isHovered ? isH : Color,
//         ),
//         onPressed: () async {
//           // Navigator.of(context).push(
//           //   MaterialPageRoute(
//           //     builder: (context) => const HomePage(),
//           //   ),
//           // );
//           final uri = Uri.parse(widget.url);
//           if (await canLaunchUrl(uri)) {
//             await launchUrl(uri, mode: LaunchMode.externalApplication);
//           }
//         },
//         tooltip: widget.url,
//       ),
//     );
//   }
// }
