import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:krunch_app/Pages/items.dart';
import 'package:krunch_app/Pages/lists.dart';
import 'package:krunch_app/Widgets/BottomBar.dart';
import 'package:krunch_app/Widgets/addItemButton.dart';
import 'package:krunch_app/Widgets/itemCard.dart';
import 'package:krunch_app/Widgets/listCard.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        alignment: Alignment.centerLeft,
        children: [
          Container(
            color: Color(0xffF2F4F6),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Column(
              children: [
                SizedBox(height: 59),
                Align(
                  alignment: Alignment.topRight,
                  child: IconButton(
                      icon: Icon(Icons.settings_outlined,
                          color: Color(0xff6271FF), size: 24),
                      onPressed: () {}),
                ),
                //TODO: fix font here
                Row(
                  children: const [
                    SizedBox(width: 5),
                    Align(
                      alignment: Alignment.topLeft,
                      child: Text("Krunch",
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 34,
                              fontWeight: FontWeight.bold,
                              letterSpacing: -1.5)),
                    ),
                  ],
                ),
                SizedBox(height: 27),
                Row(
                  children: [
                    Expanded(
                      child: Align(
                        alignment: Alignment.topLeft,
                        child: TextButton(
                            child: Text("Items",
                                style: Theme.of(context).textTheme.bodyText1),
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => Items()),
                              );
                            }),
                      ),
                    ),
                    Row(
                      children: [
                        Text("12", style: TextStyle(color: Colors.black)),
                        IconButton(
                            icon: Icon(Icons.keyboard_arrow_right, size: 24),
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => Items()),
                              );
                            })
                      ],
                    )
                  ],
                ),
                Container(
                    height: 300,
                    width: double.infinity,
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
                    )),
                SizedBox(height: 42),
                Row(
                  children: [
                    Expanded(
                      child: Align(
                        alignment: Alignment.topLeft,
                        child: TextButton(
                            child: Text("Lists",
                                style: Theme.of(context).textTheme.bodyText1),
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => Lists()),
                              );
                            }),
                      ),
                    ),
                    Row(
                      children: [
                        Text("6", style: TextStyle(color: Colors.black)),
                        IconButton(
                            icon: Icon(Icons.keyboard_arrow_right, size: 24),
                            onPressed: () {})
                      ],
                    )
                  ],
                ),
                SizedBox(height: 16),
                Container(
                  height: 100,
                  width: double.infinity,
                  child: ListView.builder(
                    padding: EdgeInsets.symmetric(vertical: 0.0),
                    itemBuilder: (context, index) {
                      return ListCard().buildListCard();
                    },
                    itemCount: 6,
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
