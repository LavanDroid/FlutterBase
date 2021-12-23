mixin ValidationMixin {
  //* Validate field is empty
  bool isFieldEmpty(String? input) =>
      input == null || input.toString().trim().isEmpty;

  //* Validate name min and max length
  bool isValidNameInput(String input) {
    String _input = input.trim();
    return (_input.isNotEmpty) && (_input.length > 2) && (_input.length < 12);
  }

  //* Validate string is valid or return empty string
  String validString(String? input) {
    return input == null ||
            isFieldEmpty(input) ||
            input.toString().trim().toLowerCase() == 'null'
        ? ''
        : input.toString().trim();
  }

  //* ValidateEmail
  String? validateEmail(String email) {
    final RegExp regex = RegExp(
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)| (\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$');

    if (isFieldEmpty(email)) {
      return 'Enter an email';
    } else if (!regex.hasMatch(email) || email.toLowerCase().endsWith('.web')) {
      return 'Enter a valid email';
    } else {
      return null;
    }
  }

  //* ValidatePassword
  String? validatePassword(String pwd) {
    /* 
    r'^
    (?=.*[A-Z])       // should contain at least one upper case
    (?=.*[a-z])       // should contain at least one lower case
    (?=.*?[0-9])          // should contain at least one digit
    (?=.*?[!@#\$&*~]).{8,}  // should contain at least one Special character
    {8,25}      // min-8 max-25
    $ 
     */
    final RegExp regex = RegExp(
        r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,25}$');

    if (pwd.isEmpty) {
      return 'Enter a password';
    } else if (!regex.hasMatch(pwd)) {
      return 'Enter a valid password';
    } else {
      return null;
    }
  }

  //* ValidateMobile
  String? validateMobile(String mobile) {
    final RegExp regex = RegExp(r'(^(?:[+0]9)?[0-9]{10,12}$)');

    if (mobile.isEmpty) {
      return 'Enter mobile number';
    } else if (!regex.hasMatch(mobile)) {
      return 'Enter a mobile number';
    } else {
      return null;
    }
  }
}
