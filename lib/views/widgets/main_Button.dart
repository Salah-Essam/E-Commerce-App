import 'package:flutter/material.dart';

class MainButton extends StatelessWidget {
  final String text;
  final VoidCallback onTap;
  const MainButton({super.key, required this.onTap, required this.text});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: Theme.of(context).colorScheme.primary,
        ),
        onPressed: onTap,
        child: Text(
          text,
          style: Theme.of(context).textTheme.labelMedium?.copyWith(
            color: Theme.of(context).colorScheme.onPrimary,
          ),
        ),
      ),
    );
  }
}
