class RegexUtils {
  static bool isValidEmail(String email) {
    RegExp emailRegex = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
    return emailRegex.hasMatch(email);
  }

  static bool isValidPhoneNumber(String phoneNumber) {
    RegExp phoneNumberRegex =
        RegExp(r'^(\+\d{1,2}\s?)?\(?\d{3}\)?[\s.-]?\d{3}[\s.-]?\d{4}$');
    return phoneNumberRegex.hasMatch(phoneNumber);
  }

  static bool isValidUsername(String username) {
    RegExp usernameRegex = RegExp(r'^[a-z0-9_-]{3,15}$');
    return usernameRegex.hasMatch(username);
  }

  //Validation for greater than 18 age
  static bool isValidAge(String age) {
    RegExp ageRegex = RegExp(r'^(1[89]|[2-9]\d)$');
    return ageRegex.hasMatch(age);
  }

  static bool isValidPassword(String password) {
    RegExp passwordRegex =
        RegExp(r'^(?=.*\d)(?=.*[a-z])(?=.*[A-Z])(?=.*[a-zA-Z]).{8,}$');
    return passwordRegex.hasMatch(password);
  }
}
