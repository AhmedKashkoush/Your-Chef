import 'package:flutter/material.dart';

class CustomOutlinedFormField extends StatelessWidget {
  final String? label;
  final String? hint;
  final int? maxLegth;
  final TextEditingController? controller;
  final Widget? prefix;
  final Widget? suffix;
  final TextStyle? labelStyle;
  final TextStyle? hintStyle;
  final String? Function(String?)? validator;
  final void Function(String)? onChanged;
  final bool enabled;
  final bool obscure;
  final TextInputType? keyboardType;
  const CustomOutlinedFormField({
    Key? key,
    this.label,
    this.hint,
    this.controller,
    this.prefix,
    this.suffix,
    this.labelStyle,
    this.hintStyle,
    this.validator,
    this.onChanged,
    this.maxLegth,
    this.enabled = true,
    this.obscure = false,
    this.keyboardType,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      validator: validator,
      onChanged: onChanged,
      maxLength: maxLegth,
      obscureText: obscure,
      keyboardType: keyboardType,
      decoration: InputDecoration(
        focusColor: Theme.of(context).primaryColor,
        label: Text(label!),
        labelStyle: labelStyle ??
            TextStyle(
              fontSize: 18,
              fontStyle: FontStyle.normal,
              fontWeight: FontWeight.normal,
              letterSpacing: 0,
            ),
        hintText: hint,
        hintStyle: hintStyle,
        prefixIcon: prefix,
        suffixIcon: suffix,
        enabled: enabled,
        floatingLabelStyle: TextStyle(
          color: Theme.of(context).primaryColor,
          fontSize: 18,
          fontStyle: FontStyle.normal,
          fontWeight: FontWeight.normal,
          letterSpacing: 0,
        ),
        contentPadding:
            const EdgeInsets.symmetric(horizontal: 18, vertical: 18),
        suffixIconColor: Theme.of(context).primaryColor,
        prefixIconColor: Theme.of(context).primaryColor,
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(32),
          borderSide: BorderSide(
            color: Theme.of(context).primaryColor,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(32),
          borderSide: BorderSide(
            color: Theme.of(context).primaryColor,
            width: 2,
          ),
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(32),
          borderSide: BorderSide(
            color: Theme.of(context).primaryColor,
          ),
        ),
      ),
    );
  }
}
