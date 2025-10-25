class Validators {
  // Gmail validator
  static String? validateGmail(String? value) {
    if (value == null || value.isEmpty) return 'Email is required';
    final gmailRegex = RegExp(r'^[a-zA-Z0-9._%+-]+@gmail\.com$');
    if (!gmailRegex.hasMatch(value)) return 'Enter a valid Gmail address';
    return null;
  }

  // Password validator
  static String? validatePassword(String? value) {
    if (value == null || value.isEmpty) return 'Password is required';
    if (value.length < 7) return 'Password must be at least 7 characters';
    final capital = RegExp(r'[A-Z]');
    final special = RegExp(r'[!@#\$%^&*(),.?":{}|<>]');
    if (!capital.hasMatch(value)) return 'Must contain at least one capital letter';
    if (!special.hasMatch(value)) return 'Must contain at least one special character';
    return null;
  }

  // Username validator
  static String? validateUsername(String? value) {
    if (value == null || value.isEmpty) return 'Username is required';
    if (value.length > 10) return 'Username can’t exceed 10 characters';
    final usernameRegex = RegExp(r'^[a-zA-Z0-9]+$');
    if (!usernameRegex.hasMatch(value)) return 'Only letters and numbers allowed';
    return null;
  }

  // First name validator
  static String? validateFirstName(String? value) {
    if (value == null || value.isEmpty) return 'First name is required';
    final nameRegex = RegExp(r'^[A-Za-z]+$');
    if (!nameRegex.hasMatch(value)) return 'Only letters allowed';
    return null;
  }

  // Last name validator
  static String? validateLastName(String? value) {
    if (value == null || value.isEmpty) return 'Last name is required';
    final nameRegex = RegExp(r'^[A-Za-z]+$');
    if (!nameRegex.hasMatch(value)) return 'Only letters allowed';
    return null;
  }
}
