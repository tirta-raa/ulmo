part of 'provider.dart';

/// A provider class responsible for managing the state of the products in the application.
/// This class extends the `ChangeNotifier` class, allowing it to notify its listeners
/// about changes to its state.
class ProductProvider with ChangeNotifier {
  List<ProductModel> _products = [];

  /// Get the list of products currently available in the application.
  List<ProductModel> get products => _products;

  /// Set the list of products and notify listeners about the change.
  set products(List<ProductModel> products) {
    _products = products;
    notifyListeners();
  }

  /// Fetches the list of products from the backend or data source.
  /// This method is asynchronous and updates the `_products` list
  /// with the fetched data upon successful retrieval.
  ///
  /// Throws an exception if there's an error while fetching the data.
  Future<void> getProducts() async {
    try {
      // Call the `getProducts` method from the `ProductServices` class
      // to retrieve the list of products from the backend or data source.
      List<ProductModel> products = await ProductServices().getProducts();

      // Update the `_products` list with the fetched data.
      _products = products;
    } catch (e) {
      // Print the error if there's any while fetching the data.
      print(e);
    }
  }
}
