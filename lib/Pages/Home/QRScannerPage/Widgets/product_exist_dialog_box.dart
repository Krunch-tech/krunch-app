
import 'package:flutter/material.dart';
import '../../../../Provider/api_call.dart';
import 'package:provider/provider.dart';
import '../../../../Models/products.dart';
import '../../home.dart';

class ProductExistDialog extends StatefulWidget {
  Product result;
  final scrollController = ScrollController();

  ProductExistDialog({required this.result, Key? key}) : super(key: key);

  @override
  State<ProductExistDialog> createState() => _ProductExistDialogState();
}

class _ProductExistDialogState extends State<ProductExistDialog> {
  @override
  void initState() {
    super.initState();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      showSnackBar(context, 'Product exists in product list');
    });
  }

  void showSnackBar(BuildContext context, String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        backgroundColor: Colors.red,
        content: Text(message),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<ApiCall>(context);
    return Scaffold(
      body: AlertDialog(
        titlePadding: EdgeInsets.zero,
        title: Container(
          alignment: Alignment.topLeft,
          child: TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: const Text(
              '< HOME',
              style: TextStyle(color: Colors.blue, fontSize: 16),
            ),
          ),
        ),
        insetPadding: EdgeInsets.zero,
        content: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Card(
                child: Container(
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: AspectRatio(
                    aspectRatio: 9 / 12,
                    child: Stack(children: [
                      Image.network(
                        widget.result.images.isNotEmpty
                            ? widget.result.images.first
                            : '',
                        fit: BoxFit.cover,
                      ),
                      if (provider.selectedRating == Rating.like ||
                          widget.result.rating == Rating.like)
                        const Align(
                            alignment: Alignment.bottomLeft,
                            child: Icon(
                              Icons.thumb_up,
                              color: Colors.green,
                            )),
                      if (provider.selectedRating == Rating.dislike ||
                          widget.result.rating == Rating.dislike)
                        const Align(
                            alignment: Alignment.bottomLeft,
                            child: Icon(
                              Icons.thumb_down,
                              color: Colors.red,
                            ))
                    ]),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 4),
            Flexible(
                child: Text(
              '${ordinalSuffixOf(DateTime.now().day)} ${monthNumConverter(DateTime.now().month)}, ${DateTime.now().hour % 12 <= 9 ? "0${DateTime.now().hour % 12}" : '${DateTime.now().hour % 12}'}:${DateTime.now().minute <= 9 ? "0${DateTime.now().minute}" : "${DateTime.now().minute}"} ${DateTime.now().hour < 12 ? 'AM' : 'PM'}',
              style: const TextStyle(color: Colors.black),
              textAlign: TextAlign.right,
            )),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 0),
              child: Text(
                widget.result.title,
                style: const TextStyle(
                  fontSize: 18,
                  color: Colors.black,
                ),
              ),
            ),
            Scrollbar(
              controller: widget.scrollController,
              child: SizedBox(
                height: 70,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: InteractiveViewer(
                    child: Scrollable(
                      axisDirection: AxisDirection.right,
                      viewportBuilder: (context, offset) {
                        return SingleChildScrollView(
                          controller: widget.scrollController,
                          physics: const AlwaysScrollableScrollPhysics(),
                          padding: const EdgeInsets.symmetric(vertical: 4),
                          child: Text(
                            widget.result.description,
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
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: SizedBox(
              height: 50,
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => const HomePage()),
                  );
                },
                child: const Text('Go to item page'),
              ),
            ),
          ),
        ],
      ),
    );
  }

  String monthNumConverter(int no) {
    switch (no) {
      case 1:
        return 'Jan';
      case 2:
        return 'Feb';
      case 3:
        return 'Mar';
      case 4:
        return 'Apr';
      case 5:
        return 'May';
      case 6:
        return 'Jun';
      case 7:
        return 'Jul';
      case 8:
        return 'Aug';
      case 9:
        return 'Sep';
      case 10:
        return 'Oct';
      case 11:
        return 'Nov';
      case 12:
        return 'Dec';
      default:
        return 'N/A';
    }
  }

  String ordinalSuffixOf(int i) {
    int j = i % 10;
    if (j == 1 && i != 11) {
      return '${i}st';
    }
    if (j == 2 && i != 12) {
      return '${i}nd';
    }
    if (j == 3 && i != 13) {
      return '${i}rd';
    }
    return '${i}th';
  }
}
