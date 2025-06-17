import 'package:flutter/material.dart';

class GlobalContainer extends StatelessWidget {
  final Widget? column;
  final double? height;
  final double? width;
  const GlobalContainer({
    super.key,
    this.column,
    this.height,
    this.width,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: Container(
        height: height,
        width: width,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(24),
          boxShadow: const [
            BoxShadow(
              color: Color(0xff0E3E7B),
            ),
            BoxShadow(
              color: Color(0xff262450),
              spreadRadius: 0.0,
              blurRadius: 16.0,
            ),
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 28),
          child: column,
        ),
      ),
    );
  }
}
