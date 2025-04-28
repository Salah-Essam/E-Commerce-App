import 'package:e_commerce/controllers/ProductCard_Provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class favoriteBotton extends StatelessWidget {
  final String productId;
  const favoriteBotton({super.key, required this.productId});

  @override
  Widget build(BuildContext context) {
    return Consumer<ProductCard_Provider>(
      builder:
          (_, value, __) => DecoratedBox(
            decoration: BoxDecoration(
              color: Colors.white,
              shape: BoxShape.circle,
              boxShadow: [
                BoxShadow(
                  color: Colors.black26,
                  blurRadius: 3,
                  offset: Offset(0.5, 3),
                ),
              ],
            ),
            child: SizedBox(
              height: 36,
              width: 36,
              child: IconButton(
                onPressed: () {
                  value.toggleFavorite(productId);
                },

                icon:
                    value.isFavorite(productId)
                        ? Icon(Icons.favorite, color: Colors.red, size: 18)
                        : Icon(
                          Icons.favorite_border,
                          color: Colors.grey,
                          size: 18,
                        ),
              ),
            ),
          ),
    );
  }
}
