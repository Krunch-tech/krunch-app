// ignore_for_file: depend_on_referenced_packages

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import '../../Models/database.dart';
import '../../Models/products.dart';
import '/Pages/Auth/LoginHome.dart';
import '/Pages/Home/itemInfoPage.dart';
import '../../Provider/api_call.dart';
import 'package:provider/provider.dart';
// import ' /Pages/lists.dart';
import '../../Services/authentication.dart';
import '/Widgets/BottomBar.dart';
import '/Widgets/addItemButton.dart';
import '/Widgets/itemCard.dart';
// import ' /Widgets/listCard.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  getItemsFromDatabase() async {
    Provider.of<ApiCall>(context, listen: false).getProductsFromDatabase();
  }

  @override
  void initState() {
    getItemsFromDatabase();
    super.initState();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            // const SizedBox(height: 59),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Align(
                  alignment: Alignment.topRight,
                  child: TextButton(
                      onPressed: () {
                        GoogleSignInApi.logout()
                            .then((value) => ScaffoldMessenger.of(context)
                                .showSnackBar(const SnackBar(
                                    content: Text('Logged out'))))
                            .then((value) =>
                                Timer(const Duration(seconds: 2), () {
                                  Navigator.of(context).pushReplacement(
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              const LoginHome()));
                                }));
                      },
                      child: const Text(
                        'Logout',
                        style: TextStyle(color: Color(0xff6271FF)),
                      ))),
            ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.0),
              child: Row(
                children: [
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
            ),
            const SizedBox(height: 27),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Row(
                children: [
                  Expanded(
                    child: Align(
                      alignment: Alignment.topLeft,
                      child: TextButton(
                          child: Text("Items",
                              style: Theme.of(context).textTheme.bodyLarge),
                          onPressed: () {}),
                    ),
                  ),
                  Row(
                    children: [
                      const Text("12", style: TextStyle(color: Colors.black)),
                      IconButton(
                          icon:
                              const Icon(Icons.keyboard_arrow_right, size: 24),
                          onPressed: () {})
                    ],
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: SizedBox(
                  height: 500,
                  width: double.infinity,
                  child: Consumer<ApiCall>(
                    builder: (context, apiCall, child) => GridView.custom(
                      gridDelegate: SliverQuiltedGridDelegate(
                        crossAxisCount: 4,
                        mainAxisSpacing: 16,
                        crossAxisSpacing: 16,
                        repeatPattern: QuiltedGridRepeatPattern.inverted,
                        pattern: [
                          const QuiltedGridTile(2, 2),
                          const QuiltedGridTile(1, 2),
                          const QuiltedGridTile(1, 2),
                          // const QuiltedGridTile(2, 2),
                        ],
                      ),
                      childrenDelegate:
                          SliverChildBuilderDelegate((context, index) {
                        if (index == 0) {
                          return const AddItem();
                        } else {
                          if (apiCall.products.isEmpty) {
                            return Container();
                          } else {
                            // Display the saved products in the grid
                            return GestureDetector(
                              onTap: () => Navigator.of(context).push(
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          ItemInfoPage(itemIndex: index - 1))),
                              child: ItemCard(
                                imgUrl: apiCall.products[index - 1].images[0],
                                itemName: apiCall.products[index - 1].title,
                                rating: apiCall.products[index - 1].rating,
                              ),
                            );
                          }
                          // else {
                          //   return apiCall.products
                          //       .map(
                          //         (e) => GestureDetector(
                          //           onTap: () => Navigator.of(context).push(
                          //               MaterialPageRoute(
                          //                   builder: (context) => ItemInfoPage(
                          //                       itemIndex: index - 1))),
                          //           child: ItemCard(
                          //             imgUrl: e.images[0],
                          //             itemName: e.title,
                          //             rating: e.rating!,
                          //           ),
                          //         ),
                          //       )
                          //       .toList()[index - 1];
                          // }
                        }
                      }, childCount: apiCall.products.length + 1),
                    ),
                  )),
            ),
            const Expanded(child: SizedBox(height: 1)),
            BottomBar(),
          ],
        ),
      ),
    );
  }
}
