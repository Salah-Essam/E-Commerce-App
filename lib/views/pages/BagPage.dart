import 'package:e_commerce/controllers/database_controller.dart';
import 'package:e_commerce/models/ProductInBag.dart';
import 'package:e_commerce/utilities/routes.dart';
import 'package:e_commerce/views/widgets/main_Button.dart';
import 'package:e_commerce/views/widgets/productInBag.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:e_commerce/models/userData.dart';

class BagPage extends StatelessWidget {
  const BagPage({super.key});

  @override
  Widget build(BuildContext context) {
    final database = Provider.of<Database>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text(
          "My Bag",
          style: Theme.of(context).textTheme.headlineLarge!.copyWith(
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: StreamBuilder<List<ProductInBag>>(
        stream: database.productInBagStream(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return const Center(child: Text("Error"));
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return const Center(child: Text("No products in bag"));
          }

          final products = snapshot.data!;
          final total =
              products
                  .map(
                    (product) =>
                        (product.price -
                            (product.price *
                                (product.discountValue ?? 0) /
                                100)) *
                        product.quantity,
                  )
                  .fold(0.0, (a, b) => a + b)
                  .toInt();

          return SingleChildScrollView(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                ...products.map(
                  (product) => Padding(
                    padding: const EdgeInsets.only(bottom: 8),
                    child: productInBag(product: product),
                  ),
                ),
                const SizedBox(height: 16),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Total amount:",
                      style: Theme.of(
                        context,
                      ).textTheme.titleLarge!.copyWith(color: Colors.grey),
                    ),
                    Text(
                      "$total\$",
                      style: Theme.of(context).textTheme.titleLarge!.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 12),
                MainButton(
                  onTap: () async {
                    final userData = await database.getUserData();
                    if (userData != null) {
                      Navigator.of(context, rootNavigator: true).pushNamed(
                        AppRoutes.CheckoutPage,
                        arguments: {'total': total, 'userData': userData},
                      );
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text('User data not found')),
                      );
                    }
                  },
                  text: "Checkout",
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
