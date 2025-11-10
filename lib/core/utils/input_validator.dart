class InputValidator {
static final RegExp emailRegex = RegExp(
  r'^[a-zA-Z0-9]+@[a-zA-Z0-9]+\.[a-zA-Z]{2,}$'
);

  static final RegExp passwordRegex = RegExp(
    r'^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[!@#\$&*~]).{8,}$',
  );

  static String? vaildatePassSignIn(String password) {
    if (password.isEmpty) {
      return 'Password is required';
    } else
      return null;
  }

  static String? vaildateEmailSignIn(String email) {
    if (email.isEmpty) {
      return 'Email is required';
    } else if (!emailRegex.hasMatch(email)) {
      return 'Please enter a valid email address';
    } else {
      return null;
    }
  }

  static String? vaildatePassSignUp(String password) {
    if (password.isEmpty) {
      return 'Password is required';
    } else if (!passwordRegex.hasMatch(password)) {
      return 'Password must be at least 8 characters, include upper & lower case letters, a number and a special character';
    } else {
      return null;
    }
  }

  static String? vaildateEmailSignUp(String email) {
    if (email.isEmpty) {
      return 'Email is required';
    } else if (!emailRegex.hasMatch(email)) {
      return 'Please enter a valid email address';
    } else {
      return null;
    }
  }

  static String? vaildateNameSignUp(String name) {
    if (name.isEmpty) {
      return 'name is required';
    } else {
      return null;
    }
  }

  static String? vaildatePhoneSignUp(String phone) {
    if (phone.isEmpty) {
      return 'phone is required';
    } else {
      return null;
    }
  }
}
