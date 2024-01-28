import 'package:bloc/bloc.dart';
import 'package:byte_store/data/models/responses/product_response_model.dart';
import 'package:byte_store/presentation/home/models/product_quantity.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'checkout_event.dart';
part 'checkout_state.dart';
part 'checkout_bloc.freezed.dart';

class CheckoutBloc extends Bloc<CheckoutEvent, CheckoutState> {
  CheckoutBloc() : super(const _Loaded([])) {
    on<_AddItem>((event, emit) {
      final currentState = state as _Loaded;
      if (currentState.products
          .any((element) => element.product.id == event.product.id)) {
        final index = currentState.products
            .indexWhere((element) => element.product.id == event.product.id);
        final item = currentState.products[index];
        final newItem = item.copyWith(quantity: item.quantity + 1);
        final newItems =
            currentState.products.map((e) => e == item ? newItem : e).toList();
        emit(_Loaded(newItems));
      } else {
        final newItem = ProductQuantity(product: event.product, quantity: 1);
        final newItems = [...currentState.products, newItem];
        emit(_Loaded(newItems));
      }
    });
  }
}
