import 'package:flutter/material.dart';

class HeaderOfList extends StatelessWidget {
  const HeaderOfList({
    super.key,
    required this.context,
    required this.titleOfHeader,
    required this.onTap,
    required this.subTitleHeader,
  });

  final BuildContext context;
  final String titleOfHeader;
  final VoidCallback? onTap;
  final String subTitleHeader;

  @override
  Widget build(BuildContext context) {
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
}
