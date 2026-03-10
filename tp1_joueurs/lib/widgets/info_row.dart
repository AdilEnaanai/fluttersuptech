import 'package:flutter/material.dart';

class InfoRow extends StatelessWidget {
  final String icon;
  final String label;
  final String value;

  const InfoRow({
    super.key,
    required this.icon,
    required this.label,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    return Text('$icon $label:$value', style: TextStyle(fontSize: 12));
  }
}
