import 'package:formz/formz.dart';

enum MiddleNameValidationError { invalid }

class MiddleName extends FormzInput<String, MiddleNameValidationError> {

  const MiddleName.pure([String value = '']) : super.pure(value);
  const MiddleName.dirty([String value = '']) : super.dirty(value);

  static final _necessaryRegex = RegExp(
      r"([A-ZА-Я][A-ZА-Яа-яa-z ]*)+"
  );

  @override
  MiddleNameValidationError validator(String value) {
    return _necessaryRegex.hasMatch(value) ? null : MiddleNameValidationError.invalid;
  }
}