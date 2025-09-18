import 'package:flutter/material.dart';

class KeyValueText extends StatelessWidget {
  final String keyText;
  final String valueText;
  final Color? keyColor;
  final Color? valueColor;
  final double? fontSize;
  final FontWeight? fontWeight;

  const KeyValueText({
    super.key,
    required this.keyText,
    required this.valueText,
    this.keyColor,
    this.valueColor,
    this.fontSize,
    this.fontWeight,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start, // multiline support
      children: [
        Expanded(
          flex: 2,
          child: Text(
            keyText,
            style: TextStyle(
              color: keyColor ?? Colors.black,
              fontSize: fontSize ?? 14,
              fontWeight: fontWeight ?? FontWeight.w500,
            ),
            softWrap: true,
            overflow: TextOverflow.visible,
          ),
        ),
        const SizedBox(width: 8),
        Expanded(
          flex: 3,
          child: Text(
            valueText,
            style: TextStyle(
              color: valueColor ?? Colors.black,
              fontSize: fontSize ?? 14,
              fontWeight: fontWeight ?? FontWeight.w400,
            ),
            softWrap: true,
            overflow: TextOverflow.visible,
          ),
        ),
      ],
    );
  }
}
