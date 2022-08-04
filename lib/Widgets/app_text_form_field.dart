import 'package:flutter/material.dart';
import '.././Constants/resources.dart';

class AppTextFormField extends StatefulWidget {
  final String label;
  final TextInputType keyboardType;
  final TextEditingController controller;
  final bool isPassword;
  final Function(String)? validator;

  const AppTextFormField(
      {Key? key,
      this.label = "",
      this.keyboardType = TextInputType.text,
      this.isPassword = false,
      required this.controller,
      this.validator(value)?})
      : super(key: key);

  @override
  State<AppTextFormField> createState() => _AppTextFormFieldState();
}

class _AppTextFormFieldState extends State<AppTextFormField> {
  bool showPassword = false;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20),
      child: TextFormField(
        controller: widget.controller,
        keyboardType: widget.keyboardType,
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
          suffixIcon: widget.isPassword
              ? GestureDetector(
                  onTap: () {
                    setState(() {
                      showPassword = !showPassword;
                    });
                  },
                  child: Padding(
                    padding: const EdgeInsets.only(right: 10),
                    child: Icon(
                      showPassword ? Icons.visibility_off : Icons.visibility,
                      color: Colors.black87,
                    ),
                  ),
                )
              : null,
          label: Text(widget.label),
          errorStyle: TextStyle(
            color: R.colors.errorColor,
          ),
        ),
        obscureText: widget.isPassword ? !showPassword : false,
        validator: (value) =>
            widget.validator != null ? widget.validator!(value ?? "") : null,
      ),
    );
  }
}
