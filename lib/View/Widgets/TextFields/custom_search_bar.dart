import 'package:flutter/material.dart';

class CustomSearchBar extends StatelessWidget {
  final String? label;
  final String? hint;
  final int? maxLegth;
  final TextEditingController? controller;
  final Widget? prefix;
  final Widget? suffix;
  final TextStyle? labelStyle;
  final TextStyle? hintStyle;
  final void Function(String)? onChanged;
  final bool enabled;
  final TextInputType? keyboardType;
  final bool readOnly;
  final VoidCallback? onTap;
  final Color? fillColor;
  const CustomSearchBar({
    Key? key,
    this.label,
    this.hint,
    this.maxLegth,
    this.controller,
    this.prefix,
    this.suffix,
    this.labelStyle,
    this.hintStyle,
    this.onChanged,
    this.enabled = true,
    this.keyboardType,
    this.readOnly = true,
    this.onTap,
    this.fillColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: kToolbarHeight,
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 18,
          vertical: 4,
        ),
        child: TextField(
          maxLength: maxLegth,
          controller: controller,
          onTap: onTap,
          onChanged: onChanged,
          enabled: enabled,
          readOnly: readOnly,
          keyboardType: keyboardType,
          decoration: InputDecoration(
            label: label == null ? null : Text(label!),
            hintText: hint,
            labelStyle: labelStyle,
            hintStyle: hintStyle,
            prefixIcon: prefix,
            suffixIcon: suffix,
            filled: true,
            fillColor: fillColor ?? Colors.grey.withOpacity(0.5),
            contentPadding: const EdgeInsets.symmetric(vertical: 0),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(14),
              borderSide: BorderSide.none,
            ),
          ),
        ),
      ),
    );
  }
}
