import 'package:flutter/material.dart';
import '/Models/products.dart';
import '../../Provider/api_call.dart';
import 'package:provider/provider.dart';

// ignore: must_be_immutable
class ItemInfoPage extends StatelessWidget {
  int itemIndex;
  ItemInfoPage({required this.itemIndex, super.key});

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<ApiCall>(context);
    final scrollController = ScrollController();
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Product Information',
          style: TextStyle(color: Colors.black),
        ),
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Card(
              child: Stack(
                children: [
                  Container(
                    padding: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: AspectRatio(
                      aspectRatio: 9 / 12,
                      child: Image.network(
                        provider.products[itemIndex].images.first,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  if (provider.products[itemIndex].rating == Rating.like)
                    const Positioned(
                      bottom: 8,
                      left: 8,
                      child: Icon(
                        Icons.thumb_up,
                        color: Colors.green,
                      ),
                    ),
                  if (provider.products[itemIndex].rating == Rating.dislike)
                    const Positioned(
                      bottom: 8,
                      left: 8,
                      child: Icon(
                        Icons.thumb_down,
                        color: Colors.red,
                      ),
                    ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 4),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              provider.products[itemIndex].title,
              style: const TextStyle(
                fontSize: 18,
                color: Colors.black,
              ),
            ),
          ),
          const SizedBox(height: 10),
          Scrollbar(
            controller: scrollController,
            child: SizedBox(
              height: 70,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: InteractiveViewer(
                  child: Scrollable(
                    axisDirection: AxisDirection.right,
                    viewportBuilder: (context, offset) {
                      return SingleChildScrollView(
                        controller: scrollController,
                        physics: const AlwaysScrollableScrollPhysics(),
                        padding: const EdgeInsets.symmetric(vertical: 4),
                        child: Text(
                          provider.products[itemIndex].description,
                          style: const TextStyle(
                            fontSize: 14,
                            color: Colors.grey,
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SizedBox(
          height: 50,
          width: double.infinity,
          child: ElevatedButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: const Text('Go to item page'),
          ),
        ),
      ),
    );
  }
}
