import 'package:cached_network_image/cached_network_image.dart';
import 'package:e_commerce/models/product.dart';
import 'package:e_commerce/services/Firestor_Services.dart';
import 'package:e_commerce/views/widgets/DropDownB.dart';
import 'package:e_commerce/views/widgets/Love_Botton.dart';
import 'package:e_commerce/views/widgets/Rating_Bar.dart';
import 'package:e_commerce/views/widgets/main_Button.dart';
import 'package:flutter/material.dart';

class ProductCard extends StatelessWidget {
  final Product product;
  const ProductCard({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    final List<String> sizes = ["S", "M", "L", "XL", "XXL"];
    final List<String> colors = ["Black", "Beige", "Blue", "White", "Coral"];
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      appBar: AppBar(
        title: Text(product.title),
        centerTitle: true,
        actions: [IconButton(onPressed: () {}, icon: Icon(Icons.share))],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            StreamBuilder<List<String>>(
              stream: FirestorServices.instance.imagesStream(
                productId: product.id,
              ),
              builder: (context, snapshot) {
                final otherImages = snapshot.data ?? [];
                final allImages = [product.imageUrl, ...otherImages];

                return SizedBox(
                  height: size.height * 0.55,
                  child: ListView.separated(
                    scrollDirection: Axis.horizontal,
                    itemCount: allImages.length,
                    separatorBuilder:
                        (context, index) => const SizedBox(width: 4),
                    itemBuilder: (context, index) {
                      return CachedNetworkImage(
                        imageUrl: allImages[index],
                        fit: BoxFit.cover,
                        placeholder:
                            (context, url) =>
                                Center(child: CircularProgressIndicator()),
                        errorWidget: (context, url, error) => Icon(Icons.error),
                      );
                    },
                  ),
                );
              },
            ),
            const SizedBox(height: 8),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          DropDownb(items: sizes, hint: "Size"),
                          const SizedBox(width: 8),
                          DropDownb(items: colors, hint: "Color"),
                        ],
                      ),
                      Love_Botton(productId: product.id),
                    ],
                  ),
                  const SizedBox(height: 8),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            product.title,
                            style: Theme.of(context).textTheme.headlineSmall!
                                .copyWith(fontWeight: FontWeight.bold),
                          ),
                          Text(
                            product.category,
                            style: Theme.of(context).textTheme.bodyMedium!
                                .copyWith(color: Colors.grey),
                          ),
                          Rating_Bar(rate: product.rate!.toDouble()),
                        ],
                      ),
                      const Spacer(),
                      (product.discountValue == null ||
                              product.discountValue == 0)
                          ? Text(
                            "\$${product.price}",
                            style: Theme.of(context).textTheme.headlineSmall!
                                .copyWith(fontWeight: FontWeight.bold),
                          )
                          : Column(
                            children: [
                              Row(
                                children: [
                                  Text(
                                    "\$${product.price}",
                                    style: Theme.of(
                                      context,
                                    ).textTheme.bodyLarge!.copyWith(
                                      fontWeight: FontWeight.bold,
                                      color: Colors.grey,
                                      decoration: TextDecoration.lineThrough,
                                    ),
                                  ),
                                  SizedBox(width: 8),
                                  SizedBox(
                                    height: 24,
                                    width: 40,
                                    child: DecoratedBox(
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(24),
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
                                  ),
                                ],
                              ),
                              Text(
                                "\$${product.price - (product.price * product.discountValue! / 100)}",
                                style: Theme.of(
                                  context,
                                ).textTheme.headlineSmall!.copyWith(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.red,
                                ),
                              ),
                            ],
                          ),
                    ],
                  ),

                  const SizedBox(height: 8),
                  Text(
                    "Short dress in soft cotton jersey with decorative buttons down the front and a wide, frill-trimmed square neckline with concealed elastication. Elasticated seam under the bust and short puff sleeves with a small frill trim.",
                    style: Theme.of(context).textTheme.bodyLarge,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: DecoratedBox(
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [BoxShadow(color: Colors.black38, blurRadius: 15)],
        ),
        child: SizedBox(
          height: size.height * 0.11,
          child: SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Center(
                child: MainButton(onTap: () {}, text: "ADD TO CART"),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
