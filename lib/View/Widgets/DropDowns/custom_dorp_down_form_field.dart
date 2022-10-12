import 'package:flutter/material.dart';

class CustomDropDownFormField<T> extends StatelessWidget {
  final List<DropdownMenuItem<T>> items;
  final void Function(T?)? onChanged;
  final String hint;
  final IconData icon;
  final bool isExpanded;
  final String? Function(T?)? validator;
  final T? value;
  final List<Widget> Function(BuildContext)? selectedItemBuilder;
  const CustomDropDownFormField({
    Key? key,
    required this.items,
    required this.onChanged,
    required this.hint,
    required this.icon,
    this.isExpanded = false,
    this.validator,
    this.value,
    this.selectedItemBuilder,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField<T>(
      items: items,
      onChanged: onChanged,
      hint: Row(
        children: [
          Text(hint),
        ],
      ),
      isExpanded: isExpanded,
      validator: validator,
      value: value,
      selectedItemBuilder: selectedItemBuilder,
      decoration: InputDecoration(
        prefixIcon: Icon(icon),
        focusColor: Theme.of(context).primaryColor,
        contentPadding:
            const EdgeInsets.symmetric(horizontal: 18, vertical: 18),
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
