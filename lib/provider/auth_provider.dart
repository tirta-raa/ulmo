part of 'provider.dart';

/// The [AuthProvider] class is a [ChangeNotifier] that manages user authentication and provides access to the authenticated user's data.
class AuthProvider with ChangeNotifier {
  UserModel? _user;
  final String _userIdKey = 'user_id';
  final String _tokenIdKey = 'token_id';
  final String _userNameKey = 'user_name'; // Key for the user's name
  final String _userImageKey = 'user_image'; // Key for the user's image URL

  /// Getter for the current authenticated user. It returns the [_user] property.
  UserModel? get user => _user;

  /// Setter for the authenticated user. It sets the [_user] property and notifies the listeners when the user changes.
  set user(UserModel? user) {
    _user = user;
    notifyListeners();
  }

  /// Registers a new user with the provided credentials and saves their data to the shared preferences.
  /// Returns `true` if the registration is successful, otherwise `false`.
  Future<bool> register({
    String? name,
    String? username,
    String? email,
    String? password,
  }) async {
    try {
      UserModel user = await AuthServices().register(
        name: name,
        username: username,
        email: email,
        password: password,
      );

      // Save the user data to shared preferences
      await saveUserData(
        user.id.toString(),
        user.token.toString(),
        user.name,
        user.profilePhotoUrl,
      );

      _user = user;
      return true;
    } catch (e) {
      print(e);
      return false;
    }
  }

  /// Logs in the user with the provided credentials and saves their data to the shared preferences.
  /// Returns `true` if the login is successful, otherwise `false`.
  Future<bool> login({
    String? email,
    String? password,
  }) async {
    try {
      UserModel user = await AuthServices().login(
        email: email,
        password: password,
      );

      // Save the user data to shared preferences
      await saveUserData(
        user.id.toString(),
        user.token.toString(),
        user.name,
        user.profilePhotoUrl,
      );

      _user = user;

      // Notify listeners that the user has logged in, triggering a rebuild
      notifyListeners();

      return true;
    } catch (e) {
      print(e);
      return false;
    }
  }

  /// Logs out the current user by removing their data from the shared preferences and setting [_user] to `null`.
  void logout() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.remove(_userIdKey);
    prefs.remove(_tokenIdKey);
    _user = null;
    notifyListeners();
  }

  /// Saves the user data, including ID, token, name, and image URL, to the shared preferences.
  Future<void> saveUserData(
      String userId, String tokenId, String? name, String? image) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString(_userIdKey, userId);
    await prefs.setString(_tokenIdKey, tokenId);
    await prefs.setString(
        _userNameKey, name ?? ''); // Use empty string if name is null
    await prefs.setString(
        _userImageKey, image ?? ''); // Use empty string if image is null
  }

  /// Loads the user ID, token, name, and image URL from the shared preferences.
  /// If the user data is available, it populates [_user] with the retrieved data and returns `true`.
  /// If the user data is not found or incomplete, it returns `false`.
  Future<bool> loadUserIdAndTokenId() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? userId = prefs.getString(_userIdKey);
    String? tokenId = prefs.getString(_tokenIdKey);

    if (userId != null && tokenId != null) {
      // Load additional user data, such as name and image, from shared preferences
      String? userName = prefs.getString(_userNameKey);
      String? userImage = prefs.getString(_userImageKey);

      // Create the user model and populate it with the retrieved data
      UserModel user = UserModel(
        id: int.parse(userId),
        token: tokenId,
        name: userName,
        profilePhotoUrl: userImage,
      );

      _user = user;
      return true;
    }
    return false;
  }
}




// class AuthProvider with ChangeNotifier {
//   UserModel? _user;

//   UserModel? get user => _user;

//   set user(UserModel? user) {
//     _user = user;
//     notifyListeners();
//   }

//   Future<bool> register({
//     String? name,
//     String? username,
//     String? email,
//     String? password,
//   }) async {
//     try {
//       UserModel user = await AuthServices().register(
//           name: name, username: username, email: email, password: password);

//       _user = user;
//       return true;
//     } catch (e) {
//       print(e);
//       return false;
//     }
//   }

//   Future<bool> login({
//     String? email,
//     String? password,
//   }) async {
//     try {
//       UserModel user =
//           await AuthServices().login(email: email, password: password);

//       _user = user;
//       return true;
//     } catch (e) {
//       print(e);
//       return false;
//     }
//   }
// }
