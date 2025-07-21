part of 'shared.dart';

String? requiredField(String? value) {
  if (value == null || value.isEmpty) {
    return 'This field can\'t be empty';
  }
  return null;
}

String? validateEmail(String? value) {
  if (value == null || value.isEmpty) {
    return 'Email field can\'t be empty';
  }
  if (!RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$').hasMatch(value)) {
    return 'Email doesn\'t match the pattern';
  }
  return null;
}

String? validatePassword(String? value) {
  if (value == null || value.isEmpty) {
    return 'Password field can\'t be empty';
  } else if (value.length < 8) {
    return 'Password field should be at least 8 characters long';
  }
  return null;
}

String? validateConfirmPassword(String? value, String password) {
  if (value == null || value.isEmpty) {
    return 'Confirm password field can\'t be empty';
  } else if (value != password) {
    return 'Password doesn\'t match';
  }
  return null;
}


