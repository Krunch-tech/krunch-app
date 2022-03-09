import 'package:flutter/material.dart';

class BottomBar extends StatelessWidget {
  const BottomBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(19, 10, 19, 38),
      child: Row(
        children: [
          Expanded(
            child: Align(
              alignment: Alignment.bottomLeft,
              child: IconButton(
                  icon: Icon(
                    Icons.search_rounded,
                    color: Color(0xff6271FF),
                    size: 24,
                  ),
                  onPressed: () {}),
            ),
          ),
          Align(
            alignment: Alignment.bottomRight,
            child: IconButton(
              icon: Icon(
                Icons.qr_code_scanner_rounded,
                size: 24,
                color: Color(0xff6271FF),
              ),
              onPressed: () {},
            ),
          )
        ],
      ),
    );
  }
}
