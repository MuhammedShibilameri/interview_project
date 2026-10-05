import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import '../models/user_model.dart';

/// Custom exception class providing clean, user-friendly error messages.
class ApiException implements Exception {
  final String message;

  const ApiException(this.message);

  @override
  String toString() => message;
}

/// Service responsible for fetching user data from the REST API.
class UserApiService {
  static const String _usersUrl = 'https://jsonplaceholder.typicode.com/users';
  static const Duration _timeoutDuration = Duration(seconds: 10);

  final http.Client _client;

  UserApiService({http.Client? client}) : _client = client ?? http.Client();

  /// Fetches the list of users from jsonplaceholder.
  /// Throws [ApiException] with user-friendly messages on error.
  Future<List<User>> fetchUsers() async {
    try {
      final response = await _client
          .get(Uri.parse(_usersUrl))
          .timeout(_timeoutDuration);

      if (response.statusCode == 200) {
        final dynamic decodedData = jsonDecode(response.body);

        if (decodedData is List) {
          return decodedData
              .map((item) => User.fromJson(item as Map<String, dynamic>))
              .toList();
        } else {
          throw const ApiException('Invalid data format received from server.');
        }
      } else {
        throw ApiException(
          'Server returned an error (${response.statusCode}). Please try again later.',
        );
      }
    } on TimeoutException {
      throw const ApiException(
        'Request timed out. Please check your internet connection.',
      );
    } on SocketException {
      throw const ApiException(
        'No internet connection. Please verify your network and try again.',
      );
    } on http.ClientException {
      throw const ApiException(
        'Network error occurred. Please verify your connection.',
      );
    } on FormatException {
      throw const ApiException(
        'Unable to parse response from server. Data format error.',
      );
    } on ApiException {
      // Re-throw our typed ApiException
      rethrow;
    } catch (e) {
      throw ApiException('An unexpected error occurred: ${e.toString()}');
    }
  }
}
