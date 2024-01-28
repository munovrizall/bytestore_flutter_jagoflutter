// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import 'package:byte_store/data/datasources/product_remote_datasource.dart';
import 'package:byte_store/data/models/responses/product_response_model.dart';

part 'best_seller_product_bloc.freezed.dart';
part 'best_seller_product_event.dart';
part 'best_seller_product_state.dart';

class BestSellerProductBloc
    extends Bloc<BestSellerProductEvent, BestSellerProductState> {
  final ProductRemoteDataSource _productRemoteDataSource;
  BestSellerProductBloc(
    this._productRemoteDataSource,
  ) : super(const _Initial()) {
    on<_GetBestSellerProducts>((event, emit) async {
      final response = await _productRemoteDataSource.getProductByCategory(4);
      response.fold(
          (l) =>
              emit(const BestSellerProductState.error('Internal server error')),
          (r) => emit(BestSellerProductState.loaded(r.data!.data!)));
    });
  }
}
