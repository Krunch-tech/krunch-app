import 'package:flutter/material.dart';
import '/Widgets/BottomBar.dart';
import '/Widgets/listCard.dart';

class Lists extends StatefulWidget {
  const Lists({Key? key}) : super(key: key);

  @override
  _ListsState createState() => _ListsState();
}

class _ListsState extends State<Lists> {
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
          SizedBox(
            height: double.infinity,
            width: double.infinity,
            child: Column(
              children: [
                const SizedBox(height: 60),
                Column(
                  children: [
                    Row(
                      children: [
                        Expanded(
                          child: TextButton(
                            child: const Row(
                              children: [
                                Icon((Icons.keyboard_arrow_left),
                                    color: Color(0xff6271FF)),
                                Text("Home",
                                    style: TextStyle(color: Color(0xff6271FF))),
                              ],
                            ),
                            onPressed: () {
                              Navigator.pop(context);
                            },
                          ),
                        ),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(16, 0, 16, 0),
                      child: Row(
                        children: [
                          const Expanded(
                              child: Text("Lists",
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.w700,
                                      fontSize: 34,
                                      letterSpacing: -1.0))),
                          Text("6",
                              style: TextStyle(
                                  color: Colors.grey.shade500, fontSize: 24))
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 16.0, vertical: 16.0),
                      child: SizedBox(
                        height: 600,
                        width: double.infinity,
                        child: ListView.builder(
                          itemCount: 6 + 1,
                          padding: const EdgeInsets.symmetric(vertical: 0.0),
                          itemBuilder: (context, index) {
                            if (index <= 5) {
                              return ListCard().buildListCard();
                            }
                            return Container(
                              decoration: const BoxDecoration(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(10)),
                                  color: Colors.white),
                              child: Padding(
                                padding: const EdgeInsets.fromLTRB(12, 0, 0, 0),
                                child: Row(
                                  children: [
                                    Expanded(
                                      child: Row(
                                        children: [
                                          IconButton(
                                              icon: const Icon(
                                                Icons.add,
                                                color: Color(0xff6271FF),
                                                size: 24,
                                              ),
                                              onPressed: () {}),
                                          TextButton(
                                            child: const Text(
                                              "Create new list",
                                              style: TextStyle(
                                                  fontWeight: FontWeight.w600,
                                                  fontSize: 14,
                                                  fontFamily: 'SF Pro',
                                                  color: Color(0xff6271FF)),
                                            ),
                                            onPressed: () {},
                                          )
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          BottomBar()
        ],
      ),
    );
  }
}
