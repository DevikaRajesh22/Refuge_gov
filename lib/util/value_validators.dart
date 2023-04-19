// Function to validate email format
String? validateEmail(String? value) {
  if (value == null || value.isEmpty) {
    return 'Please enter your email address';
  } else if (!RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$').hasMatch(value)) {
    return 'Please enter a valid email address';
  }
  return null;
}

// Function to validate Indian phone number format
String? validatePhoneNumber(String? value) {
  if (value == null || value.isEmpty) {
    return 'Please enter your phone number';
  } else if (!RegExp(r'^\+?91[6-9]\d{9}$').hasMatch(value)) {
    return 'Please enter a valid Indian phone number';
  }
  return null;
}

// Function to validate password format
String? validatePassword(String? value) {
  if (value == null || value.isEmpty) {
    return 'Please enter a password';
  } else if (!RegExp(
          r'^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[@$!%*?&])[A-Za-z\d@$!%*?&]{8,}$')
      .hasMatch(value)) {
    return 'Password must contain at least 8 characters, including at least one uppercase letter, one lowercase letter, one number, and one special character';
  }
  return null;
}

// Function to validate alphanumeric format
String? validateAlphanumeric(String? value) {
  if (value == null || value.isEmpty) {
    return 'Please enter a value';
  } else if (!RegExp(r'^[a-zA-Z0-9]+$').hasMatch(value)) {
    return 'Value must contain only alphanumeric characters';
  }
  return null;
}

// Function to validate numeric format
String? validateNumeric(String? value) {
  if (value == null || value.isEmpty) {
    return 'Please enter a value';
  } else if (!RegExp(r'^[0-9]+$').hasMatch(value)) {
    return 'Value must contain only numeric characters';
  }
  return null;
}
