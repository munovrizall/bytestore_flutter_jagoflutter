// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:bloc/bloc.dart';
import 'package:byte_store/data/models/responses/address_response_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import 'package:byte_store/data/datasources/address_remote_datasource.dart';

part 'address_bloc.freezed.dart';
part 'address_event.dart';
part 'address_state.dart';

class AddressBloc extends Bloc<AddressEvent, AddressState> {
  final AddressRemoteDataSource addressRemoteDataSource;
  AddressBloc(
    this.addressRemoteDataSource,
  ) : super(const _Initial()) {
    on<AddressEvent>((event, emit) async {
      emit(const _Loading());
      final response = await addressRemoteDataSource.getAddresses();
      response.fold(
        (l) => emit(_Error(l)),
        (r) => emit(_Loaded(r.data ?? [])),
      );
    });
  }
}
