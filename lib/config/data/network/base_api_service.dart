/// Abstract class for defining base API services.
/// This class serves as a blueprint for making HTTP requests across the app.
abstract class BaseApiServices {
  /// Sends a GET request to the given [url] and returns the response.
  Future<dynamic> getApi(String url);

  /// Sends a POST request to the given [url] with the provided [data] and returns the response.
  Future<dynamic> postApi(String url, dynamic data);

  /// Sends a DELETE request to the given [url] and returns the response.
  Future<dynamic> deleteApi(String url);

  /// Sends an UPDATE request (PUT/PATCH) to the given [url] and returns the response.
  Future<dynamic> updateApi(String url);
}
