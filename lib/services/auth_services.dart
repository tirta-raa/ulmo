part of 'services.dart';

/// The [AuthServices] class provides methods to interact with the authentication services on the backend.
class AuthServices {
  /// Registers a new user with the provided credentials.
  ///
  /// Parameters:
  ///   - [name]: The user's full name.
  ///   - [username]: The user's username.
  ///   - [email]: The user's email address.
  ///   - [password]: The user's password.
  ///
  /// Returns a [UserModel] object representing the registered user if the registration is successful.
  ///
  /// Throws an [Exception] with the message 'Gagal Register' if the registration fails.
  Future<UserModel> register({
    String? name,
    String? username,
    String? email,
    String? password,
  }) async {
    Uri url = Uri.parse('$baseUrl/register');

    // Headers for the HTTP POST request
    var headers = {'Content-Type': 'application/json'};

    // JSON body to be sent in the request
    var body = jsonEncode({
      'name': name,
      'username': username,
      'email': email,
      'password': password,
    });

    // Send the HTTP POST request to the backend
    var response = await http.post(
      url,
      headers: headers,
      body: body,
    );

    // Parse the response and handle the registration result
    if (response.statusCode == 200) {
      // Extract user data from the response JSON
      var data = jsonDecode(response.body)['data'];
      UserModel user = UserModel.fromJson(data['user']);

      // Set the user's access token received from the backend
      user.token = 'Bearer ' + data['access_token'];

      // Return the registered user
      return user;
    } else {
      // Throw an exception if the registration fails
      throw Exception('Gagal Register');
    }
  }

  /// Logs in the user with the provided credentials.
  ///
  /// Parameters:
  ///   - [email]: The user's email address.
  ///   - [password]: The user's password.
  ///
  /// Returns a [UserModel] object representing the logged-in user if the login is successful.
  ///
  /// Throws an [Exception] with the message 'Gagal Login' if the login fails.
  Future<UserModel> login({
    String? email,
    String? password,
  }) async {
    Uri url = Uri.parse('$baseUrl/login');

    // Headers for the HTTP POST request
    var headers = {'Content-Type': 'application/json'};

    // JSON body to be sent in the request
    var body = jsonEncode({
      'email': email,
      'password': password,
    });

    // Send the HTTP POST request to the backend
    var response = await http.post(
      url,
      headers: headers,
      body: body,
    );

    // Parse the response and handle the login result
    if (response.statusCode == 200) {
      // Extract user data from the response JSON
      var data = jsonDecode(response.body)['data'];
      UserModel user = UserModel.fromJson(data['user']);

      // Set the user's access token received from the backend
      user.token = 'Bearer ' + data['access_token'];

      // Return the logged-in user
      return user;
    } else {
      // Throw an exception if the login fails
      throw Exception('Gagal Login');
    }
  }
}




// class AuthServices {
//   String baseUrl = 'https://shamo-backend.buildwithangga.id/api';

//   Future<UserModel> register({
//     String? name,
//     String? username,
//     String? email,
//     String? password,
//   }) async {
//     Uri url = Uri.parse('$baseUrl/register');

//     //ada di postman
//     var headers = {'Content-Type': 'application/json'};

//     var body = jsonEncode({
//       'name': name,
//       'username': username,
//       'email': email,
//       'password': password,
//     });

//     // var respone di gunakan ketika request kedalam backend menggunakn http sesuaikan post atau getnya sesuai dengan ada yang di postman
//     var response = await http.post(
//       url,
//       headers: headers,
//       body: body,
//     );

//     print(response.body);

//     if (response.statusCode == 200) {
//       // datanya itu dari body yang ada di api ada di postman
//       var data = jsonDecode(response.body)['data'];
//       // mengambil data dari json yang nama kuncinya user
//       UserModel user = UserModel.fromJson(data['user']);
//       //Bearer itu dari token typenya yang ada di postman kemudian ambil acess tokenya yang ada di postman juga
//       user.token = 'Bearer' + data['access_token'];

//       return user;
//     } else {
//       throw Exception('Gagal Register');
//     }
//   }

//   // -----------------------------------------------------------------------------

//   Future<UserModel> login({
//     String? email,
//     String? password,
//   }) async {
//     Uri url = Uri.parse('$baseUrl/login');

//     //ada di postman
//     var headers = {'Content-Type': 'application/json'};

//     var body = jsonEncode({
//       'email': email,
//       'password': password,
//     });

//     // var respone di gunakan ketika request kedalam backend menggunakn http sesuaikan post atau getnya sesuai dengan ada yang di postman
//     var response = await http.post(
//       url,
//       headers: headers,
//       body: body,
//     );

//     print(response.body);

//     if (response.statusCode == 200) {
//       // datanya itu dari body yang ada di api ada di postman
//       var data = jsonDecode(response.body)['data'];
//       // mengambil data dari json yang nama kuncinya user
//       UserModel user = UserModel.fromJson(data['user']);
//       //Bearer itu dari token typenya yang ada di postman kemudian ambil acess tokenya yang ada di postman juga
//       user.token = 'Bearer' + data['access_token'];

//       return user;
//     } else {
//       throw Exception('Gagal Login');
//     }
//   }

//   // ------------------------------------------------------
// }
