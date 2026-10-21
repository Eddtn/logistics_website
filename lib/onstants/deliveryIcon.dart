import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class HoverCircleIcon extends StatefulWidget {
  final Object icon;
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

  Widget _buildIcon(Color color) {
    if (widget.icon is IconData) {
      return Icon(widget.icon as IconData, color: color, size: widget.size * 0.5);
    }

    if (widget.icon is FaIconData) {
      return FaIcon(widget.icon as dynamic, color: color, size: widget.size * 0.5);
    }

    return Icon(Icons.help_outline, color: color, size: widget.size * 0.5);
  }

  @override
  Widget build(BuildContext context) {
    final backgroundColor = _isHovered ? Color(0xff1F1F2E) : Color(0xFFFF4800);
    final iconColor = _isHovered ? Colors.white : Color(0xff1F1F2E);

    return MouseRegion(
      onEnter: _onEnter,
      onExit: _onExit,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        width: widget.size,
        height: widget.size,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: backgroundColor,
          border: Border.all(color: Color(0xff1F1F2E), width: 2),
        ),
        child: _buildIcon(iconColor),
      ),
    );
  }
}

class DelIconWidget extends StatelessWidget {
  final bool shouldEnableHover;
  const DelIconWidget({super.key, required this.shouldEnableHover});

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
