import 'package:flutter/material.dart';
import 'package:sprung/sprung.dart';

class OnHoverImageWidget extends StatefulWidget {
  final Widget child;
  const OnHoverImageWidget({Key? key, required this.child}) : super(key: key);

  @override
  _OnHoverImageWidgetState createState() => _OnHoverImageWidgetState();
}

class _OnHoverImageWidgetState extends State<OnHoverImageWidget> {
  bool isHovered = false;

  @override
  Widget build(BuildContext context) {
    final hoveredTransform = Matrix4.identity()..translate(0, -8, 0);
    final transform = isHovered ? hoveredTransform : Matrix4.identity();

    return MouseRegion(
      cursor: SystemMouseCursors.click,
      onEnter: (event) => onEntered(true),
      onExit: (event) => onEntered(false),
      child: AnimatedContainer(
        curve: Sprung.overDamped,
        duration: Duration(microseconds: 200),
        transform: transform,
        child: widget.child,
      ),
    );
  }

  void onEntered(bool isHovered) => setState(() {
        this.isHovered = isHovered;
      });
}
