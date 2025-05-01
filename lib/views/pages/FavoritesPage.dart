import 'package:e_commerce/controllers/database_controller.dart';
import 'package:e_commerce/models/product.dart';
import 'package:e_commerce/views/widgets/productInFavorites.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class FavoritesPage extends StatelessWidget {
  const FavoritesPage({super.key});

  @override
  Widget build(BuildContext context) {
    final database = Provider.of<Database>(context);
    final size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Favorites",
          style: Theme.of(
            context,
          ).textTheme.headlineSmall!.copyWith(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        actions: [IconButton(onPressed: () {}, icon: const Icon(Icons.search))],
      ),
      body: StreamBuilder<Set<String>>(
        stream: database.favoriteProductsStream(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }

          if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return const Center(
              child: Text("No favorites yet", style: TextStyle(fontSize: 18)),
            );
          }

          return StreamBuilder<List<Product>>(
            stream: database.productsStream(),
            builder: (context, productsSnapshot) {
              if (productsSnapshot.connectionState == ConnectionState.waiting) {
                return const Center(child: CircularProgressIndicator());
              }

              if (!productsSnapshot.hasData) {
                return const Center(
                  child: Text(
                    "No products found",
                    style: TextStyle(fontSize: 18),
                  ),
                );
              }

              final favoriteProductIds = snapshot.data!;
              final allProducts = productsSnapshot.data!;

              final favoriteProducts =
                  allProducts
                      .where(
                        (product) => favoriteProductIds.contains(product.id),
                      )
                      .toList();

              return ListView.builder(
                padding: const EdgeInsets.all(16),
                itemCount: favoriteProducts.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.only(bottom: 8),
                    child: productInFavorites(
                      size: size,
                      product: favoriteProducts[index],
                    ),
                  );
                },
              );
            },
          );
        },
      ),
    );
  }
}
