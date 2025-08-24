import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class HoverCircleIcon extends StatefulWidget {
  final IconData icon;
  final double size;
  final bool enableHover;

  const HoverCircleIcon({
    super.key,
    required this.icon,
    this.size = 40,
    this.enableHover = true,
  });

  @override
  State<HoverCircleIcon> createState() => _HoverCircleIconState();
}

class _HoverCircleIconState extends State<HoverCircleIcon> {
  bool _isHovered = false;

  void _onEnter(PointerEvent event) {
    if (widget.enableHover) {
      setState(() => _isHovered = true);
    }
  }

  void _onExit(PointerEvent event) {
    if (widget.enableHover) {
      setState(() => _isHovered = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    final backgroundColor = _isHovered ? Colors.white : Color(0xff1F1F2E);
    final iconColor = _isHovered ? Colors.black : Colors.white;

    return MouseRegion(
      // onEnter: (_) => setState(() => _isHovered = true),
      // onExit: (_) => setState(() => _isHovered = false),
      onEnter: _onEnter,
      onExit: _onExit,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        width: widget.size,
        height: widget.size,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: backgroundColor,
          border: Border.all(color: Colors.white, width: 2),
        ),
        child: Icon(widget.icon, color: iconColor, size: widget.size * 0.5),
      ),
    );
  }
}

class MyPage extends StatelessWidget {
  final bool shouldEnableHover;
  const MyPage({super.key, required this.shouldEnableHover});

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 2,
      children: [
        HoverCircleIcon(
          icon: FontAwesomeIcons.twitter,
          enableHover: shouldEnableHover,
        ),
        HoverCircleIcon(icon: Icons.facebook, enableHover: shouldEnableHover),
        HoverCircleIcon(
          icon: FontAwesomeIcons.linkedin,
          enableHover: shouldEnableHover,
        ),
        HoverCircleIcon(
          icon: FontAwesomeIcons.instagram,
          enableHover: shouldEnableHover,
        ),
      ],
    );
  }
}
