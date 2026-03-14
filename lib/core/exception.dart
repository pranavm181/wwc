class SignUpWithEmailAndPasswordFaliure {
  final String message;
  SignUpWithEmailAndPasswordFaliure(
      [this.message = "An Ukone error occurred "]);
  factory SignUpWithEmailAndPasswordFaliure.code(String code) {
    switch (code) {
      case 'weak-password':
        return SignUpWithEmailAndPasswordFaliure(
            'Please ender a strong password');
      case 'invalid-email':
        return SignUpWithEmailAndPasswordFaliure(
            'The email address is invalid.');
      case 'email-already-in-use':
        return SignUpWithEmailAndPasswordFaliure(
            'An account already exists for that email');
      case 'operation-not-allowed':
        return SignUpWithEmailAndPasswordFaliure(
            'Operation is not allowed.Please contact support.');

      case 'user-disabled':
        return SignUpWithEmailAndPasswordFaliure(
            'This user has been disabled. please contact support for help');
      default:
        return SignUpWithEmailAndPasswordFaliure();
    }
  }
}
