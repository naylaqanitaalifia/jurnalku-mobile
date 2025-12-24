import 'package:flutter/material.dart';

class AppInputField extends StatefulWidget {
  final String label;
  final String? hintText;
  final TextEditingController? controller;
  final TextInputType keyboardType;
  final bool isPassword;
  final bool obscureText;
  final String? Function(String?)? validator;
  final bool readOnly;
  
  const AppInputField({
    super.key, 
    required this.label,
    required this.controller,
    this.hintText,
    this.keyboardType = TextInputType.text,
    this.isPassword = false,
    this.obscureText = false,
    this.validator,
    this.readOnly = false, required String initialValue,
  });

  @override
  State<AppInputField> createState() => _AppInputFieldState();
}

class _AppInputFieldState extends State<AppInputField> {
  bool _obscure = true; // nyimpen state, password lagi disembunyikan atau ngga

  @override

  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          widget.label,
          style: TextStyle(
            color: Colors.black,
            fontSize: 14,
            fontWeight: FontWeight.w500,
          ),
        ),
        const SizedBox(height: 8),

        TextFormField(
          controller: widget.controller,
          keyboardType: widget.keyboardType,
          obscureText: widget.isPassword ? _obscure: false,
          validator: widget.validator,
          readOnly: widget.readOnly,

          decoration: InputDecoration(
            contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),

            hintText: widget.hintText,
            hintStyle: TextStyle(
              color: Color(0xFF9ea6b4),
              fontSize: 14,
              fontWeight: FontWeight.normal,
            ),

            filled: widget.readOnly,
            fillColor: Color(0xFFf4f4f5),

            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: BorderSide(
                color: widget.readOnly
                  ? const Color(0xFFebeef3)
                  : const Color(0xFFd0d5dd),
              ),
            ),

            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: BorderSide(
                color: Color(0xFF02398c),
                width: 1.5,
              ),
            ),

            suffixIcon: widget.isPassword
              ? IconButton(
                  padding: const EdgeInsets.only(right: 12),
                  icon: Icon(
                    _obscure ? Icons.visibility_off : Icons.visibility,
                    color: Color(0xFF6b7280),
                  ),
                  onPressed: () {
                    setState(() {
                      _obscure = !_obscure;
                    });
                  },
                )
              : null,
          ),
        ),
      ],
    );
  }
}
  