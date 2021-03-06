import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:krunch_app/Widgets/BottomBar.dart';
import 'package:krunch_app/Widgets/addItemButton.dart';
import 'package:krunch_app/Widgets/itemCard.dart';

class Items extends StatefulWidget {
  const Items({Key? key}) : super(key: key);

  @override
  _ItemsState createState() => _ItemsState();
}

class _ItemsState extends State<Items> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
              height: double.infinity,
              width: double.infinity,
              color: Color(0xffF2F4F6)),
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
                              children: const [
                                Icon(
                                  (Icons.keyboard_arrow_left),
                                  color: Color(0xff6271FF),
                                ),
                                Text("Home",
                                    style: TextStyle(
                                      color: Color(0xff6271FF),
                                    )),
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
                              icon: const Icon(
                                Icons.more_vert_rounded,
                                color: Color(0xff6271FF),
                              ),
                              onPressed: () {}),
                        )
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(16, 0, 16, 0),
                      child: Row(
                        children: [
                          Expanded(
                              child: Text("Items",
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.w700,
                                      fontSize: 34,
                                      letterSpacing: -1.0))),
                          Text("12",
                              style: TextStyle(
                                  color: Colors.grey.shade500, fontSize: 24))
                        ],
                      ),
                    )
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: Container(
                    height: 600,
                    child: GridView.custom(
                      gridDelegate: SliverQuiltedGridDelegate(
                        crossAxisCount: 4,
                        mainAxisSpacing: 16,
                        crossAxisSpacing: 16,
                        repeatPattern: QuiltedGridRepeatPattern.inverted,
                        pattern: [
                          QuiltedGridTile(2, 2),
                          QuiltedGridTile(1, 2),
                          QuiltedGridTile(1, 2),
                        ],
                      ),
                      childrenDelegate:
                          SliverChildBuilderDelegate((context, index) {
                        if (index == 0) {
                          return AddItem();
                        } else {
                          return ItemCard();
                        }
                      }, childCount: 12),
                    ),
                  ),
                )
              ],
            ),
          ),
          BottomBar()
        ],
      ),
    );
  }
}
