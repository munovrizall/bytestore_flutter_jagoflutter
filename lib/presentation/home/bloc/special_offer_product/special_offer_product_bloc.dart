import 'package:bloc/bloc.dart';
import 'package:byte_store/data/datasources/product_remote_datasource.dart';
import 'package:byte_store/data/models/responses/product_response_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'special_offer_product_event.dart';
part 'special_offer_product_state.dart';
part 'special_offer_product_bloc.freezed.dart';

class SpecialOfferProductBloc
    extends Bloc<SpecialOfferProductEvent, SpecialOfferProductState> {
  final ProductRemoteDataSource _productRemoteDataSource;

  SpecialOfferProductBloc(this._productRemoteDataSource)
      : super(const _Initial()) {
    on<SpecialOfferProductEvent>((event, emit) async {
      emit(const SpecialOfferProductState.loading());
      final response = await _productRemoteDataSource.getProductByCategory(2);
      response.fold(
        (l) =>
            emit(const SpecialOfferProductState.error('Internal server error')),
        (r) => emit(SpecialOfferProductState.loaded(r.data!.data!)),
      );
    });
  }
}
