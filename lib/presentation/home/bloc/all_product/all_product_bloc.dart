// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:bloc/bloc.dart';
import 'package:byte_store/presentation/home/widgets/organism/product_list.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import 'package:byte_store/data/datasources/product_remote_datasource.dart';
import 'package:byte_store/data/models/responses/product_response_model.dart';

part 'all_product_bloc.freezed.dart';
part 'all_product_event.dart';
part 'all_product_state.dart';

class AllProductBloc extends Bloc<AllProductEvent, AllProductState> {
  final ProductRemoteDataSource _productRemoteDataSource;

  AllProductBloc(
    this._productRemoteDataSource,
  ) : super(const _Initial()) {
    on<AllProductEvent>((event, emit) async {
      emit(const AllProductState.loading());
      final response = await _productRemoteDataSource.getAllProducts();
      response.fold(
          (l) => emit(const AllProductState.error('Internal server error')),
          (r) => emit(AllProductState.loaded(r.data!.data!)));
    });
  }
}
