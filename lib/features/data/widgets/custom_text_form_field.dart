import 'package:flutter/material.dart';
import '../../../core/theme/app_color.dart';

class CustomTextFormField extends StatefulWidget {
  final double width;
  final double? height;
  final Color? textColor;
  final Color? backgroundColor;
  final bool isPassword;
  final String? hintText;
  final TextEditingController? controller;
  final String? Function(String?)? validator;
  final TextInputType? keyboardType;
  final bool enabled;

  final Widget? prefixIcon;

  const CustomTextFormField({
    super.key,
    required this.width,
    this.height,
    this.textColor,
    this.backgroundColor,
    required this.isPassword,
    this.hintText,
    this.controller,
    this.validator,
    this.keyboardType,
    this.enabled = true,
    this.prefixIcon,
  });

  @override
  State<CustomTextFormField> createState() => _CustomTextFormFieldState();
}

class _CustomTextFormFieldState extends State<CustomTextFormField> {
  bool _obscureText = true;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: widget.width,
      height: widget.height,
      child: TextFormField(
        controller: widget.controller,
        obscureText: widget.isPassword ? _obscureText : false,
        validator: widget.validator,
        keyboardType: widget.keyboardType,
        enabled: widget.enabled,
        cursorColor: AppColor.primary,
        style: TextStyle(
          color: widget.textColor ?? AppColor.primary,
        ),
        decoration: InputDecoration(
          filled: true,
          fillColor: widget.backgroundColor ?? AppColor.gray,
          hintText: widget.hintText,
          hintStyle: TextStyle(
            color: widget.textColor ?? AppColor.primary,
          ),
          prefixIcon: widget.prefixIcon,
          contentPadding: const EdgeInsets.symmetric(
            horizontal: 16,
            vertical: 16,
          ),
          suffixIcon: widget.isPassword
              ? IconButton(
            icon: Icon(
              _obscureText
                  ? Icons.visibility_off
                  : Icons.visibility,
              color: AppColor.black,
            ),
            onPressed: () {
              setState(() {
                _obscureText = !_obscureText;
              });
            },
          )
              : null,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(18),
            borderSide: BorderSide.none,
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(18),
            borderSide: BorderSide.none,
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(18),
            borderSide: BorderSide(
              color: AppColor.primary,
              width: 1.5,
            ),
          ),
          errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(18),
            borderSide: const BorderSide(
              color: Colors.red,
              width: 1.5,
            ),
          ),
          focusedErrorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(18),
            borderSide: const BorderSide(
              color: Colors.red,
              width: 1.5,
            ),
          ),
        ),
      ),
    );
  }
}