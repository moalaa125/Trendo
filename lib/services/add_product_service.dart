import '../helper/api.dart';
import '../models/product_model.dart';

class AddProduct {
  Future<ProductModel> addProduct({
      required String title,
    required double price,
    required String description,
    required String category,
    required String image,
  }) async {
    Map<String, dynamic> data = await Api().post(
      url: 'https://fakestoreapi.com/products',
      body: {
        'title': title,
        'price': price.toString(),
        'description': description,
        'category': category,
        'image': image,
      },
    );
    print(data);
    return ProductModel.fromJson(data);
  }
}
