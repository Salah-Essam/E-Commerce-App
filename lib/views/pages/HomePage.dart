import 'package:e_commerce/controllers/database_controller.dart';
import 'package:e_commerce/models/product.dart';
import 'package:e_commerce/utilities/images.dart';
import 'package:e_commerce/views/widgets/ListItemHome.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  Widget _buildHeaderAndList(
    BuildContext context, {
    required String titleOfHeader,
    VoidCallback? onTap,
    required String subTitleHeader,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Text(
                titleOfHeader,
                style: Theme.of(context).textTheme.displaySmall!.copyWith(
                  fontWeight: FontWeight.bold,
                  color: Color(0xff222222),
                ),
              ),
              const Spacer(),
              InkWell(
                onTap: onTap,
                child: Text(
                  "View all",
                  style: Theme.of(
                    context,
                  ).textTheme.bodyMedium!.copyWith(color: Color(0xff222222)),
                ),
              ),
            ],
          ),
          Text(
            subTitleHeader,
            style: Theme.of(
              context,
            ).textTheme.bodyLarge!.copyWith(color: Color(0xff9B9B9B)),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final database = Provider.of<Database>(context);
    final size = MediaQuery.of(context).size;
    return SingleChildScrollView(
      child: Column(
        children: [
          Stack(
            alignment: Alignment.bottomLeft,
            children: [
              Image.network(
                AppImages.TopBannerHomePage,
                width: double.infinity,
                height: size.height * 0.3,
                fit: BoxFit.cover,
              ),
              Opacity(
                opacity: 0.15,
                child: Container(
                  color: Colors.black,
                  width: double.infinity,
                  height: size.height * 0.3,
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 24,
                  vertical: 24,
                ),
                child: Text(
                  "Street Clothes",
                  style: Theme.of(context).textTheme.displaySmall!.copyWith(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 24),
          _buildHeaderAndList(
            context,
            titleOfHeader: "Sale",
            onTap: () {},
            subTitleHeader: "Super summer sale",
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: SizedBox(
              height: 350,
              width: double.infinity,
              child: StreamBuilder<List<Product>>(
                stream: database.productsStream(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.active) {
                    final products = snapshot.data;
                    if (products == null || products.isEmpty) {
                      return Center(child: Text("No Data Available..."));
                    }
                    return ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount:
                          products
                              .where(
                                (product) =>
                                    product.discountValue != null &&
                                    product.discountValue != 0,
                              )
                              .length,
                      itemBuilder: (context, index) {
                        final saleProducts =
                            products
                                .where(
                                  (product) =>
                                      product.discountValue != null &&
                                      product.discountValue != 0,
                                )
                                .toList();
                        return Padding(
                          padding: const EdgeInsets.only(right: 24, top: 24),
                          child: ListItemHome(product: saleProducts[index]),
                        );
                      },
                    );
                  }
                  return Center(child: CircularProgressIndicator());
                },
              ),
            ),
          ),
          const SizedBox(height: 24),
          _buildHeaderAndList(
            context,
            titleOfHeader: "New",
            onTap: () {},
            subTitleHeader: "You've never seen it before!",
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: SizedBox(
              height: 350,
              width: double.infinity,
              child: StreamBuilder<List<Product>>(
                stream: database.productsStream(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.active) {
                    final products = snapshot.data;
                    if (products == null || products.isEmpty) {
                      return Center(child: Text("No Datat Available ."));
                    }
                    return ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount:
                          products.where((product) => product.New).length,
                      itemBuilder: (context, index) {
                        final newProducts =
                            products.where((product) => product.New).toList();
                        return Padding(
                          padding: const EdgeInsets.only(right: 24, top: 24),
                          child: ListItemHome(product: newProducts[index]),
                        );
                      },
                    );
                  }
                  return Center(child: CircularProgressIndicator());
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
