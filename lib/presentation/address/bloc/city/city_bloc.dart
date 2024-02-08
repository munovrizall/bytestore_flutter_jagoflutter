import 'package:bloc/bloc.dart';
import 'package:byte_store/data/datasources/rajaongkir_remote_datasource.dart';
import 'package:byte_store/data/models/responses/city_response_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'city_event.dart';
part 'city_state.dart';
part 'city_bloc.freezed.dart';

class CityBloc extends Bloc<CityEvent, CityState> {
  final RajaongkirRemoteDatasource rajaongkirRemoteDatasource;
  CityBloc(
    this.rajaongkirRemoteDatasource,
  ) : super(const _Initial()) {
    on<_GetCity>((event, emit) async{
      emit(const _Loading());
      final response = await rajaongkirRemoteDatasource.getCitiesByProvince(event.provId);
      response.fold(
        (l) => emit(_Error(l)),
        (r) => emit(_Loaded(r.rajaongkir?.results ?? [])),
      );
    });
  }
}
