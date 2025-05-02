import 'package:e_commerce/views/widgets/main_Button.dart';
import 'package:flutter/material.dart';

class CheckoutPage extends StatelessWidget {
  const CheckoutPage({super.key, required this.total});
  final int total;
  final int deliveryFee = 15;
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Checkout'),
        centerTitle: true,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(Icons.arrow_back),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Shipping Address',
                style: Theme.of(
                  context,
                ).textTheme.titleLarge!.copyWith(fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 16),
              DecoratedBox(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(16),
                  boxShadow: [
                    BoxShadow(
                      color: const Color.fromARGB(17, 0, 0, 0),
                      spreadRadius: 2,
                      blurRadius: 5,
                    ),
                  ],
                ),
                child: SizedBox(
                  width: double.infinity,
                  height: size.height * 0.15,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 20,
                      vertical: 16,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Text(
                              'User Name',
                              style: Theme.of(context).textTheme.titleLarge!
                                  .copyWith(fontWeight: FontWeight.bold),
                            ),
                            const Spacer(),
                            InkWell(
                              onTap: () {},
                              child: Text(
                                "Change",
                                style: Theme.of(
                                  context,
                                ).textTheme.bodyLarge!.copyWith(
                                  color: Theme.of(context).colorScheme.primary,
                                ),
                              ),
                            ),
                          ],
                        ),
                        const Spacer(),
                        Text(
                          '3 Newbridge Court \nChino Hills, CA 91709, United States',
                          style: Theme.of(context).textTheme.bodyMedium!
                              .copyWith(fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(height: size.height * 0.07),
              Row(
                children: [
                  Text(
                    'Payment Method',
                    style: Theme.of(context).textTheme.titleLarge!.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const Spacer(),
                  InkWell(
                    onTap: () {},
                    child: Text(
                      'Change',
                      style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                        color: Theme.of(context).colorScheme.primary,
                      ),
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  Image.asset("assets/images/card.png"),
                  const SizedBox(width: 8),
                  Text('**** **** **** 3947'),
                ],
              ),
              SizedBox(height: size.height * 0.07),
              Text(
                'Delivery method',
                style: Theme.of(
                  context,
                ).textTheme.titleLarge!.copyWith(fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 16),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  deliveryMethod(
                    image: "assets/images/fedex.png",
                    time: "2-3 days",
                  ),

                  deliveryMethod(
                    image: "assets/images/usps_com.png",
                    time: "4-5 days",
                  ),

                  deliveryMethod(
                    image: "assets/images/DHL.png",
                    time: "2-3 days",
                  ),
                ],
              ),
              SizedBox(height: size.height * 0.07),
              Column(
                children: [
                  Row(
                    children: [
                      Text(
                        "Order:",
                        style: Theme.of(
                          context,
                        ).textTheme.titleMedium!.copyWith(color: Colors.grey),
                      ),
                      const Spacer(),
                      Text(
                        "$total\$",
                        style: Theme.of(context).textTheme.titleMedium!
                            .copyWith(fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),
                  Row(
                    children: [
                      Text(
                        "Delivery:",
                        style: Theme.of(
                          context,
                        ).textTheme.titleMedium!.copyWith(color: Colors.grey),
                      ),
                      const Spacer(),
                      Text(
                        "$deliveryFee\$",
                        style: Theme.of(context).textTheme.titleMedium!
                            .copyWith(fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),
                  Row(
                    children: [
                      Text(
                        "Summary:",
                        style: Theme.of(context).textTheme.titleLarge!.copyWith(
                          color: Colors.grey,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const Spacer(),
                      Text(
                        "${total + deliveryFee}\$",
                        style: Theme.of(context).textTheme.titleLarge!.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 24),
                  MainButton(text: "SUBMIT ORDER", onTap: () {}),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class deliveryMethod extends StatelessWidget {
  const deliveryMethod({super.key, required this.image, required this.time});

  final String image;
  final String time;

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: const Color.fromARGB(17, 0, 0, 0),
            spreadRadius: 2,
            blurRadius: 10,
          ),
        ],
      ),
      child: SizedBox(
        height: 72,
        width: 100,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(image),
            const SizedBox(height: 8),
            Text(
              time,
              style: Theme.of(
                context,
              ).textTheme.bodySmall!.copyWith(color: Colors.grey),
            ),
          ],
        ),
      ),
    );
  }
}
