import 'package:flutter/material.dart';

class Chips {
  Widget buildChip(String tag) {
    return Chip(
      label: Text(tag,
          style: const TextStyle(
              color: Colors.white, fontWeight: FontWeight.w400, fontSize: 14)),
      backgroundColor: const Color(0xff6271FF),
      labelPadding: const EdgeInsets.symmetric(horizontal: 10, vertical: 3),
    );
  }
}
