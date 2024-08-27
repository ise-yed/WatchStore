class HttpResponseValidator {
  static bool isValidStatusCode(int statusCode) {
    if (statusCode >= 200 && statusCode < 300) {
      return true;
    } else {
      throw HttpException(statusCode: statusCode);
    }
  }
}

class HttpException implements Exception {
  final int statusCode;

  HttpException({required this.statusCode});

  @override
  String toString() {
    String message;
    switch (statusCode) {
      case 400:
        message = 'Bad Request!';
        break;
      case 401:
        message = 'Unauthorized!';
        break;
      case 403:
        message = 'Forbidden!';
        break;
      case 409:
        message = 'Conflict!';
        break;
      case 500:
        message = 'Internal Server Error!';
        break;
      default:
        message = 'Unknown Error';
    }
    return 'HttpException: StatusCode $statusCode, msg: $message';
  }
}
