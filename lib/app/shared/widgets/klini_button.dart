import 'package:flutter/material.dart';

class KliniButton extends StatelessWidget {
  final double width;
  final double height;
  final Color buttonColor;
  final String label;
  final TextStyle textStyle;
  final Color labelColor;
  final double labelSize;
  final Function onPressed;

  const KliniButton({
    Key key,
    this.width,
    this.height,
    this.buttonColor,
    this.label,
    this.textStyle,
    this.labelColor,
    this.labelSize = 18,
    this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: height,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          elevation: 0,
          primary: buttonColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
        onPressed: onPressed,
        child: Text(
          label,
          style: textStyle ??
              TextStyle(
                fontSize: labelSize,
                color: labelColor,
                fontWeight: FontWeight.bold,
              ),
        ),
      ),
    );
  }
}
