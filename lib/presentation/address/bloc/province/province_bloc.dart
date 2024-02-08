import 'package:bloc/bloc.dart';
import 'package:byte_store/data/datasources/rajaongkir_remote_datasource.dart';
import 'package:byte_store/data/models/responses/province_response_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'province_event.dart';
part 'province_state.dart';
part 'province_bloc.freezed.dart';

class ProvinceBloc extends Bloc<ProvinceEvent, ProvinceState> {
  final RajaongkirRemoteDatasource rajaongkirRemoteDatasource;
  ProvinceBloc(
    this.rajaongkirRemoteDatasource,
  ) : super(const _Initial()) {
    on<_GetProvinces>((event, emit) async{
      emit(const _Loading());
      final response = await rajaongkirRemoteDatasource.getProvinces();
      response.fold(
        (l) => emit(_Error(l)),
        (r) => emit(_Loaded(r.rajaongkir?.results ?? [])),
      );
    });
  }
}
