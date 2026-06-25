extension NullableString on String? {
  bool get isNotNull => this != null;
}

extension CredentialValidatorExt on String {
  bool get isValidEmail {
    return RegExp(
      r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$',
    ).hasMatch(this);
  }

  bool get isValidPhone {
    return RegExp(r'^(0[0-9]{7,14}|62[0-9]{7,14})$').hasMatch(this);
  }
}
