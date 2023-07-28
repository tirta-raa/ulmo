part of 'services.dart';

/// A service class that handles the checkout process by sending a POST request
/// to the backend API for placing an order.
///
/// The [baseUrl] represents the base URL of the backend API.
/// The [checkout] method initiates the checkout process by sending a POST
/// request to the '/checkout' endpoint of the backend API with the provided data.
/// The [token] parameter is the authentication token required for the request.
/// The [carts] parameter is a list of [CartModel] objects containing the items
/// to be checked out.
/// The [totalPrice] parameter represents the total price of the items in the cart.
class CheckoutServices {
  /// Initiates the checkout process by sending a POST request to the backend API.
  ///
  /// The [token] parameter is the authentication token required for the request.
  /// The [carts] parameter is a list of [CartModel] objects containing the items
  /// to be checked out.
  /// The [totalPrice] parameter represents the total price of the items in the cart.
  ///
  /// Returns a [Future] that completes with a [bool] value indicating whether
  /// the checkout was successful or not. If the checkout is successful, it returns true,
  /// otherwise, it throws an [Exception] with a message indicating the failure reason.
  Future<bool> checkout(
      String token, List<CartModel> carts, double totalPrice) async {
    // Construct the request URL
    Uri url = Uri.parse('$baseUrl/checkout');

    // Prepare the request headers
    var headers = {
      'Content-Type': 'application/json',
      'Authorization': token,
    };

    // Prepare the request body by encoding the data in JSON format
    var body = jsonEncode(
      {
        'address': 'Marsemoon', // Replace with the actual address for the order
        'items': carts
            .map(
              (cart) => {
                'id': cart.product?.id, // Extract the product ID from the cart
                'quantity': cart.quantity,
              },
            )
            .toList(),
        'status': "PENDING", // Set the status of the order to PENDING
        'total_price': totalPrice,
        'shipping_price':
            0, // Replace with the actual shipping price if applicable
      },
    );

    // Send the POST request to the backend API
    var response = await http.post(
      url,
      headers: headers,
      body: body,
    );

    // Print the response body for debugging purposes
    print(response.body);

    // Check the response status code and return the appropriate result
    if (response.statusCode == 200) {
      return true; // Checkout was successful
    } else {
      throw Exception('Gagal Melakukan Checkout!'); // Checkout failed
    }
  }
}



// class CheckoutServices {
//   String baseUrl = 'https://shamo-backend.buildwithangga.id/api';

//   Future<bool> checkout(
//       String token, List<CartModel> carts, double totalPrice) async {
//     Uri url = Uri.parse('$baseUrl/checkout');
    
//     // liat do postman api ini headersnya ada dua
//     var headers = {
//       'Content-Type': 'application/json',
//       'Authorization': token,
//     };
//     var body = jsonEncode(
//       {
//         'address': 'Marsemoon',
//         'items': carts
//             .map(
//               (cart) => {
//                 'id': cart.product?.id,
//                 'quantity': cart.quantity,
//               },
//             )
//             .toList(),
//         'status': "PENDING",
//         'total_price': totalPrice,
//         'shipping_price': 0,
//       },
//     );

//     var response = await http.post(
//       url,
//       headers: headers,
//       body: body,
//     );

//     print(response.body);

//     if (response.statusCode == 200) {
//       return true;
//     } else {
//       throw Exception('Gagal Melakukan Checkout!');
//     }
//   }
// }
