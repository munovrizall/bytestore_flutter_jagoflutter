part of 'checkout_bloc.dart';

@freezed
class CheckoutEvent with _$CheckoutEvent {
  const factory CheckoutEvent.started() = _Started;
  const factory CheckoutEvent.addItem(Product product) = _AddItem;
  const factory CheckoutEvent.removeItem(Product product) = _RemoveItem;
  const factory CheckoutEvent.addAddressId(int addressId) = _AddAddressId;
  const factory CheckoutEvent.addPaymentMethod(String paymentMethod) =_AddPaymentMethod;
  const factory CheckoutEvent.addShippingService(String shippingService, int shippingCost) = _AddShippingService;
}
