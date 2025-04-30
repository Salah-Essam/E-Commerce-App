import 'package:e_commerce/controllers/ProductCard_Provider.dart';
import 'package:e_commerce/models/product.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class addToBagCircle extends StatelessWidget {
  final Product product;
  final VoidCallback onPressed;
  const addToBagCircle({
    super.key,
    required this.product,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Consumer<ProductCard_Provider>(
      builder:
          (_, value, __) => DecoratedBox(
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.primary,
              shape: BoxShape.circle,
              boxShadow: [
                BoxShadow(
                  color: Theme.of(context).colorScheme.primary,
                  blurRadius: 3,
                  offset: Offset(0.5, 3),
                ),
              ],
            ),
            child: SizedBox(
              height: 36,
              width: 36,
              child: IconButton(
                onPressed: onPressed,

                icon: Icon(Icons.shopping_bag, color: Colors.white, size: 18),
              ),
            ),
          ),
    );
  }
}
