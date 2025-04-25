import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class Rating_Bar extends StatelessWidget {
  const Rating_Bar({super.key, required this.rate});

  final double rate;

  @override
  Widget build(BuildContext context) {
    return RatingBarIndicator(
      rating: rate,
      itemBuilder: (context, index) => Icon(Icons.star, color: Colors.amber),
      itemCount: 5,
      itemSize: 17,
      direction: Axis.horizontal,
    );
  }
}
