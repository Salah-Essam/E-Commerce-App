// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:e_commerce/views/widgets/shopCategories_widget.dart';
import 'package:flutter/material.dart';
import 'package:e_commerce/utilities/images.dart';

class ShopPage extends StatelessWidget {
  const ShopPage({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return DefaultTabController(
      length: 3,
      child: Scaffold(
        backgroundColor: Theme.of(context).colorScheme.surface,
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.white,
          title: const Text("Categories"),
          centerTitle: true,
          actions: [
            IconButton(onPressed: () {}, icon: const Icon(Icons.search)),
          ],
          bottom: const TabBar(
            labelColor: Colors.black,
            unselectedLabelColor: Colors.black54,
            tabs: [
              Tab(child: Text("Women")),
              Tab(child: Text("Men")),
              Tab(child: Text("Kids")),
            ],
            indicatorSize: TabBarIndicatorSize.tab,
          ),
        ),
        body: TabBarView(
          children: [
            shopCategories_widget(
              size: size,
              categories: AppImages.womenCategories,
            ),
            shopCategories_widget(
              size: size,
              categories: AppImages.menCategories,
            ),
            shopCategories_widget(
              size: size,
              categories: AppImages.kidsCategories,
            ),
          ],
        ),
      ),
    );
  }
}
