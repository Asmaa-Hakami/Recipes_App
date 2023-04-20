import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

Widget ratingScore(double rating) {
  return RatingBarIndicator(
    itemSize: 20,
    rating: rating,
    unratedColor: Colors.grey,
    direction: Axis.horizontal,
    itemCount: 5,
    itemPadding: const EdgeInsets.symmetric(horizontal: 1.0),
    itemBuilder: (context, _) => const Icon(
      Icons.star,
      color: Colors.amber,
    ),
  );
}
