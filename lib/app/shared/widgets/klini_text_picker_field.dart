import 'package:flutter/material.dart';

class KliniTextPickerField extends StatelessWidget {
  final String label;
  final Icon suffixIcon;
  final Function suffixIconOnPressed;
  final bool obscureText;
  final Function onTap;
  final FormFieldValidator<String> validator;
  final TextEditingController controller;
  final String initialValue;

  KliniTextPickerField({
    Key key,
    this.label,
    this.suffixIcon,
    this.suffixIconOnPressed,
    this.obscureText = false,
    this.onTap,
    this.validator,
    this.controller,
    this.initialValue,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: this.controller,
      onTap: this.onTap,
      readOnly: true,
      obscureText: this.obscureText,
      validator: this.validator,
      cursorColor: Colors.white,
      style: TextStyle(color: Colors.white, fontSize: 20),
      decoration: InputDecoration(
        labelText: this.label,
        labelStyle: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
        errorStyle: TextStyle(color: Colors.white),
        errorBorder: new UnderlineInputBorder(
          borderSide: new BorderSide(color: Colors.white, width: 0.0),
        ),
        enabledBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: Colors.white),
        ),
        focusedBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: Colors.white),
        ),
        suffixIcon: this.suffixIcon != null
            ? IconButton(
                icon: this.suffixIcon,
                onPressed: this.suffixIconOnPressed,
                color: Colors.white,
              )
            : null,
      ),
    );
  }
}
