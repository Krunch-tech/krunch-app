import 'package:flutter/material.dart';

class Chips {
  Widget buildChip(String tag) {
    return Chip(
      label: Text(tag, style: TextStyle(color: Colors.white)),
      backgroundColor: const Color(0xff6271FF),
      labelPadding: EdgeInsets.symmetric(horizontal: 10, vertical: 6),
    );
  }
}
