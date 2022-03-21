import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';
import 'package:krunch_app/Pages/itemAdded.dart';
import 'package:krunch_app/Widgets/BottomBar.dart';
import 'package:krunch_app/Widgets/chips.dart';
import 'package:krunch_app/constants.dart';
import 'package:image_picker/image_picker.dart';

class ItemAddPage extends StatefulWidget {
  const ItemAddPage({Key? key}) : super(key: key);

  @override
  _ItemAddPageState createState() => _ItemAddPageState();
}

ImagePicker picker = ImagePicker();

class _ItemAddPageState extends State<ItemAddPage> {
  var screen_no = 1;
  bool isNext = false;
  var itemName;
  var itemDescription;
  bool imageSelected = false;
  bool mapDisplayed = false;
  bool tagsPresent = false;
  bool button1 = false;
  bool button2 = false;
  List<String> chips = [];
  XFile? _image;
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
                    children: const [
                      Icon(
                        Icons.keyboard_arrow_left,
                        color: Color(0xff6271FF),
                      ),
                      Text("Home", style: TextStyle(color: Color(0xff6271FF)))
                    ],
                  )),
              const SizedBox(height: 13),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Row(
                  children: const [
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
              const SizedBox(height: 16),

              /// first phase
              if (screen_no == 1)
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: Column(
                    children: [
                      GestureDetector(
                        child: Container(
                          width: double.infinity,
                          height: 350,
                          decoration: const BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                          ),
                          child: imageSelected
                              ? Image.file(File(_image!.path), fit: BoxFit.fill)
                              : Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Icon(
                                      Icons.image_rounded,
                                      color: Colors.grey.shade200,
                                    ),
                                    const SizedBox(height: 10),
                                    Text("Add image",
                                        style: TextStyle(
                                            color: Colors.grey.shade300))
                                  ],
                                ),
                        ),
                        onTap: () {
                          showDialog<void>(
                            context: context,
                            barrierDismissible: false, // user must tap button!
                            builder: (BuildContext context) {
                              return AlertDialog(
                                title: const Text('Upload Image'),
                                content: Text(
                                    "Kindly choose how to upload the image"),
                                actions: <Widget>[
                                  /// gallery, camera, cancel
                                  TextButton(
                                    child: const Text('Open Gallery'),
                                    onPressed: () async {
                                      XFile? image = await picker.pickImage(
                                          source: ImageSource.gallery);
                                      if (image != null) {
                                        setState(() {
                                          imageSelected = true;
                                          _image = image;
                                        });
                                      }
                                      Navigator.pop(context);
                                    },
                                  ),
                                  TextButton(
                                    child: const Text('Open Camera'),
                                    onPressed: () async {
                                      XFile? image = await picker.pickImage(
                                          source: ImageSource.camera);
                                      if (image != null) {
                                        setState(() {
                                          imageSelected = true;
                                          _image = image;
                                        });
                                      }
                                      Navigator.pop(context);
                                    },
                                  ),
                                  TextButton(
                                    child: const Text('Cancel'),
                                    onPressed: () {
                                      Navigator.pop(context);
                                    },
                                  ),
                                ],
                              );
                            },
                          );
                        },
                      ),
                      const SizedBox(height: 16),
                      TextField(
                        textAlign: TextAlign.start,
                        onChanged: (value) {
                          itemName = value;
                        },
                        decoration: kTextFieldDecoration.copyWith(
                            fillColor: Colors.white,
                            filled: true,
                            hintText: 'Name'),
                      ),
                      const SizedBox(height: 16),
                      TextField(
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
                )

              /// second phase
              else if (screen_no == 2)
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: Column(
                    children: [
                      Stack(
                        children: [
                          // Container(
                          //   width: double.infinity,
                          //   height: 470,
                          //   decoration: const BoxDecoration(
                          //     color: Color(0xffF8FFF7),
                          //     borderRadius:
                          //         BorderRadius.all(Radius.circular(10)),
                          //   ),
                          //   child: Column(
                          //     mainAxisAlignment: MainAxisAlignment.center,
                          //     children: [
                          //       Icon(
                          //         Icons.location_on_rounded,
                          //         color: Colors.grey.shade300,
                          //       ),
                          //       SizedBox(height: 10),
                          //       Text("Add location",
                          //           style:
                          //               TextStyle(color: Colors.grey.shade400))
                          //     ],
                          //   ),
                          // ),
                          Material(
                            elevation: 1.5,
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                            child: TextField(
                              textAlign: TextAlign.start,
                              onChanged: (value) {
                                itemName = value;
                              },
                              decoration: kTextFieldDecoration.copyWith(
                                  fillColor: Colors.white,
                                  filled: true,
                                  hintText: 'Search for a place'),
                            ),
                          ),
                        ],
                      ),
                      // const SizedBox(height: 16),
                      // TextField(
                      //   textAlign: TextAlign.start,
                      //   onChanged: (value) {
                      //     itemName = value;
                      //   },
                      //   decoration: kTextFieldDecoration.copyWith(
                      //       fillColor: Colors.white,
                      //       filled: true,
                      //       hintText: 'Date'),
                      // ),
                      // const SizedBox(height: 16),
                    ],
                  ),
                )

              /// third phase
              else
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: Column(
                    children: [
                      GestureDetector(
                        child: Container(
                          width: double.infinity,
                          height: 350,
                          decoration: const BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                          ),
                          child: tagsPresent
                              // ? Wrap(
                              //     children: chips,
                              //   )
                              ? Container(
                                  child: Chips().buildChip("random24"),
                                )
                              : Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Icon(
                                      Ionicons.pricetag_outline,
                                      color: Colors.grey.shade200,
                                    ),
                                    const SizedBox(height: 10),
                                    Text("Add tags",
                                        style: TextStyle(
                                            color: Colors.grey.shade300))
                                  ],
                                ),
                        ),
                        onTap: () {},
                      ),
                      const SizedBox(height: 16),
                      TextField(
                        textAlign: TextAlign.start,
                        onChanged: (value) {
                          itemName = value;
                        },
                        decoration: kTextFieldDecoration.copyWith(
                            fillColor: Colors.white,
                            filled: true,
                            hintText: 'Add to a list'),
                      ),
                      const SizedBox(height: 16),
                      Row(
                        children: [
                          Expanded(
                            child: GestureDetector(
                                child: Container(
                                  decoration: BoxDecoration(
                                      color: button1
                                          ? const Color(0xff6DB470)
                                          : const Color(0xff6DB470)
                                              .withOpacity(0.2),
                                      borderRadius: const BorderRadius.only(
                                          topLeft: Radius.circular(10),
                                          bottomLeft: Radius.circular(10))),
                                  padding:
                                      const EdgeInsets.symmetric(vertical: 10),
                                  child: Icon(Icons.thumb_up_alt_outlined,
                                      color: button1
                                          ? Colors.white
                                          : Color(0xff6DB470)),
                                ),
                                onTap: () {
                                  setState(() {
                                    button1 = !button1;
                                    button2 = false;
                                  });
                                }),
                          ),
                          Expanded(
                            child: GestureDetector(
                              child: Container(
                                decoration: BoxDecoration(
                                    color: button2
                                        ? const Color(0xffDF866A)
                                        : const Color(0xffDF866A)
                                            .withOpacity(0.2),
                                    borderRadius: const BorderRadius.only(
                                        topRight: Radius.circular(10),
                                        bottomRight: Radius.circular(10))),
                                padding:
                                    const EdgeInsets.symmetric(vertical: 10),
                                child: Icon(Icons.thumb_down_alt_outlined,
                                    color: button2
                                        ? Colors.white
                                        : Color(0xffDF866A)),
                              ),
                              onTap: () {
                                setState(() {
                                  button2 = !button2;
                                  button1 = false;
                                });
                              },
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                ),

              /// next button and bottom circles from here
              Expanded(child: SizedBox(height: 1)),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Column(
                  children: [
                    const SizedBox(height: 16),
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
                                    child: const Center(
                                        child: Padding(
                                            padding: EdgeInsets.symmetric(
                                                vertical: 12.0),
                                            child: Icon(
                                              Icons.arrow_back_rounded,
                                              color: Color(0xff6271FF),
                                            ))),
                                  ),
                                  onTap: () {
                                    setState(() {
                                      if (screen_no == 2) isNext = false;
                                      if (screen_no >= 1) screen_no -= 1;
                                    });
                                  },
                                ),
                              ),
                              const SizedBox(width: 16),
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
                                      if (screen_no < 3)
                                        screen_no += 1;
                                      else {
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  ItemAdded()),
                                        );
                                      }
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
                                isNext = true;
                                if (screen_no <= 3) {
                                  screen_no += 1;
                                }
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
              ),
              SizedBox(height: 60)
            ],
          ),
          const BottomBar()
        ],
      ),
    );
  }
}
