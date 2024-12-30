import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CustomTextField extends StatefulWidget {
  final String labelText;
  final TextEditingController controller;
  final TextInputType keyboardType;
  final TextStyle? textStyle;
  final String? Function(String?)? validator; // Validation callback
  final IconData? prefixIcon; // Prefix icon
  final IconData? suffixIcon; // Suffix icon
  final bool obscureText; // Password visibility toggle
  final VoidCallback? onSuffixIconPressed; // Suffix icon action
  final int? maxLength; // Maximum length
  final String? hintText; // Hint text
  final TextAlign textAlign; // Text alignment
  final List<TextInputFormatter>? inputFormatters; // Custom input formatters
  final ValueChanged<String>? onChanged; // Callback for text change
  final bool autofocus; // Auto focus flag

  const CustomTextField({
    super.key,
    required this.labelText,
    required this.controller,
    this.keyboardType = TextInputType.text,
    this.textStyle,
    this.validator,
    this.prefixIcon,
    this.suffixIcon,
    this.obscureText = false,
    this.onSuffixIconPressed,
    this.maxLength,
    this.hintText,
    this.textAlign = TextAlign.start,
    this.inputFormatters,
    this.onChanged,
    this.autofocus = false,
  });

  @override
  _CustomTextFieldState createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  bool _obscureText = false;

  @override
  void initState() {
    super.initState();
    _obscureText = widget.obscureText;
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.controller,
      keyboardType: widget.keyboardType,
      obscureText: _obscureText,
      validator: widget.validator,
      style: widget.textStyle,
      textAlign: widget.textAlign,
      autofocus: widget.autofocus,
      maxLength: widget.maxLength,
      inputFormatters: widget.inputFormatters,
      onChanged: widget.onChanged,
      decoration: InputDecoration(
        labelText: widget.labelText,
        hintText: widget.hintText,
        border: OutlineInputBorder(),
        prefixIcon: widget.prefixIcon != null ? Icon(widget.prefixIcon) : null,
        suffixIcon: widget.suffixIcon != null
            ? GestureDetector(
                onTap: widget.onSuffixIconPressed,
                child: Icon(widget.suffixIcon),
              )
            : null,
        counterText: widget.maxLength != null
            ? '${widget.controller.text.length} / ${widget.maxLength}'
            : null,
      ),
    );
  }
}
