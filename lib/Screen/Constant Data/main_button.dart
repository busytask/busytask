import 'package:flutter/material.dart';
import 'constant.dart';

class PrimaryButton extends StatefulWidget {
  const PrimaryButton({super.key, required this.buttonText, required this.onpressed});
  final String buttonText;
  final VoidCallback onpressed;
  @override
  State<PrimaryButton> createState() => _PrimaryButtonState();
}

class _PrimaryButtonState extends State<PrimaryButton> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.onpressed,
      child: Container(
        height: 48,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          gradient: buttonGradiant,
        ),
        child: Text(
          widget.buttonText,
          textAlign: TextAlign.center,
          style: kTextStyle.copyWith(color: Colors.white, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
