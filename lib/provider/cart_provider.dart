part of 'provider.dart';

class CartProvider with ChangeNotifier {
  List<CartModel> _carts = [];

  List<CartModel> get carts => _carts;

  set carts(List<CartModel> carts) {
    _carts = carts;
    notifyListeners();
  }

  addCart(ProductModel product) {
    if (productExist(product)) {
      int index =
          _carts.indexWhere((element) => element.product?.id == product.id);
      _carts[index].quantity! + 1;
    } else {
      _carts.add(CartModel(
        id: _carts.length,
        product: product,
        quantity: 1,
      ));
    }
    notifyListeners();
  }

  removeChart(int id) {
    int index = _carts.indexWhere((element) => element.id == id);
    if (index != -1) {
      _carts.removeAt(index); // Remove the cart item at the found index
      notifyListeners();
    } else {
      print("CartModel with id $id not found in the list.");
    }
  }

  addQuantity(CartModel cart) {
    int index = _carts.indexWhere((element) => element.id == cart.id);
    if (index != -1) {
      _carts[index].quantity =
          (_carts[index].quantity ?? 0) + 1; // Increment quantity by 1
      print("Quantity increased to: ${_carts[index].quantity}");
      notifyListeners();
    } else {
      print("CartModel not found in the list.");
    }
  }

  reduceQuantity(CartModel cart) {
    int index = _carts.indexWhere((element) => element.id == cart.id);
    if (index != -1) {
      _carts[index].quantity = (_carts[index].quantity ?? 0) - 1;

      // Check if the quantity becomes less than 1, set it back to 1
      if (_carts[index].quantity! < 1) {
        _carts[index].quantity = 1;
      }

      print("Quantity reduced to: ${_carts[index].quantity}");
      notifyListeners();
    } else {
      print("CartModel not found in the list.");
    }
  }

  totalItem() {
    int total = 0;
    for (var i in _carts) {
      total += i.quantity!;
    }
    return total;
  }

  totalPrice() {
    double total = 0;
    for (var i in _carts) {
      double productPrice = i.product?.price ?? 0;
      int quantity = i.quantity ?? 0;

      total += (quantity * productPrice);
    }
    return total;
  }

  productExist(ProductModel product) {
    if (_carts.indexWhere((element) => element.id == product.id) == -1) {
      return false;
    } else {
      return true;
    }
  }
}
