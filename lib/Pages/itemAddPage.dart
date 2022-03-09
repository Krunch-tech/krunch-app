import 'package:flutter/material.dart';
import 'package:krunch_app/Widgets/BottomBar.dart';
import 'package:krunch_app/constants.dart';

class ItemAddPage extends StatefulWidget {
  const ItemAddPage({Key? key}) : super(key: key);

  @override
  _ItemAddPageState createState() => _ItemAddPageState();
}

class _ItemAddPageState extends State<ItemAddPage> {
  var screen_no = 1;
  bool imageSelected = false;
  bool isNext = false;
  var itemName;
  var itemDescription;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            height: double.infinity,
            width: double.infinity,
            color: Color(0xffF2F4F6),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 60),
              TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Row(
                    children: [
                      Icon(
                        Icons.keyboard_arrow_left,
                        color: Color(0xff6271FF),
                      ),
                      Text("View Items",
                          style: TextStyle(color: Color(0xff6271FF)))
                    ],
                  )),
              SizedBox(height: 13),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Row(
                  children: [
                    Text("Add an item",
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 34,
                            fontWeight: FontWeight.w700,
                            letterSpacing: -1.5)),
                    Expanded(child: SizedBox(width: 1))
                  ],
                ),
              ),
              SizedBox(height: 16),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Column(
                  children: [
                    GestureDetector(
                      child: Container(
                        width: double.infinity,
                        height: 350,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.image_rounded,
                              color: Colors.grey.shade200,
                            ),
                            SizedBox(height: 10),
                            Text("Add image",
                                style: TextStyle(color: Colors.grey.shade300))
                          ],
                        ),
                      ),
                      onTap: () {},
                    ),
                    SizedBox(height: 16),
                    TextField(
                      autofocus: true,
                      textAlign: TextAlign.start,
                      onChanged: (value) {
                        itemName = value;
                      },
                      decoration: kTextFieldDecoration.copyWith(
                          fillColor: Colors.white,
                          filled: true,
                          hintText: 'Name'),
                    ),
                    SizedBox(height: 16),
                    TextField(
                      autofocus: true,
                      textAlign: TextAlign.start,
                      onChanged: (value) {
                        itemDescription = value;
                      },
                      decoration: kTextFieldDecoration.copyWith(
                          fillColor: Colors.white,
                          filled: true,
                          hintText: 'Description'),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Column(
                  children: [
                    SizedBox(height: 16),
                    isNext
                        ? Row(
                            children: [
                              Flexible(
                                flex: 1,
                                child: GestureDetector(
                                  child: Container(
                                    decoration: const BoxDecoration(
                                        color: Colors.white,
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(10))),
                                    child: Center(
                                        child: Padding(
                                            padding: const EdgeInsets.symmetric(
                                                vertical: 12.0),
                                            child: Icon(
                                              Icons.arrow_back_rounded,
                                              color: Color(0xff6271FF),
                                            ))),
                                  ),
                                  onTap: () {
                                    setState(() {
                                      if (screen_no >= 1) screen_no -= 1;
                                    });
                                  },
                                ),
                              ),
                              SizedBox(width: 16),
                              Flexible(
                                flex: 5,
                                child: GestureDetector(
                                  child: Container(
                                    decoration: const BoxDecoration(
                                        color: Color(0xff6271FF),
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(10))),
                                    child: Center(
                                        child: Padding(
                                      padding: const EdgeInsets.symmetric(
                                          vertical: 12.0),
                                      child: Text("Next",
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontWeight: FontWeight.w500)),
                                    )),
                                  ),
                                  onTap: () {
                                    setState(() {
                                      if (screen_no <= 3) screen_no += 1;
                                    });
                                  },
                                ),
                              ),
                            ],
                          )
                        : GestureDetector(
                            child: Container(
                              width: double.infinity,
                              decoration: const BoxDecoration(
                                  color: Color(0xff6271FF),
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(10))),
                              child: Center(
                                  child: Padding(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 12.0),
                                child: Text("Next",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.w500)),
                              )),
                            ),
                            onTap: () {
                              setState(() {
                                if (screen_no <= 3) {
                                  screen_no += 1;
                                }
                                isNext = true;
                              });
                            },
                          ),
                    SizedBox(height: 16),
                    Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                      Icon(
                        Icons.circle,
                        size: 14,
                        color: Color(0xff6271FF),
                      ),
                      SizedBox(width: 17),
                      if (screen_no >= 2)
                        Icon(
                          Icons.circle,
                          size: 14,
                          color: Color(0xff6271FF),
                        )
                      else
                        Icon(
                          Icons.circle,
                          size: 14,
                          color: Color(0xff6271FF).withOpacity(0.2),
                        ),
                      SizedBox(width: 17),
                      if (screen_no == 3)
                        Icon(
                          Icons.circle,
                          size: 14,
                          color: Color(0xff6271FF),
                        )
                      else
                        Icon(
                          Icons.circle,
                          size: 14,
                          color: Color(0xff6271FF).withOpacity(0.2),
                        )
                    ])
                  ],
                ),
              )
            ],
          ),
          BottomBar()
        ],
      ),
    );
  }
}
