class UserCreationState {
  static const initState = 0;
  static const inProgressState = 1;
  static const successState = 2;
  static const errorState = 3;

  var progress = initState;
  var message = '';
}