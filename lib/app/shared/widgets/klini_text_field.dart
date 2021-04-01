import 'package:flutter/material.dart';

class KliniTextField extends StatelessWidget {
  final String label;
  final Icon suffixIcon;
  final Function suffixIconOnPressed;
  final bool obscureText;
  final FormFieldValidator<String> validator;
  final TextEditingController controller;
  final int maxLength;
  final TextInputType textInputType;

  KliniTextField(
      {Key key,
      this.label,
      this.suffixIcon,
      this.suffixIconOnPressed,
      this.obscureText = false,
      this.validator,
      this.controller,
      this.maxLength,
      this.textInputType})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: this.controller,
      obscureText: this.obscureText,
      keyboardType: this.textInputType ?? TextInputType.text,
      maxLength: this.maxLength ?? 100,
      validator: this.validator,
      cursorColor: Colors.white,
      style: TextStyle(color: Colors.white, fontSize: 20),
      decoration: InputDecoration(
        counterText: "",
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
