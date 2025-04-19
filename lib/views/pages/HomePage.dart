import 'package:e_commerce/models/product.dart';
import 'package:e_commerce/utilities/images.dart';
import 'package:e_commerce/views/widgets/ListItemHome.dart';
import 'package:flutter/material.dart';

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
              height: 300,
              width: double.infinity,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children:
                    dumyProduct
                        .where((product) => product.discountValue != null)
                        .map(
                          (e) => Padding(
                            padding: const EdgeInsets.only(right: 24, top: 24),
                            child: ListItemHome(product: e),
                          ),
                        )
                        .toList(),
              ),
            ),
          ),
          const SizedBox(height: 24),
          _buildHeaderAndList(
            context,
            titleOfHeader: "New",
            onTap: () {},
            subTitleHeader: "You’ve never seen it before!",
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: SizedBox(
              height: 300,
              width: double.infinity,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children:
                    dumyProduct
                        .where((product) => product.New)
                        .map(
                          (e) => Padding(
                            padding: const EdgeInsets.only(right: 24, top: 24),
                            child: ListItemHome(product: e),
                          ),
                        )
                        .toList(),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
