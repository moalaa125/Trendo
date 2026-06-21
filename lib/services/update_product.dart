import '../helper/api.dart';
import '../models/product_model.dart';

class UpdateProductService {
  Future<ProductModel> UpdateProduct({
    required String title,
    required double price,
    required String description,
    required String category,
    required String image,
    required int id,
  }) async {
    
      print('Produc id = $id');
    Map<String, dynamic> data = await Api().put(
      url: 'https://fakestoreapi.com/products/$id',
      body: {
        'title': title,
        'price': price.toString(),
        'description': description,
        'category': category,
        'image': image,
      },
    );
    
    return ProductModel.fromJson(data);
  }
}
