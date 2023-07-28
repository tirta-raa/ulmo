part of 'services.dart';

/// A service class responsible for fetching product data from the backend.
class ProductServices {
  /// Fetches the list of products from the backend.
  ///
  /// Returns a list of [ProductModel] containing the product data.
  /// Throws an exception if there's an error while fetching the data.
  Future<List<ProductModel>> getProducts() async {
    // Construct the URL to request the product data.
    Uri url = Uri.parse('$baseUrl/products');

    // Set the request headers.
    var headers = {'Content-Type': 'application/json'};

    // Send an HTTP GET request to the specified URL with the headers.
    var response = await http.get(url, headers: headers);

    // Print the response body for debugging purposes.
    print(response.body);

    if (response.statusCode == 200) {
      // Decode the response body and extract the data section.
      List data = jsonDecode(response.body)['data']['data'];

      // Create an empty list to store the parsed product data.
      List<ProductModel> products = [];

      // Parse each item in the data list and add it to the products list.
      for (var item in data) {
        products.add(ProductModel.fromJson(item));
      }

      // Return the list of parsed product data.
      return products;
    } else {
      // Throw an exception if there's an error with the HTTP request.
      throw Exception('Gagal memuat product');
    }
  }
}



// class ProductServices {
//   String baseUrl = 'https://shamo-backend.buildwithangga.id/api';

//   Future<List<ProductModel>> getProducts() async {
//     Uri url = Uri.parse('$baseUrl/products');
//     var headers = {'Content-Type': 'application/json'};

//     var response = await http.get(url, headers: headers);

//     print(response.body);

//     if (response.statusCode == 200) {
//       // itu di tulis ['data]['data] karena aray 2 dimensi di apinya begini tulisanya
//       //?  "data": {
//       // "current_page": 1,
//       //? "data": [
//       //     {
//       //         "id": 2,
//       // makanya di tulis [data][data]karena harus masuk ke bagian data ikut tulisanya aja

//       List data = jsonDecode(response.body)['data']['data'];
//       List<ProductModel> products = [];

//       for (var item in data) {
//         products.add(ProductModel.fromJson(item));
//       }
//       return products;
//     } else {
//       throw Exception('Gagal memuat product');
//     }
//   }
// }
