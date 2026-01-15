import 'product_model.dart';

class CartItemModel {
  final ProductModel product;
  final int quantity;

  CartItemModel({
    required this.product,
    required this.quantity,
  });

  double get totalPrice => product.priceAfetDiscount ?? product.price * quantity;
}

List<CartItemModel> demoCartItems = [
  CartItemModel(
    product: demoPopularProducts[0],
    quantity: 2,
  ),
  CartItemModel(
    product: demoPopularProducts[1],
    quantity: 1,
  ),
  CartItemModel(
    product: demoPopularProducts[2],
    quantity: 1,
  ),
];
