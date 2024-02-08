import 'package:bloc/bloc.dart';
import 'package:byte_store/data/datasources/rajaongkir_remote_datasource.dart';
import 'package:byte_store/data/models/responses/subdistrict_response_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'subdistrict_event.dart';
part 'subdistrict_state.dart';
part 'subdistrict_bloc.freezed.dart';

class SubdistrictBloc extends Bloc<SubdistrictEvent, SubdistrictState> {
  final RajaongkirRemoteDatasource rajaongkirRemoteDatasource;
  SubdistrictBloc(
    this.rajaongkirRemoteDatasource,
  ) : super(const _Initial()) {
    on<_GetSubdistricts>((event, emit) async {
      emit(const _Loading());
      final response =
          await rajaongkirRemoteDatasource.getSubdistrictsByCity(event.cityId);
      response.fold(
        (l) => emit(_Error(l)),
        (r) => emit(_Loaded(r.rajaongkir?.results ?? [])),
      );
    });
  }
}
