part of 'models.dart';

class CheckoutModel {
  int? id;
  String? status;
  ProductModel? product;
  CartModel? cart;

  CheckoutModel({
    this.id,
    this.status,
    this.product,
  });

  CheckoutModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    status = json['status'];
    product = json['product'];
    cart = json['cart'];
  }
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'status': status,
      'product': product,
      'cart': cart,
    };
  }
}
