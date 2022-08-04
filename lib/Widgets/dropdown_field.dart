import 'package:flutter/material.dart';
import '../Constants/resources.dart';

class DropDownField extends StatefulWidget {
  final String label;
  final List<DropdownMenuItem<String>> items;
  final Function(String)? onSelection;
  const DropDownField({
    Key? key,
    this.label = "",
    this.items = const [],
    this.onSelection(value)?,
  }) : super(key: key);

  @override
  State<DropDownField> createState() => _DropDownFieldState();
}

class _DropDownFieldState extends State<DropDownField> {
  String? selectedValue;

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField(
      autovalidateMode: AutovalidateMode.onUserInteraction,
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(6),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(6),
          borderSide: BorderSide(color: R.colors.errorColor),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(6),
          borderSide: BorderSide(color: R.colors.errorColor),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(6),
          borderSide: BorderSide(color: Colors.grey.shade600),
        ),
        contentPadding:
            const EdgeInsets.symmetric(vertical: 17, horizontal: 20),
        label: Text(widget.label),
      ),
      icon: const Icon(
        Icons.keyboard_arrow_down,
        size: 25,
      ),
      validator: (value) {
        if (value == null) {
          return R.constants.noCountrySelected;
        }
        return null;
      },
      elevation: 1,
      value: selectedValue,
      onChanged: (String? newValue) {
        setState(() {
          selectedValue = newValue!;
          if (widget.onSelection != null) {
            widget.onSelection!(newValue);
          }
        });
      },
      items: widget.items,
    );
  }
}
