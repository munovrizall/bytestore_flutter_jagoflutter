// ignore_for_file: public_member_api_docs, sort_constructors_first
import '../../home/models/product_model.dart';

class CartModel {
  final ProductModel product;
  int quantity;

  CartModel({
    required this.product,
    required this.quantity,
  });
}
