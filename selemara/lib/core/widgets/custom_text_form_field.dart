import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:selemara/core/constants/app_colors.dart';
import 'package:selemara/core/constants/app_responsive.dart';

class CustomTextFormField extends StatefulWidget {
  final TextEditingController? controller;
  final String hintText;
  final bool isPassword;
  final String? Function(String?)? validator;
  final TextInputType keyboardType;
  final String? prefixIcon;
  final Widget? suffixIcon;
  final bool readOnly;
  final VoidCallback? onTap;

  const CustomTextFormField({
    super.key,
    this.controller,
    required this.hintText,
    this.isPassword = false,
    this.validator,
    this.keyboardType = TextInputType.text,
    this.prefixIcon,
    this.suffixIcon,
    this.readOnly = false,
    this.onTap,
  });

  @override
  State<CustomTextFormField> createState() => _CustomTextFormFieldState();
}

class _CustomTextFormFieldState extends State<CustomTextFormField> {
  bool _obscureText = true;
  final res = AppResponsive();

  @override
  void initState() {
    super.initState();
    _obscureText = widget.isPassword;
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.controller,
      obscureText: _obscureText,
      validator: widget.validator,
      keyboardType: widget.keyboardType,
      readOnly: widget.readOnly,
      onTap: widget.onTap,

      style: GoogleFonts.inter(
        color: AppColors.textColor,
        fontSize: res.sp(14),
        fontWeight: FontWeight.w400,
      ),
      decoration: InputDecoration(
        filled: true,
        fillColor: Colors.white,
        hintText: widget.hintText,

        hintStyle: GoogleFonts.inter(
          color: AppColors.textColor.withValues(alpha: 0.5),
          fontSize: res.sp(14),
          fontWeight: FontWeight.w400,
        ),
        prefixIcon:
            widget.prefixIcon != null
                ? Padding(
                  padding: EdgeInsets.only(
                    left: res.wp(16),
                  ), // Left padding added here
                  child: Image.asset(
                    widget.prefixIcon!,
                    width: res.wp(16),
                    height: res.hp(10),
                    fit: BoxFit.contain,
                  ),
                )
                : null,
        prefixIconConstraints: BoxConstraints(
          minWidth:
              res.isTablet
                  ? res.wp(20)
                  : res.wp(35), // Adjusted to fit the icon + padding
          minHeight: res.hp(40),
        ),
        suffixIcon:
            widget.isPassword
                ? IconButton(
                  icon: Icon(
                    _obscureText ? Icons.visibility_off : Icons.visibility,
                    color: Colors.grey,
                    size: res.sp(20),
                  ),
                  onPressed:
                      () => setState(() {
                        _obscureText = !_obscureText;
                      }),
                )
                : widget.suffixIcon,
        contentPadding: EdgeInsets.symmetric(
          horizontal: res.wp(30),
          vertical: res.hp(12),
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(24),
          borderSide: const BorderSide(color: Color(0xFFF5F5F5)),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(24),
          borderSide: const BorderSide(color: Color(0xFFF5F5F5)),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(24),
          borderSide: const BorderSide(color: Color(0xFFF5F5F5)),
        ),
      ),
    );
  }
}
