// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:byte_store/core/core.dart';
import 'package:byte_store/presentation/home/models/store_model.dart';

class ProductModel {
  final List<String> images;
  final String name;
  final int price;
  final int stock;
  final String description;
  final StoreModel store;

  ProductModel({
    required this.images,
    required this.name,
    required this.price,
    required this.stock,
    required this.description,
    required this.store,
  });

  String get priceFormat => price.currencyFormatRp;
}
