abstract class Failure {
  String message;
  Failure({required this.message});
}

class FirebaseAuthFailure extends Failure {
  FirebaseAuthFailure([message = 'Firebase Auth Failure'])
    : super(message: message);
}
