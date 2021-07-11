import 'package:flutter/material.dart';
import 'package:sprung/sprung.dart';

class OnHoverWidget extends StatefulWidget {
  final Widget child;
  const OnHoverWidget({Key? key, required this.child}) : super(key: key);

  @override
  _OnHoverWidgetState createState() => _OnHoverWidgetState();
}

class _OnHoverWidgetState extends State<OnHoverWidget> {
  bool isHovered = false;

  @override
  Widget build(BuildContext context) {
    final hoveredTransform = Matrix4.identity()
      ..translate(0, -5, 8)
      ..scale(1.2);
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
