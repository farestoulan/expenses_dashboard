import 'package:flutter/material.dart';
import 'package:responsive_dash_board/core/app_styles.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({super.key, required this.hint, this.onChanged});
  final String hint;
  final ValueChanged<String>? onChanged;
  @override
  Widget build(BuildContext context) {
    return TextField(
      onChanged: onChanged,
      decoration: InputDecoration(
          hintText: hint,
          hintStyle: AppStyles.styleRegular16(context).copyWith(
            color: const Color(0xFFAAAAAA),
          ),
          fillColor: const Color(0xFFFAFAFA),
          filled: true,
          border: buildBorder(),
          enabledBorder: buildBorder(),
          focusedBorder: buildBorder()),
    );
  }

  OutlineInputBorder buildBorder() {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(12),
      borderSide: const BorderSide(
        color: Color(0xFFFAFAFA),
      ),
    );
  }
}
