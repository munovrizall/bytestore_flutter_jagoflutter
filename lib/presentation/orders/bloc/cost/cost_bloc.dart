import 'package:bloc/bloc.dart';
import 'package:byte_store/data/datasources/rajaongkir_remote_datasource.dart';
import 'package:byte_store/data/models/responses/cost_response_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'cost_event.dart';
part 'cost_state.dart';
part 'cost_bloc.freezed.dart';

class CostBloc extends Bloc<CostEvent, CostState> {
  final RajaongkirRemoteDatasource rajaongkirRemoteDatasource;
  CostBloc(
    this.rajaongkirRemoteDatasource,
  ) : super(const _Initial()) {
    on<_GetCost>((event, emit) async {
      emit(const _Loading());
      final response = await rajaongkirRemoteDatasource.getCost(
        event.origin,
        event.destination,
        'jne',
      );
      response.fold(
        (l) => emit(_Error(l)),
        (r) => emit(_Loaded(r)),
      );
    });
  }
}

