import 'package:e_commerce/models/product.dart';
import 'package:e_commerce/services/Firestor_Services.dart';
import 'package:e_commerce/views/widgets/main_Button.dart';
import 'package:flutter/material.dart';

class ProductCard extends StatelessWidget {
  final Product product;
  const ProductCard({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    // final product = ModalRoute.of(context)!.settings.arguments;
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
                  child: Scrollbar(
                    child: ListView.separated(
                      scrollDirection: Axis.horizontal,
                      itemCount: allImages.length,
                      separatorBuilder:
                          (context, index) => const SizedBox(width: 4),
                      itemBuilder: (context, index) {
                        return Image.network(
                          allImages[index],
                          fit: BoxFit.cover,
                        );
                      },
                    ),
                  ),
                );
              },
            ),
            const SizedBox(height: 16),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Column(
                        children: [
                          Text(
                            product.title,
                            style: Theme.of(context).textTheme.headlineSmall!
                                .copyWith(fontWeight: FontWeight.bold),
                          ),
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
                  Text(
                    product.category,
                    style: Theme.of(
                      context,
                    ).textTheme.bodyMedium!.copyWith(color: Colors.grey),
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
          height: size.height * 0.13,
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
