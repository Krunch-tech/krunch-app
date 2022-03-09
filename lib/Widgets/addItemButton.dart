import 'package:flutter/material.dart';
import 'package:krunch_app/Pages/itemAddPage.dart';

class AddItem extends StatelessWidget {
  const AddItem({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Container(
        // height: 20,
        // width: 20,
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.all(Radius.circular(10)),
            border: Border.all(width: 2.0, color: Color(0xff6271FF))),
        child: Stack(
          children: [
            Align(
              alignment: Alignment.center,
              child: Icon(
                Icons.add,
                color: Color(0xff6271FF),
                size: 36,
              ),
            ),
          ],
        ),
      ),
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => ItemAddPage()),
        );
      },
    );
  }
}
