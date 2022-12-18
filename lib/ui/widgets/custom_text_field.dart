import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CustomTextField extends StatelessWidget {
  final TextEditingController controller;
  final Color color;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final String? hint;
  final double borderRadius;
  final bool obscureText;
  final bool readOnly;
  final List<TextInputFormatter>? inputFormatters;
  final TextAlign textAlign;
  final int maxLines;
  final void Function(String)? onChanged;
  final String? Function(String?)? validator;
  const CustomTextField({
    required this.controller,
    required this.color,
    this.prefixIcon,
    this.suffixIcon,
    this.hint,
    this.borderRadius = 25,
    this.obscureText = false,
    this.readOnly = false,
    this.inputFormatters,
    this.textAlign = TextAlign.start,
    this.maxLines = 1,
    this.onChanged,
    this.validator,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onChanged: onChanged,
      maxLines: maxLines,
      textAlign: textAlign,
      inputFormatters: inputFormatters,
      controller: controller,
      obscureText: obscureText,
      obscuringCharacter: '•',
      readOnly: readOnly,
      validator: validator,
      style: const TextStyle(
        fontSize: 18,
        fontWeight: FontWeight.w500,
      ),
      decoration: InputDecoration(
        //hintTextDirection: TextDirection.rtl,
        filled: true,
        fillColor: color,
        prefixIcon: prefixIcon,
        suffixIcon: suffixIcon,
        hintText: hint,
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(borderRadius),
          borderSide: BorderSide(
            color: color,
          ),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(borderRadius),
          borderSide: const BorderSide(
            color: Colors.red,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(borderRadius),
          borderSide: BorderSide(
            color: color,
          ),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(borderRadius),
          borderSide: const BorderSide(
            color: Colors.red,
          ),
        ),
      ),
    );
  }
}
