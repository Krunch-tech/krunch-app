import 'package:flutter/material.dart';
import 'package:krunch_app/Widgets/listCard.dart';

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
            color: Color(0xffF2F4F6),
          ),
          Container(
            height: double.infinity,
            width: double.infinity,
            child: Column(
              children: [
                SizedBox(height: 60),
                Column(
                  children: [
                    Row(
                      children: [
                        Expanded(
                          child: TextButton(
                            child: Row(
                              children: [
                                Icon(
                                  (Icons.keyboard_arrow_left),
                                  // onPressed: () {
                                  //   Navigator.pop(context);
                                  // }
                                ),
                                Text("Home"),
                              ],
                            ),
                            onPressed: () {
                              Navigator.pop(context);
                            },
                          ),
                        ),
                        Align(
                          alignment: Alignment.topRight,
                          child: IconButton(
                              icon: Icon(Icons.more_vert_rounded),
                              onPressed: () {}),
                        )
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(16, 0, 16, 0),
                      child: Row(
                        children: [
                          Expanded(
                              child: Text("Lists",
                                  style: TextStyle(
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
                      child: Container(
                        height: 500,
                        width: double.infinity,
                        child: ListView.builder(
                          itemCount: 6,
                          padding: EdgeInsets.symmetric(vertical: 0.0),
                          itemBuilder: (context, index) {
                            if (index <= 5) {
                              return ListCard().buildListCard();
                            }
                            return Container(
                                child: Text("FIN"),
                                height: 50,
                                width: double.infinity);
                          },
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(19, 10, 19, 38),
            child: Row(
              children: [
                Expanded(
                  child: Align(
                    alignment: Alignment.bottomLeft,
                    child: IconButton(
                        icon: Icon(
                          Icons.search_rounded,
                        ),
                        onPressed: () {}),
                  ),
                ),
                Align(
                  alignment: Alignment.bottomRight,
                  child: IconButton(
                    icon: Icon(Icons.qr_code_scanner_rounded),
                    onPressed: () {},
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
