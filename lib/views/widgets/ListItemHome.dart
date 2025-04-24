import 'package:e_commerce/models/product.dart';
import 'package:e_commerce/utilities/routes.dart';
import 'package:flutter/material.dart';

class ListItemHome extends StatelessWidget {
  final Product product;

  const ListItemHome({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.of(
          context,
          rootNavigator: true,
        ).pushNamed(AppRoutes.ProductCard, arguments: product);
      },
      child: DecoratedBox(
        decoration: BoxDecoration(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(12),
                  child: Image.network(
                    product.imageUrl,
                    fit: BoxFit.cover,
                    width: 150,
                    height: 230,
                  ),
                ),
                (product.discountValue != null &&
                        product.isNew &&
                        product.discountValue != 0)
                    ? Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: SizedBox(
                            height: 24,
                            width: 40,
                            child: DecoratedBox(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(24),
                                color: Theme.of(context).colorScheme.primary,
                              ),
                              child: Center(
                                child: Text(
                                  " -${product.discountValue}% ",
                                  style: Theme.of(
                                    context,
                                  ).textTheme.labelMedium!.copyWith(
                                    color:
                                        Theme.of(context).colorScheme.onPrimary,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 8, right: 8),
                          child: SizedBox(
                            height: 24,
                            width: 40,
                            child: DecoratedBox(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(24),
                                color: Theme.of(context).colorScheme.onSurface,
                              ),
                              child: Center(
                                child: Text(
                                  " NEW ",
                                  style: Theme.of(
                                    context,
                                  ).textTheme.labelMedium!.copyWith(
                                    color:
                                        Theme.of(context).colorScheme.onPrimary,
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
                    ? Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: SizedBox(
                        height: 24,
                        width: 40,
                        child: DecoratedBox(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(24),
                            color: Theme.of(context).colorScheme.primary,
                          ),
                          child: Center(
                            child: Text(
                              " -${product.discountValue}% ",
                              style: Theme.of(
                                context,
                              ).textTheme.labelMedium!.copyWith(
                                color: Theme.of(context).colorScheme.onPrimary,
                              ),
                            ),
                          ),
                        ),
                      ),
                    )
                    : product.isNew
                    ? Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: SizedBox(
                        height: 24,
                        width: 40,
                        child: DecoratedBox(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(24),
                            color: Theme.of(context).colorScheme.onSurface,
                          ),
                          child: Center(
                            child: Text(
                              " NEW ",
                              style: Theme.of(
                                context,
                              ).textTheme.labelMedium!.copyWith(
                                color: Theme.of(context).colorScheme.onPrimary,
                              ),
                            ),
                          ),
                        ),
                      ),
                    )
                    : SizedBox.shrink(),
              ],
            ),
            const SizedBox(height: 4),
            Text(
              product.category,
              style: Theme.of(
                context,
              ).textTheme.labelMedium!.copyWith(color: Color(0xff9B9B9B)),
            ),
            Text(
              product.title,
              style: Theme.of(
                context,
              ).textTheme.bodyLarge!.copyWith(fontWeight: FontWeight.bold),
            ),
            product.discountValue != null && product.discountValue != 0
                ? Text.rich(
                  TextSpan(
                    children: [
                      TextSpan(
                        text: "${product.price}\$",
                        style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                          fontWeight: FontWeight.bold,
                          color: Color.fromARGB(255, 105, 105, 105),
                          decoration: TextDecoration.lineThrough,
                        ),
                      ),
                      TextSpan(
                        text:
                            "  ${product.price - (product.price * product.discountValue! / 100)}\$",
                        style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                          fontWeight: FontWeight.bold,
                          color: Theme.of(context).colorScheme.primary,
                        ),
                      ),
                    ],
                  ),
                )
                : Text(
                  "${product.price}\$",
                  style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                    fontWeight: FontWeight.bold,
                    color: Color.fromARGB(255, 105, 105, 105),
                  ),
                ),
          ],
        ),
      ),
    );
  }
}
