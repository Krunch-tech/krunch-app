import 'package:flutter/material.dart';

class ItemCard extends StatefulWidget {
  const ItemCard({Key? key}) : super(key: key);

  @override
  _ItemCardState createState() => _ItemCardState();
}

class _ItemCardState extends State<ItemCard> {
  bool isLiked = false;
  @override
  Widget build(BuildContext context) {
    return Container(
      // height: 20,
      // width: 20,
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(10)),
          border: isLiked
              ? Border.all(color: Color(0xffFFCE4F), width: 2.0)
              : null),
      child: Stack(
        children: [
          Align(
            alignment: Alignment.topRight,
            child: IconButton(
                icon: Icon(
                  Icons.star_rounded,
                  color: isLiked ? Color(0xffFFCE4F) : Colors.grey.shade300,
                  size: 20,
                ),
                onPressed: () {
                  setState(() {
                    isLiked = !isLiked;
                  });
                }),
          ),
          Align(
            alignment: Alignment.bottomLeft,
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 14.0, vertical: 14.0),
              child: Text("Name of item",
                  style: TextStyle(
                      color: Colors.white, fontWeight: FontWeight.bold)),
            ),
          )
        ],
      ),
    );
  }
}
