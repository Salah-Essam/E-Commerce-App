import 'package:e_commerce/controllers/ProductCard_Provider.dart';
import 'package:e_commerce/controllers/database_controller.dart';
import 'package:e_commerce/models/ProductInBag.dart';
import 'package:e_commerce/models/product.dart';
import 'package:e_commerce/utilities/routes.dart';
import 'package:e_commerce/views/widgets/DropDownB.dart';
import 'package:e_commerce/views/widgets/Rating_Bar.dart';
import 'package:e_commerce/views/widgets/addToBagCircle.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class productInFavorites extends StatelessWidget {
  const productInFavorites({
    super.key,
    required this.size,
    required this.product,
  });

  final Size size;
  final Product product;

  @override
  Widget build(BuildContext context) {
    return Consumer<ProductCard_Provider>(
      builder:
          (_, model, __) => Stack(
            children: [
              InkWell(
                onTap: () {
                  Navigator.of(
                    context,
                    rootNavigator: true,
                  ).pushNamed(AppRoutes.ProductCard, arguments: product);
                },
                child: SizedBox(
                  height: size.height * 0.22,
                  child: Align(
                    alignment: Alignment.topCenter,
                    child: DecoratedBox(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(16),
                      ),
                      child: SizedBox(
                        height: size.height * 0.2,
                        child: Row(
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(16),
                              child: Image.network(
                                product.imageUrl,
                                width: size.width * 0.25,
                                fit: BoxFit.cover,
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(12),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    product.category,
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodyLarge!
                                        .copyWith(color: Colors.grey),
                                  ),
                                  Text(
                                    product.title,
                                    style: Theme.of(
                                      context,
                                    ).textTheme.headlineSmall!.copyWith(
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  (product.discountValue != null &&
                                          product.isNew &&
                                          product.discountValue != 0)
                                      ? Row(
                                        children: [
                                          SizedBox(
                                            height: 24,
                                            width: 40,
                                            child: DecoratedBox(
                                              decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(24),
                                                color:
                                                    Theme.of(
                                                      context,
                                                    ).colorScheme.primary,
                                              ),
                                              child: Center(
                                                child: Text(
                                                  " -${product.discountValue}% ",
                                                  style: Theme.of(context)
                                                      .textTheme
                                                      .labelMedium!
                                                      .copyWith(
                                                        color:
                                                            Theme.of(context)
                                                                .colorScheme
                                                                .onPrimary,
                                                      ),
                                                ),
                                              ),
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.only(
                                              left: 8,
                                              right: 8,
                                            ),
                                            child: SizedBox(
                                              height: 24,
                                              width: 40,
                                              child: DecoratedBox(
                                                decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(24),
                                                  color:
                                                      Theme.of(
                                                        context,
                                                      ).colorScheme.onSurface,
                                                ),
                                                child: Center(
                                                  child: Text(
                                                    " NEW ",
                                                    style: Theme.of(context)
                                                        .textTheme
                                                        .labelMedium!
                                                        .copyWith(
                                                          color:
                                                              Theme.of(context)
                                                                  .colorScheme
                                                                  .onPrimary,
                                                        ),
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      )
                                      : product.discountValue != null &&
                                          product.discountValue != 0
                                      ? SizedBox(
                                        height: 24,
                                        width: 40,
                                        child: DecoratedBox(
                                          decoration: BoxDecoration(
                                            borderRadius: BorderRadius.circular(
                                              24,
                                            ),
                                            color:
                                                Theme.of(
                                                  context,
                                                ).colorScheme.primary,
                                          ),
                                          child: Center(
                                            child: Text(
                                              " -${product.discountValue}% ",
                                              style: Theme.of(
                                                context,
                                              ).textTheme.labelMedium!.copyWith(
                                                color:
                                                    Theme.of(
                                                      context,
                                                    ).colorScheme.onPrimary,
                                              ),
                                            ),
                                          ),
                                        ),
                                      )
                                      : product.isNew
                                      ? SizedBox(
                                        height: 24,
                                        width: 40,
                                        child: DecoratedBox(
                                          decoration: BoxDecoration(
                                            borderRadius: BorderRadius.circular(
                                              24,
                                            ),
                                            color:
                                                Theme.of(
                                                  context,
                                                ).colorScheme.onSurface,
                                          ),
                                          child: Center(
                                            child: Text(
                                              " NEW ",
                                              style: Theme.of(
                                                context,
                                              ).textTheme.labelMedium!.copyWith(
                                                color:
                                                    Theme.of(
                                                      context,
                                                    ).colorScheme.onPrimary,
                                              ),
                                            ),
                                          ),
                                        ),
                                      )
                                      : SizedBox.shrink(),
                                  const Spacer(),
                                  Row(
                                    children: [
                                      Text(
                                        "\$${product.price - (product.price * (product.discountValue! / 100))}",
                                        style:
                                            Theme.of(
                                              context,
                                            ).textTheme.headlineSmall,
                                      ),
                                      const SizedBox(width: 24),
                                      Rating_Bar(
                                        rate: product.rate!.toDouble(),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              Positioned(
                right: 8,
                bottom: 0,
                child: addToBagCircle(
                  product: product,
                  onPressed: () {
                    final List<String> sizes = ["S", "M", "L", "XL", "XXL"];
                    final List<String> colors = [
                      "Black",
                      "Beige",
                      "Blue",
                      "White",
                      "Coral",
                    ];
                    showDialog(
                      context: context,
                      builder:
                          (context) => AlertDialog(
                            title: Text("Please select size and color"),
                            content: Row(
                              children: [
                                DropDownb(items: sizes, hint: "Size"),
                                DropDownb(items: colors, hint: "Color"),
                              ],
                            ),
                            actions: [
                              TextButton(
                                onPressed: () {
                                  Navigator.pop(context);
                                },
                                child: Text("Cancel"),
                              ),
                              TextButton(
                                onPressed: () {
                                  if (model.size.isNotEmpty &&
                                      model.color.isNotEmpty) {
                                    try {
                                      final Database database =
                                          FirestoreDatabase(
                                            uid:
                                                FirebaseAuth
                                                    .instance
                                                    .currentUser!
                                                    .uid,
                                          );
                                      final productInBag = ProductInBag(
                                        id: product.id,
                                        title: product.title,
                                        price: product.price,
                                        imageUrl: product.imageUrl,
                                        quantity: 1,
                                        size: model.size,
                                        color: model.color,
                                        discountValue: product.discountValue,
                                      );
                                      database.setProductInBag(productInBag);
                                      model.updateSize("");
                                      model.updateColor("");

                                      ScaffoldMessenger.of(
                                        context,
                                      ).showSnackBar(
                                        SnackBar(
                                          content: Text("Product added to bag"),
                                          backgroundColor: Colors.green,
                                          duration: Duration(seconds: 2),
                                          behavior: SnackBarBehavior.floating,
                                        ),
                                      );
                                      Navigator.pop(context);
                                    } catch (e) {
                                      debugPrint(e.toString());
                                    }
                                  } else {
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      SnackBar(
                                        content: Text(
                                          "Select size and color Please !!",
                                        ),
                                        backgroundColor: Colors.red,
                                        duration: Duration(seconds: 3),
                                        behavior: SnackBarBehavior.floating,
                                      ),
                                    );
                                  }
                                },
                                child: Text("Add to Bag"),
                              ),
                            ],
                          ),
                    );
                  },
                ),
              ),
              Positioned(
                right: 0,
                top: 0,
                child: IconButton(
                  onPressed: () {
                    model.toggleFavorite(product.id);
                  },
                  icon: Icon(Icons.close, color: Colors.grey),
                ),
              ),
            ],
          ),
    );
  }
}
