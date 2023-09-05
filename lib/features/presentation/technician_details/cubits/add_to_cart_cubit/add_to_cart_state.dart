part of 'add_to_cart_cubit.dart';

class AddToCartState extends Equatable {
  final RequestState addToCartState;

  AddToCartState({this.addToCartState = RequestState.init});

  AddToCartState copyWith({
    RequestState? addToCartState,
  }) {
    return AddToCartState(
      addToCartState: addToCartState ?? this.addToCartState,
    );
  }

  List<Object> get props => [addToCartState];
}
