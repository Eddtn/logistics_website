// import 'package:flutter/material.dart';

// class DropMenuText extends StatefulWidget {
//   const DropMenuText({super.key, required Null Function(section) onNavigate});

//   @override
//   State<DropMenuText> createState() => _HighlightMultipleTextState();
// }

// class _HighlightMultipleTextState extends State<DropMenuText> {
//   final List<bool> _isHovered = [false, false, false, false, false, false];
//   final List<bool> _isClicked = [false, false, false, false, false, false];

//   void _onEnter(int index) {
//     setState(() => _isHovered[index] = true);
//   }

//   void _onExit(int index) {
//     setState(() => _isHovered[index] = false);
//   }

//   void _onTap(int index) {
//     setState(() => _isClicked[index] = !_isClicked[index]);
//   }

//   Widget buildBox(String label, int index) {
//     bool highlight = _isHovered[index] || _isClicked[index];

//     return MouseRegion(
//       onEnter: (_) => _onEnter(index),
//       onExit: (_) => _onExit(index),
//       child: GestureDetector(
//         onTap: () => _onTap(index),
//         child: AnimatedContainer(
//           height: 40,
//           duration: const Duration(milliseconds: 200),
//           padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
//           decoration: BoxDecoration(
//             color: highlight ? Color(0xFFFF4800) : Colors.transparent,
//             // border: highlight ? Border.all(color: Colors.blue, width: 2) : null,
//             borderRadius: BorderRadius.circular(4),
//           ),
//           child: Align(
//             alignment: Alignment.centerLeft,
//             child: Text(label, style: const TextStyle(fontSize: 20)),
//           ),
//         ),
//       ),
//     );
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       mainAxisAlignment: MainAxisAlignment.start,
//       children: [
//         buildBox("Home", 0),
//         const SizedBox(width: 5),
//         buildBox("Company", 1),
//         const SizedBox(width: 5),
//         buildBox("Tracking", 2),
//         const SizedBox(width: 5),
//         buildBox("service", 3),
//         const SizedBox(width: 5),
//         // buildBox("Pages", 4),
//         // const SizedBox(width: 5),
//         // buildBox("Contact", 5),
//       ],
//     );
//   }
// }


import 'package:flutter/material.dart';

class DropMenuText extends StatelessWidget {
  final ValueChanged<String> onNavigate;

  const DropMenuText({
    super.key,
    required this.onNavigate,
  });

  @override
  Widget build(BuildContext context) {
    const items = [
      'Home',
      'Company',
      'Tracking',
      'Services',
      
    ];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: items.map((item) {
        return ListTile(
          title: Text(item),
          onTap: () => onNavigate(item),
        );
      }).toList(),
    );
  }
}