import 'package:flutter/material.dart';
import '../Models/products.dart';

class ItemCard extends StatefulWidget {
  final String itemName;
  final String imgUrl;
  final Rating rating;
  const ItemCard(
      {Key? key,
      required this.imgUrl,
      required this.itemName,
      required this.rating})
      : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _ItemCardState createState() => _ItemCardState();
}

class _ItemCardState extends State<ItemCard> {
  bool isfavorite = false;

  @override
  @override
  Widget build(BuildContext context) {
    return Container(
      // height: 20,
      // width: 20,
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: const BorderRadius.all(Radius.circular(10)),
          border: isfavorite
              ? Border.all(color: const Color(0xffFFCE4F), width: 2.0)
              : null),
      child: Stack(
        children: [
          Align(
            alignment: Alignment.topRight,
            child: IconButton(
                icon: Icon(
                  Icons.star_rounded,
                  color: isfavorite
                      ? const Color(0xffFFCE4F)
                      : Colors.grey.shade300,
                  size: 20,
                ),
                onPressed: () {
                  setState(() {
                    isfavorite = !isfavorite;
                  });
                }),
          ),
          Align(
            alignment: Alignment.center,
            child: Image.network(widget.imgUrl),
          ),
          Align(
            alignment: Alignment.bottomLeft,
            child: RatingIcon(rating: widget.rating),
          )
        ],
      ),
    );
  }
}

class RatingIcon extends StatefulWidget {
  final Rating rating;

  const RatingIcon({Key? key, required this.rating}) : super(key: key);

  @override
  _RatingIconState createState() => _RatingIconState();
}

class _RatingIconState extends State<RatingIcon> {
  @override
  Widget build(BuildContext context) {
    return _buildRatingIcon();
  }

  Widget _buildRatingIcon() {
    switch (widget.rating) {
      case Rating.like:
        setState(() {});
        return const Icon(
          Icons.thumb_up,
          color: Colors.green,
        );
      case Rating.dislike:
        setState(() {});
        return const Icon(
          Icons.thumb_down,
          color: Colors.red,
        );
      default:
        setState(() {});
        return Container();
    }
  }
}

              // Align(
              //   alignment: Alignment.bottomLeft,
              //   child: Padding(
              //     padding: const EdgeInsets.symmetric(
              //         horizontal: 14.0, vertical: 14.0),
              //     child: Text(widget.itemName,
              //         style: const TextStyle(
              //             color: Colors.black, fontWeight: FontWeight.bold)),
              //   ),
              // ),
              