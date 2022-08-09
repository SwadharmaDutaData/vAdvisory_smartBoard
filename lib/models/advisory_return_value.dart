part of 'models.dart';

class AdvisoryReturnValue<T> {
  final T? valueA;
  final T? valueB;
  final String? message;
  final String? code;

  AdvisoryReturnValue({this.message, this.valueA, this.valueB, this.code});
}
