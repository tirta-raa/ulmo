part of 'provider.dart';

/// A provider class that handles transactions and the checkout process.
///
/// The [checkout] method initiates the checkout process by calling the `checkout` method
/// from the [CheckoutServices] class. It takes the required [token], a list of [CartModel]
/// objects representing the items to be checked out ([carts]), and the [totalPrice] of the items.
///
/// Returns a [Future] that completes with a [bool] value indicating whether the checkout
/// was successful or not. If the checkout is successful, it returns true, otherwise, it returns false.
///
/// If an error occurs during the checkout process, it will be caught, printed to the console,
/// and the method will return false.
class CheckoutProvider with ChangeNotifier {
  /// Initiates the checkout process by calling the `checkout` method from the [CheckoutServices].
  ///
  /// The [token] parameter is the authentication token required for the checkout request.
  /// The [carts] parameter is a list of [CartModel] objects containing the items to be checked out.
  /// The [totalPrice] parameter represents the total price of the items in the cart.
  ///
  /// Returns a [Future] that completes with a [bool] value indicating whether the checkout
  /// was successful or not. If the checkout is successful, it returns true, otherwise, it returns false.
  ///
  /// If an error occurs during the checkout process, it will be caught, printed to the console,
  /// and the method will return false.
  Future<bool> checkout(
      String token, List<CartModel> carts, double totalPrice) async {
    try {
      // Call the checkout method from the CheckoutServices class
      // to initiate the checkout process.
      if (await CheckoutServices().checkout(token, carts, totalPrice)) {
        return true; // Checkout was successful
      } else {
        return false; // Checkout failed
      }
    } catch (e) {
      // Catch any error that occurred during the checkout process,
      // print it to the console for debugging, and return false.
      print(e);
      return false;
    }
  }
}
