part of 'package:address_search_field/src/services/geo_methods.dart';

Future<Map<String, dynamic>> _httpClient(Uri uri) async {
  final baseOptions = BaseOptions(
      connectTimeout: 5000,
      receiveTimeout: 5000,
      contentType: 'application/json',
      responseType: ResponseType.json,
      headers: {"x-cors-api-key": "temp_cd8e686fa4a52247f5d6dded27fb8a38"});
  final client = Dio(baseOptions);
  final Response<Map<String, dynamic>> response = await client.getUri(uri);
  if (response.statusCode != 200) {
    throw 'Request failed with status: ${response.statusCode}';
  }
  final jsonResponse = response.data!;
  String error = jsonResponse['error_message'] ?? '';
  if (error.isNotEmpty) throw 'GCP error: $error';
  return jsonResponse;
}
