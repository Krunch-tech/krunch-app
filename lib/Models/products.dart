enum Rating { like, dislike, none }

String ratingToString(Rating rating) {
  switch (rating) {
    case Rating.like:
      return 'like';
    case Rating.dislike:
      return 'dislike';
    default:
      return 'none';
  }
}

Rating stringToRating(String rating) {
  switch (rating) {
    case 'like':
      return Rating.like;
    case 'dislike':
      return Rating.dislike;
    default:
      return Rating.none;
  }
}

class Product {
  Rating rating;

  final String barcodeNumber;
  final String title;
  final String description;
  final List<String> images;

  Product(
      {required this.barcodeNumber,
      required this.title,
      required this.description,
      required this.images,
      this.rating = Rating.none});

  void updateRating(Rating newRating) {
    rating = newRating;
  }

  Map<String, dynamic> toJson() {
    return {
      'rating': rating.toString().split('.').last,
      'barcodeNumber': barcodeNumber,
      'title': title,
      'description': description,
      'images': images,
    };
  }

  factory Product.fromJson(Map<dynamic, dynamic> json, Rating rating) {
    return Product(
        barcodeNumber: json['barcode_number'] ?? '',
        title: json['title'],
        description: json['description'] ?? '',
        images: List<String>.from(json['images']),
        rating: rating);
  }

  Map<String, Object> toDatabaseMap() {
    return {
      'rating': ratingToString(rating),
      'barcodeNumber': barcodeNumber,
      'title': title,
      'description': description,
      'images': images.join(','),
    };
  }

  static Product fromDatabaseMap(Map<String, dynamic> map) {
    final List<String> images = (map['images'] as String).split(',');

    return Product(
      barcodeNumber: map['barcodeNumber'] as String,
      title: map['title'] as String,
      description: map['description'] as String,
      images: images,
      rating: stringToRating(map['rating'] as String),
    );
  }
}
