class ResponseData<T> {
  final bool success;
  final String message;
  final T? data;
  final int? statusCode;

  ResponseData({
    required this.success,
    required this.message,
    this.data,
    this.statusCode,
  });

  factory ResponseData.success(
    T data, {
    String message = 'Success',
    int? statusCode,
  }) {
    return ResponseData(
      success: true,
      message: message,
      data: data,
      statusCode: statusCode,
    );
  }

  factory ResponseData.error(String message, {int? statusCode}) {
    return ResponseData(
      success: false,
      message: message,
      statusCode: statusCode,
    );
  }
}
