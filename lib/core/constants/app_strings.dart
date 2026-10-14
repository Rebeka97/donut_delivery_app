abstract final class AppStrings {
  static const String appTitle = 'Donut Delivery';
  static const String brandName = 'DONUTS';

  static const String signIn = 'Sign In';
  static const String signUp = 'Sign Up';
  static const String email = 'Email';
  static const String password = 'Password';
  static const String name = 'Name';

  static const String requiredField = 'Please fill in this field';
  static const String invalidEmail = 'Please enter a valid email';
  static const String invalidPassword = 'Please enter a valid password';
  static const String nameTooLong = 'Name too long';
  static const String invalidCredentials = 'Invalid email or password';
  static const String genericError = 'An error occurred...';

  static const String ruleUppercase = '⚈  1 uppercase';
  static const String ruleLowercase = '⚈  1 lowercase';
  static const String ruleNumber = '⚈  1 number';
  static const String ruleSpecialChar = '⚈  1 special character';
  static const String ruleMinLength = '⚈  8 minimum character';

  static const String filled = 'Filled';
  static const String notFilled = 'Not Filled';
  static const String glazed = 'Glazed';
  static const String notGlazed = 'Not Glazed';
  static const String close = 'Close';
  static const String buyNow = 'Buy Now';

  static const String calories = 'Calories';
  static const String protein = 'Protein';
  static const String carbs = 'Carbs';
  static const String fat = 'Fat';
  static const String notAvailable = 'N/A';

  static String price(double value) => '\$${value.toStringAsFixed(2)}';
}
