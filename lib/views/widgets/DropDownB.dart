// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:e_commerce/controllers/ProductCard_Provider.dart';

// ignore: must_be_immutable
class DropDownb extends StatelessWidget {
  DropDownb({super.key, required this.items, required this.hint});
  final List<String> items;
  String? selectedValue;
  final String hint;

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
                          child: Text(item),
                          value: item,
                        ),
                      )
                      .toList(),
              value: selectedValue,
              onChanged: (String? value) {
                selectedValue = value;
                model.selectSize();
              },
              buttonStyleData: ButtonStyleData(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                height: 40,
                width: 140,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(color: Colors.black26),
                ),
              ),
              menuItemStyleData: const MenuItemStyleData(height: 30),
            ),
          ),
    );
  }
}
