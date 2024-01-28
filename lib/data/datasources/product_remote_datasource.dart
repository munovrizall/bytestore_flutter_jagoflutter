import 'package:byte_store/data/models/responses/product_response_model.dart';
import 'package:dartz/dartz.dart';
import 'package:http/http.dart' as http;

import '../../core/constants/variables.dart';

class ProductRemoteDataSource {
  Future<Either<String, ProductResponseModel>> getAllProducts() async {
    final response =
        await http.get(Uri.parse('${Variables.baseUrl}/api/products'));

    if (response.statusCode == 200) {
      return Right(ProductResponseModel.fromJson(response.body));
    } else {
      return const Left('Internal Server error');
    }
  }

  Future<Either<String, ProductResponseModel>> getProductByCategory(
      int categoryId) async {
    final response =
        await http.get(Uri.parse('${Variables.baseUrl}/api/products?category_id=$categoryId'));

    if (response.statusCode == 200) {
      return Right(ProductResponseModel.fromJson(response.body));
    } else {
      return const Left('Internal Server error');
    }
  }
}
