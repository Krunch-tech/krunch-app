import 'package:flutter/material.dart';

class ListCard {
  Widget buildListCard() {
    return Column(
      children: [
        Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(10)),
              color: Colors.white),
          child: Padding(
            padding: const EdgeInsets.fromLTRB(22, 0, 0, 0),
            child: Row(
              children: [
                Expanded(
                  child: Row(
                    children: [
                      Icon(Icons.coffee_rounded),
                      SizedBox(width: 21),
                      Text(
                        "Coffee",
                        style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.w600,
                            fontSize: 14,
                            fontFamily: 'SF Pro'),
                      )
                    ],
                  ),
                ),
                Row(
                  children: [
                    Text("8", style: TextStyle(color: Colors.grey.shade400)),
                    IconButton(
                        icon: Icon(
                          Icons.keyboard_arrow_right,
                          size: 24,
                          color: Colors.grey.shade400,
                        ),
                        onPressed: () {})
                  ],
                ),
              ],
            ),
          ),
        ),
        SizedBox(height: 16)
      ],
    );
  }
}
