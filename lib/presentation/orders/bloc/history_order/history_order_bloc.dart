import 'package:bloc/bloc.dart';
import 'package:byte_store/data/datasources/order_remote_datasource.dart';
import 'package:byte_store/data/models/responses/history_order_response_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'history_order_event.dart';
part 'history_order_state.dart';
part 'history_order_bloc.freezed.dart';

class HistoryOrderBloc extends Bloc<HistoryOrderEvent, HistoryOrderState> {
  final OrderRemoteDatasource orderRemoteDatasource;
  HistoryOrderBloc(
    this.orderRemoteDatasource,
  ) : super(const _Initial()) {
    on<_HistoryOrder>((event, emit) async {
      emit(const _Loading());
      final response = await orderRemoteDatasource.getOrders();
      response.fold(
        (l) => emit(const _Error('Error')),
        (r) => emit(_Loaded(r)),
      );
    });
  }
}
