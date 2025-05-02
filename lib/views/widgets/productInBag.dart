import 'package:e_commerce/controllers/database_controller.dart';
import 'package:e_commerce/models/ProductInBag.dart';
import 'package:e_commerce/utilities/routes.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class productInBag extends StatelessWidget {
  const productInBag({super.key, required this.product});
  final ProductInBag product;

  @override
  Widget build(BuildContext context) {
    final database = Provider.of<Database>(context);
    final size = MediaQuery.of(context).size;
    return Stack(
      children: [
        InkWell(
          onTap: () async {
            final productData = await database.getProductById(product.id);
            if (productData != null) {
              Navigator.of(
                context,
                rootNavigator: true,
              ).pushNamed(AppRoutes.ProductCard, arguments: productData);
            }
          },
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
                    child: SizedBox(
                      width: size.width * 0.3,
                      child: Image.network(
                        product.imageUrl,
                        fit: BoxFit.cover,
                        loadingBuilder: (context, child, loadingProgress) {
                          if (loadingProgress == null) {
                            return child;
                          }
                          return const Center(
                            child: CircularProgressIndicator(),
                          );
                        },
                        errorBuilder: (context, error, stackTrace) {
                          return const Center(
                            child: Icon(
                              Icons.image_not_supported,
                              size: 40,
                              color: Colors.grey,
                            ),
                          );
                        },
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                      left: 12,
                      top: 12,
                      bottom: 12,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          product.title,
                          style: Theme.of(context).textTheme.titleLarge!
                              .copyWith(fontWeight: FontWeight.bold),
                        ),
                        Row(
                          children: [
                            Text(
                              "Color: ",
                              style: Theme.of(context).textTheme.bodyMedium!
                                  .copyWith(color: Colors.grey),
                            ),
                            Text(
                              product.color,
                              style: Theme.of(context).textTheme.bodyMedium!,
                            ),
                            const SizedBox(width: 12),
                            Text(
                              "Size: ",
                              style: Theme.of(context).textTheme.bodyMedium!
                                  .copyWith(color: Colors.grey),
                            ),
                            Text(
                              product.size,
                              style: Theme.of(context).textTheme.bodyMedium!,
                            ),
                          ],
                        ),
                        const Spacer(),
                        Row(
                          children: [
                            DecoratedBox(
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: Colors.white,
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.black12,
                                    blurRadius: 6,
                                    offset: const Offset(0, 3),
                                  ),
                                ],
                              ),
                              child: IconButton(
                                onPressed: () {
                                  if (product.quantity <= 1) {
                                    database.deleteProductInBag(product.id);
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      SnackBar(
                                        content: Text(
                                          "${product.title} removed from bag",
                                        ),
                                        backgroundColor: Colors.red,
                                        duration: const Duration(seconds: 1),
                                        behavior: SnackBarBehavior.floating,
                                      ),
                                    );
                                  } else {
                                    database.setProductInBag(
                                      ProductInBag(
                                        id: product.id,
                                        size: product.size,
                                        color: product.color,
                                        title: product.title,
                                        price: product.price,
                                        imageUrl: product.imageUrl,
                                        quantity: product.quantity - 1,
                                        discountValue: product.discountValue,
                                      ),
                                    );
                                  }
                                },
                                icon: const Icon(Icons.remove),
                              ),
                            ),
                            const SizedBox(width: 12),
                            Text(
                              product.quantity.toString(),
                              style: Theme.of(context).textTheme.bodyLarge!
                                  .copyWith(fontWeight: FontWeight.bold),
                            ),
                            const SizedBox(width: 12),
                            DecoratedBox(
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: Colors.white,
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.black12,
                                    blurRadius: 6,
                                    offset: const Offset(0, 3),
                                  ),
                                ],
                              ),
                              child: IconButton(
                                onPressed: () {
                                  database.setProductInBag(
                                    ProductInBag(
                                      id: product.id,
                                      size: product.size,
                                      color: product.color,
                                      title: product.title,
                                      price: product.price,
                                      imageUrl: product.imageUrl,
                                      quantity: product.quantity + 1,
                                      discountValue: product.discountValue,
                                    ),
                                  );
                                },
                                icon: const Icon(Icons.add),
                              ),
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
        Positioned(
          right: 16,
          bottom: 16,
          child: Text(
            "${((product.price) - (product.price * (product.discountValue ?? 0) / 100)).toInt()}\$",
            style: Theme.of(
              context,
            ).textTheme.bodyLarge!.copyWith(fontWeight: FontWeight.bold),
          ),
        ),
        Positioned(
          right: 0,
          top: 0,
          child: IconButton(
            onPressed: () {
              database.deleteProductInBag(product.id);
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text("${product.title} removed from bag"),
                  backgroundColor: Colors.red,
                  behavior: SnackBarBehavior.floating,
                  duration: Duration(seconds: 1),
                ),
              );
            },
            icon: const Icon(Icons.delete_outline, color: Colors.red),
          ),
        ),
      ],
    );
  }
}
