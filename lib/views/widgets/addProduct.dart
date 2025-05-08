import 'package:e_commerce/controllers/ProductProvider.dart';
import 'package:e_commerce/controllers/database_controller.dart';
import 'package:e_commerce/models/product.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

void _showAddProductDialog(BuildContext context, Database database) {
  final formKey = GlobalKey<FormState>();
  showDialog(
    context: context,
    builder:
        (context) => ChangeNotifierProvider<ProductProvider>(
          create: (context) => ProductProvider(),
          child: Consumer<ProductProvider>(
            builder:
                (context, productProvider, _) => AlertDialog(
                  title: Text('Add New Product'),
                  content: ConstrainedBox(
                    constraints: BoxConstraints(maxWidth: 400),
                    child: Form(
                      key: formKey,
                      child: SingleChildScrollView(
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            TextField_addProduct<String>(
                              label: "title",
                              update: productProvider.updateTitle,
                            ),
                            const SizedBox(height: 8),
                            TextField_addProduct<int>(
                              label: "price",
                              update: productProvider.updatePrice,
                              Type: TextInputType.number,
                              format: [FilteringTextInputFormatter.digitsOnly],
                              customValidator: (value) {
                                if (value != null && value.isNotEmpty) {
                                  final price = int.tryParse(value);
                                  if (price == null || price <= 0) {
                                    return 'Please enter a valid price';
                                  }
                                }
                                return null;
                              },
                            ),
                            const SizedBox(height: 8),
                            TextField_addProduct<String>(
                              label: "category",
                              update: productProvider.updateCategory,
                            ),
                            const SizedBox(height: 8),
                            TextField_addProduct<String>(
                              label: "imageUrl",
                              update: productProvider.updateImageUrl,
                              customValidator: (value) {
                                if (value != null && value.isNotEmpty) {
                                  if (!Uri.tryParse(value)!.hasAbsolutePath) {
                                    return 'Please enter a valid URL';
                                  }
                                }
                                return null;
                              },
                            ),
                            const SizedBox(height: 8),
                            TextField_addProduct<int>(
                              label: "discount (optional)",
                              update: productProvider.updateDiscount,
                              isRequired: false,
                              Type: TextInputType.number,
                              format: [FilteringTextInputFormatter.digitsOnly],
                              customValidator: (value) {
                                if (value != null && value.isNotEmpty) {
                                  final discount = int.tryParse(value);
                                  if (discount == null ||
                                      discount < 0 ||
                                      discount > 100) {
                                    return 'Discount must be between 0 and 100';
                                  }
                                }
                                return null;
                              },
                            ),
                            const SizedBox(height: 8),
                            TextField_addProduct<int>(
                              label: 'Rate (optional)',
                              update: productProvider.updateRate,
                              isRequired: false,
                              Type: TextInputType.number,
                              format: [FilteringTextInputFormatter.digitsOnly],
                              customValidator: (value) {
                                if (value != null && value.isNotEmpty) {
                                  final rate = int.tryParse(value);
                                  if (rate == null || rate < 0 || rate > 5) {
                                    return 'Rate must be between 0 and 5';
                                  }
                                }
                                return null;
                              },
                            ),
                            const SizedBox(height: 8),
                            Row(
                              children: [
                                Checkbox(
                                  value: productProvider.isNew,
                                  onChanged: (value) {
                                    productProvider.toggleIsNew(value ?? false);
                                  },
                                ),
                                Text('New Product'),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  actions: [
                    TextButton(
                      onPressed: () => Navigator.of(context).pop(),
                      child: Text('Cancel'),
                    ),
                    TextButton(
                      onPressed: () async {
                        if (formKey.currentState!.validate()) {
                          try {
                            final productId = DateTime.now().toString();

                            database.setProduct(
                              Product(
                                id: productId,
                                title: productProvider.title!,
                                price: productProvider.price!,
                                category: productProvider.category!,
                                imageUrl: productProvider.imageUrl!,
                                discountValue: productProvider.discount,
                                rate: productProvider.rate,
                                isNew: productProvider.isNew!,
                              ),
                            );
                            Navigator.of(context).pop();
                          } catch (e) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: Text('Error adding product: $e'),
                              ),
                            );
                          }
                        }
                      },
                      child: Text('Add'),
                    ),
                  ],
                ),
          ),
        ),
  );
}

class TextField_addProduct<T> extends StatelessWidget {
  final void Function(T)? update;
  final String label;
  final TextInputType? Type;
  final List<TextInputFormatter>? format;
  final bool isRequired;
  final String? Function(String?)? customValidator;

  const TextField_addProduct({
    super.key,
    required this.update,
    required this.label,
    this.Type,
    this.format,
    this.isRequired = true,
    this.customValidator,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onChanged: (value) {
        if (update != null) {
          if (T == int) {
            final intValue = int.tryParse(value);
            if (intValue != null) {
              update!(intValue as T);
            }
          } else {
            update!(value as T);
          }
        }
      },
      keyboardType: Type,
      inputFormatters: format,
      decoration: InputDecoration(
        labelText: label,
        border: OutlineInputBorder(),
      ),
      validator: (value) {
        if (isRequired && (value == null || value.isEmpty)) {
          return 'This field is required';
        }
        if (customValidator != null) {
          return customValidator!(value);
        }
        if (T == int && value != null && value.isNotEmpty) {
          if (int.tryParse(value) == null) {
            return 'Please enter a valid number';
          }
        }
        return null;
      },
    );
  }
}
