import 'package:flutter/material.dart';
import '/Widgets/BottomBar.dart';

class ItemAdded extends StatefulWidget {
  const ItemAdded({Key? key}) : super(key: key);

  @override
  _ItemAddedState createState() => _ItemAddedState();
}

class _ItemAddedState extends State<ItemAdded> {
  bool liked = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            height: double.infinity,
            width: double.infinity,
            color: const Color(0xffF2F4F6),
          ),
          Column(
            children: [
              const SizedBox(height: 60),
              TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                    Navigator.pop(context);
                  },
                  child: const Row(
                    children: [
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
                child: Column(
                  children: [
                    Stack(
                      children: [
                        Container(
                          height: 400,
                          width: double.infinity,
                          decoration: const BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                          ),
                          child: Stack(
                            children: [
                              Container(
                                alignment: Alignment.bottomLeft,
                                child: liked
                                    ? IconButton(
                                        icon: const Icon(
                                          Icons.thumb_up_alt_rounded,
                                          color: Color(0xff6DB470),
                                        ),
                                        onPressed: () {
                                          setState(() {
                                            liked = !liked;
                                          });
                                        },
                                      )
                                    : IconButton(
                                        icon: const Icon(
                                          Icons.thumb_down_alt_rounded,
                                          color: Color(0xffDF866A),
                                        ),
                                        onPressed: () {
                                          setState(() {
                                            liked = !liked;
                                          });
                                        },
                                      ),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          width: double.infinity,
                          height: 32,
                          decoration: const BoxDecoration(
                              color: Color(0xff6DB470),
                              borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(10),
                                  topRight: Radius.circular(10))),
                          child: const Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(Icons.check, color: Colors.white, size: 20),
                              SizedBox(width: 10),
                              Text(
                                "Item Added!",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w700,
                                    fontSize: 12),
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 16),
                    const Row(
                      children: [
                        Text("Destination",
                            style: TextStyle(color: Color(0xff6271FF))),
                        Expanded(child: SizedBox(width: 1)),
                        Text("date and time",
                            style: TextStyle(color: Colors.black))
                      ],
                    ),
                    const SizedBox(height: 16),
                    const Align(
                      alignment: Alignment.topLeft,
                      child: Text("Name",
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 34,
                              fontWeight: FontWeight.w700,
                              letterSpacing: -1.5)),
                    ),
                    const Align(
                      alignment: Alignment.topLeft,
                      child: Text("Description"),
                    ),
                    const SizedBox(height: 16),
                    Container(
                      height: 30,
                      width: double.infinity,
                      color: const Color(0xff6271FF),
                      child: const Center(child: Text("tags")),
                    ),
                    const SizedBox(height: 40),
                    GestureDetector(
                      child: Container(
                        width: double.infinity,
                        decoration: const BoxDecoration(
                            color: Color(0xff6271FF),
                            borderRadius:
                                BorderRadius.all(Radius.circular(10))),
                        child: const Center(
                            child: Padding(
                          padding: EdgeInsets.symmetric(vertical: 12.0),
                          child: Text("Back to Home",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w500)),
                        )),
                      ),
                      onTap: () {
                        Navigator.pop(context);
                        Navigator.pop(context);
                      },
                    )
                  ],
                ),
              ),
            ],
          ),
          BottomBar(),
        ],
      ),
    );
  }
}
