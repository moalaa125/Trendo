import 'package:flutter/material.dart';
import 'package:store_app/models/product_model.dart';
import 'package:store_app/services/update_product.dart';
import 'package:store_app/widgets/custom_text_filed.dart';
import 'package:store_app/widgets/cutom_button.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

class UpdateProductPage extends StatefulWidget {
  const UpdateProductPage({super.key});

  static String id = 'update_product';

  @override
  State<UpdateProductPage> createState() => _UpdateProductPageState();
}

class _UpdateProductPageState extends State<UpdateProductPage> {
  String? productName;

  int? productPrice;

  String? productDescription;

  String? productImage;

  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    ProductModel product =
        ModalRoute.of(context)!.settings.arguments as ProductModel;
    return ModalProgressHUD(
      inAsyncCall: isLoading,
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          elevation: 0,
          scrolledUnderElevation: 0,
          backgroundColor: Colors.white,
          title: Text('Update Product'),
          centerTitle: true,
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              CustomTextFiled(
                hintText: 'Product Name',
                onChanged: (data) {
                  productName = data;
                },
              ),
              CustomTextFiled(
                hintText: 'Product Description',
                onChanged: (data) {
                  productDescription = data;
                },
              ),
              CustomTextFiled(
                keyBoardType: TextInputType.number,
                hintText: 'Product Price',
                onChanged: (data) {
                  productPrice = int.parse(data);
                },
              ),
              CustomTextFiled(
                hintText: 'Product Image',
                onChanged: (data) {
                  productImage = data;
                },
              ),
              SizedBox(height: 20),
              CustomButton(
                text: 'Update',
                ontap: () async {
                  setState(() {
                    isLoading = true;
                  });

                  try {
                    await updateProduct(product);
                    print('success');
                  } catch (e) {
                    print(e.toString());
                  }

                  setState(() {
                    isLoading = false;
                  });
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> updateProduct(ProductModel product) async {
    await UpdateProductService().UpdateProduct(
      id: product.id,
      title: productName == null ? product.title : productName!,
      price: productPrice == null ? product.price : productPrice!.toDouble(),
      description: productDescription == null
          ? product.description
          : productDescription!,
      category: product.category,
      image: productImage == null ? product.image : productImage!,
    );
  }
}
