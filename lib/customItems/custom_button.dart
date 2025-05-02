import 'package:flutter/material.dart';

class CustomButtonItem extends StatefulWidget {
  const CustomButtonItem({
    super.key,
    required this.width,
    required this.height,
    required this.text,
    required this.color,
    required this.textColor,
    required this.onPressed,
  });
  final double width;
  final double height;
  final String text;
  final Color color;
  final Color textColor;
  final VoidCallback onPressed;
  @override
  State<CustomButtonItem> createState() => _CustomButtonItemState();
}

class _CustomButtonItemState extends State<CustomButtonItem> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: widget.width,
      height: widget.height,
      child: ElevatedButton(
          onPressed: widget.onPressed,
          style: ElevatedButton.styleFrom(
              backgroundColor: widget.color,
              foregroundColor: widget.textColor,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(50))),
          child: Text(
            widget.text,
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          )),
    );
  }
}
