class FValidator {
  static String? validateEmtyText(String? fieldName, String? value) {
    if (value == null || value.isEmpty) {
      return '$fieldName is required.';
    }
    return null;
  }

  static String? validateEmail(String? value) {
    if (value == null || value.isEmpty) {
      return 'Email is required.';
    }
    final emailRegExp = RegExp(r'^[\w-\.]+@([\w-]+\.)+@[\w-]{2,4}$');
    if (!emailRegExp.hasMatch(value)) {
      return 'Invalid Email adress.';
    }
    return null;
  }

  static String? validatePassword(String? value) {
    if (value == null || value.isEmpty) {
      return 'Password is required.';
    }
    if (value.length < 6) {
      return 'Password must be at least 6 characters long.';
    }

    if (!value.contains(RegExp(r'[A-Z]'))) {
      return 'Password must contain at least one uppercase. ';
    }
    if (!value.contains(RegExp(r'[0-9]'))) {
      return 'Password must contain at least one  number.';
    }
    if (!value.contains(RegExp(r'[!@#$%^&*(),.?":{}|<>]'))) {
      return 'password must contain one special character .';
    }
    return null;
  }

  static String? validatePhoneNo(String? value) {
    if (value == null || value.isEmpty) {
      return 'Phone number is required.';
    }
    final phoneRegisterExp = RegExp(r'\d{10}$');
    if (!phoneRegisterExp.hasMatch(value)) {
      return 'invalid phone number format(10 digits required).';
    }
    return null;
  }
}
