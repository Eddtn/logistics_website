// import 'package:flutter/material.dart';

// class FloatingWidget extends StatefulWidget {
//   const FloatingWidget({super.key});

//   @override
//   State<FloatingWidget> createState() => _FloatingWidgetState();
// }

// class _FloatingWidgetState extends State<FloatingWidget> {
//   final ScrollController _scrollController = ScrollController();
//   bool _showFab = false;

//   @override
//   void initState() {
//     super.initState();
//     _scrollController.addListener(_scrollListener);

//     WidgetsBinding.instance.addPostFrameCallback((_) {
//       final screenSize = MediaQuery.of(context).size;
//       print('Screen width: ${screenSize.width}, height: ${screenSize.height}');
//     });
//   }

//   void _scrollListener() {
//     if (_scrollController.offset > 200 && !_showFab) {
//       setState(() => _showFab = true);
//     } else if (_scrollController.offset <= 200 && _showFab) {
//       setState(() => _showFab = false);
//     }
//   }

//   @override
//   void dispose() {
//     _scrollController.dispose();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {

//     return AnimatedOpacity(

//       duration: Duration(milliseconds: 300),
//       opacity: _showFab ? 1.0 : 0.0,
//       child: _showFab
//           ? SizedBox(
//               height: 50,
//               width: 50,
//               child: FloatingActionButton(
//                 backgroundColor: Color(0xFFFF4800),
//                 shape: RoundedRectangleBorder(
//                   borderRadius: BorderRadius.zero, // custom shape
//                 ),
//                 onPressed: () {
//                   _scrollController.animateTo(
//                     0,
//                     duration: Duration(milliseconds: 600),
//                     curve: Curves.easeInOut,
//                   );
//                 },
//                 child: Icon(
//                   Icons.keyboard_double_arrow_up_sharp,
//                   color: Colors.white,
//                   size: 28,
//                 ), // custom icon
//               ),
//             )
//           : SizedBox.shrink(),
//     );
//   }
// }

import 'package:flutter/material.dart';

class FloatingWidget extends StatefulWidget {
  final ScrollController controller;

  const FloatingWidget({super.key, required this.controller});

  @override
  State<FloatingWidget> createState() => _FloatingWidgetState();
}

class _FloatingWidgetState extends State<FloatingWidget> {
  bool _showFab = false;

  @override
  void initState() {
    super.initState();
    widget.controller.addListener(_scrollListener);
  }

  void _scrollListener() {
    if (widget.controller.offset > 200 && !_showFab) {
      setState(() => _showFab = true);
    } else if (widget.controller.offset <= 200 && _showFab) {
      setState(() => _showFab = false);
    }
  }

  @override
  void dispose() {
    widget.controller.removeListener(_scrollListener);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedOpacity(
      duration: const Duration(milliseconds: 300),
      opacity: _showFab ? 1.0 : 0.0,
      child: _showFab
          ? SizedBox(
              height: 50,
              width: 50,
              child: FloatingActionButton(
                backgroundColor: const Color(0xFFFF4800),
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.zero,
                ),
                onPressed: () {
                  widget.controller.animateTo(
                    0,
                    duration: const Duration(milliseconds: 600),
                    curve: Curves.easeInOut,
                  );
                },
                child: const Icon(
                  Icons.keyboard_double_arrow_up_sharp,
                  color: Colors.white,
                  size: 28,
                ),
              ),
            )
          : const SizedBox.shrink(),
    );
  }
}
