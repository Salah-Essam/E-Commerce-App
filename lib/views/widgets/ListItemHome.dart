import 'package:e_commerce/models/product.dart';
import 'package:flutter/material.dart';

class ListItemHome extends StatelessWidget {
  final Product product;

  const ListItemHome({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: Image.network(
                  product.ImageUrl,
                  fit: BoxFit.cover,
                  width: 150,
                  height: 180,
                ),
              ),
              (product.discountValue != null && product.New)
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
                  : product.discountValue != null
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
                  : product.New
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
          Text(
            "${product.price}\$",
            style: Theme.of(context).textTheme.bodyMedium!.copyWith(
              fontWeight: FontWeight.bold,
              color: Color.fromARGB(255, 105, 105, 105),
            ),
          ),
        ],
      ),
    );
  }
}
