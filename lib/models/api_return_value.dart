part of 'models.dart';

class ApiReturnValue<T> {
  final T? value;
  final String? message;
  final String? code;

  ApiReturnValue({this.message, this.value, this.code});
}
