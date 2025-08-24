import 'package:flutter/material.dart';

class HighlightMultipleText extends StatefulWidget {
  const HighlightMultipleText({super.key});

  @override
  State<HighlightMultipleText> createState() => _HighlightMultipleTextState();
}

class _HighlightMultipleTextState extends State<HighlightMultipleText> {
  final List<bool> _isHovered = [false, false, false, false, false, false];

  void _onEnter(int index) {
    setState(() => _isHovered[index] = true);
  }

  void _onExit(int index) {
    setState(() => _isHovered[index] = false);
  }

  void _showDropdownMenu(BuildContext context, Offset position) async {
    final selected = await showMenu(
      context: context,
      position: RelativeRect.fromLTRB(
        position.dx,
        position.dy,
        position.dx + 1,
        position.dy + 1,
      ),
      items: [
        const PopupMenuItem(value: "blog", child: Text("Blog Grid")),
        const PopupMenuItem(value: "portfolio", child: Text("Blog Detail")),
      ],
    );

    if (selected != null) {
      debugPrint("Selected: $selected");
    }
  }

  Widget buildBox(String label, int index, {bool hasDropdown = false}) {
    bool highlight = _isHovered[index];

    return MouseRegion(
      onEnter: (_) => _onEnter(index),
      onExit: (_) => _onExit(index),
      child: GestureDetector(
        onTapDown: (details) {
          if (index == 4) {
            _showDropdownMenu(context, details.globalPosition);
          }
        },
        child: AnimatedContainer(
          height: 90,
          duration: const Duration(milliseconds: 200),
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
          decoration: BoxDecoration(
            color: highlight ? const Color(0xFFFF4800) : Colors.transparent,
            // borderRadius: BorderRadius.circular(4),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(label, style: const TextStyle(fontSize: 15)),
              if (hasDropdown) const Icon(Icons.arrow_drop_down, size: 20),
            ],
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          buildBox("Home", 0),
          const SizedBox(width: 5),
          buildBox("About", 1),
          const SizedBox(width: 5),
          buildBox("Service", 2),
          const SizedBox(width: 5),
          buildBox("Price", 3),
          const SizedBox(width: 5),
          buildBox("Pages", 4, hasDropdown: true),
          const SizedBox(width: 5),
          buildBox("Contact", 5),
        ],
      ),
    );
  }
}
