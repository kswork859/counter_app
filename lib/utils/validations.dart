class Validations {
  static bool emailValidator(String email) {
    final emailRegex = RegExp(r'^[\w\.-]+@([\w-]+\.)+[\w-]{2,4}$');
    bool emailValid = emailRegex.hasMatch(email);

    return emailValid;
  }
}
