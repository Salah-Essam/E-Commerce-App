// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:e_commerce/controllers/ProductCard_Provider.dart';

class DropDownb extends StatelessWidget {
  DropDownb({super.key, required this.items, required this.hint, this.color});
  final List<String> items;
  String? selectedValue;
  final String hint;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return Consumer<ProductCard_Provider>(
      builder:
          (_, model, __) => DropdownButtonHideUnderline(
            child: DropdownButton2<String>(
              hint: Text(hint),
              items:
                  items
                      .map(
                        (String item) => DropdownMenuItem<String>(
                          value: item,
                          child: Text(item),
                        ),
                      )
                      .toList(),
              value: selectedValue,
              onChanged: (String? value) {
                selectedValue = value;
                if (hint == "Size") {
                  model.updateSize(value!);
                } else if (hint == "Color") {
                  model.updateColor(value!);
                }
              },
              buttonStyleData: ButtonStyleData(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                height: 40,
                width: 140,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(color: color ?? Colors.black26),
                ),
              ),
              menuItemStyleData: const MenuItemStyleData(height: 30),
            ),
          ),
    );
  }
}
