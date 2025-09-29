import 'package:flutter/material.dart';

class NextPageChange extends StatefulWidget {
  const NextPageChange({super.key});

  @override
  State<NextPageChange> createState() => _HighlightMultipleTextState();
}

class _HighlightMultipleTextState extends State<NextPageChange> {
  final List<bool> _isHovered = [false, false, false, false, false];
  final List<bool> _isClicked = [false, false, false, false, false];

  void _onEnter(int index) {
    setState(() => _isHovered[index] = true);
  }

  void _onExit(int index) {
    setState(() => _isHovered[index] = false);
  }

  void _onTap(int index) {
    setState(() => _isClicked[index] = !_isClicked[index]);
  }

  Widget buildBox(Widget label, int index) {
    bool highlight = _isHovered[index] || _isClicked[index];

    return MouseRegion(
      onEnter: (_) => _onEnter(index),
      onExit: (_) => _onExit(index),
      child: GestureDetector(
        onTap: () => _onTap(index),
        child: AnimatedContainer(
          height: 40,
          duration: const Duration(milliseconds: 200),
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
          decoration: BoxDecoration(
            color: highlight ? Color(0xFFFF4800) : Colors.transparent,
            // border: highlight ? Border.all(color: Colors.blue, width: 2) : null,
            // borderRadius: BorderRadius.circular(4),
          ),
          child: Align(
            alignment: Alignment.centerLeft,
            child: widget,
            // Text(label, style: const TextStyle(fontSize: 20)),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        buildBox(Icon(Icons.keyboard_double_arrow_right_rounded), 0),
        buildBox(Icon(Icons.keyboard_double_arrow_right_rounded), 1),
        buildBox(Icon(Icons.keyboard_double_arrow_right_rounded), 2),
        buildBox(Icon(Icons.keyboard_double_arrow_right_rounded), 3),
        const SizedBox(width: 5),
        // buildBox(Text('1'), 1),
        // const SizedBox(width: 5),
        // buildBox(Text("2"), 2),
        // const SizedBox(width: 5),
        // buildBox(Text("3"), 3),
        // const SizedBox(width: 5),
        buildBox(Icon(Icons.keyboard_double_arrow_right_rounded), 4),
      ],
    );
  }
}
