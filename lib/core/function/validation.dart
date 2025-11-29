class AppValidation {
  static String? emailValidator(String value) {
    if (value.isEmpty) {
      return 'Please Enter Your Email';
    }
    if (!RegExp(r'\b[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\.[A-Z|a-z]{2,}\b')
        .hasMatch(value)) {
      return 'Please Enter a Vaild Email';
    }
    return null;
  }

  static String? passwordVaildtor(
    String? vlaue, {
    bool lengthValidation = true,
  }) {
    final bool passwordValid =
        RegExp(r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~_]).{8,}$')
            .hasMatch(vlaue ?? "");

    if (!passwordValid) {
      return "password should contain at least one upper case,\nat least one lower case,\nat least one digit,\nat least one Special character,\nat least 8 characters";
    }
    return null;
  }

  static String? confirmPasswordVaildtor({String? password, String? value}) {
    if (value != password) {
      return "Password Should Be Similar ";
    }
    return null;
  }

  static String? displayNameValidator(String? displayName) {
    if (displayName == null || displayName.isEmpty) {
      return "Please Enter Your Name ";
    }
    return null;
  }

  static String? phoneNumberVaildtor(String? phoneNumber) {
    if (phoneNumber == null || phoneNumber.isEmpty) {
      return "Please Enter Your Phone Number";
    }
    if (phoneNumber.length < 10) {
      return "Please Enter Phone Number More Than 10 Numbers";
    }
    return null;
  }
}
