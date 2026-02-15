class MyError {
  final String message;
  final String? code;

  MyError({required this.message, this.code});

  factory MyError.fromGraphQL(Map<String, dynamic> error) {
    return MyError(
      message: error['message'] ?? 'Unknown error',
      code: error['extensions']?['code'],
    );
  }

  @override
  String toString() => code != null ? '$code: $message' : message;
}
