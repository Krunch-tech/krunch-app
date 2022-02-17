import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
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
            color: Color(0xffE5E5E5),
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
                          color: Color(0xff6271FF), size: 22),
                      onPressed: () {}),
                ),
                //TODO: fix font here
                Row(
                  children: [
                    SizedBox(width: 5),
                    Align(
                      alignment: Alignment.topLeft,
                      child: Text("Krunch",
                          style: TextStyle(
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
                            onPressed: () {}),
                      ),
                    ),
                    Row(
                      children: [
                        Text("12"),
                        IconButton(
                            icon: Icon(Icons.keyboard_arrow_right, size: 24),
                            onPressed: () {})
                      ],
                    )
                  ],
                ),
                Container(
                  height: 310,
                  width: double.infinity,
                  child: GridView.builder(
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisSpacing: 16,
                          mainAxisSpacing: 16,
                          crossAxisCount: 2),
                      itemCount: 12,
                      itemBuilder: (context, index) {
                        return ItemCard();
                      }),
                ),
                SizedBox(height: 42),
                Row(
                  children: [
                    Expanded(
                      child: Align(
                        alignment: Alignment.topLeft,
                        child: TextButton(
                            child: Text("Lists",
                                style: Theme.of(context).textTheme.bodyText1),
                            onPressed: () {}),
                      ),
                    ),
                    Row(
                      children: [
                        Text("6"),
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