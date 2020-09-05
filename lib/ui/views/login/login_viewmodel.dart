import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:yepi/app/locator.dart';
import 'package:yepi/app/router.gr.dart';
import 'package:yepi/services/auth_service.dart';

class LoginViewModel extends BaseViewModel {
  final NavigationService _navigationService = locator<NavigationService>();
  final SnackbarService _snackbarService = locator<SnackbarService>();
  final AuthService _authService = locator<AuthService>();

  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();

  TextEditingController get emailController => _emailController;
  TextEditingController get passwordController => _passwordController;

  Future signIn({@required String email, @required String password}) async {
    setBusy(true);

    var result =
        await _authService.loginWithEmail(email: email, password: password);

    if (result is bool) {
      // ignore: unrelated_type_equality_checks
      if (result) {
        setBusy(false);
        navigateToHome();
      } else {
        _snackbarService.showSnackbar(message: "Hello");
      }
    } else {
      _snackbarService.showSnackbar(message: result);
    }

    setBusy(false);
  }

  Future navigateToHome() async {
    await _navigationService.navigateTo(Routes.moodView);
  }

  validateEmail(String email) {
    if (email == null) {
      return "No Email given";
    } else {
      return true;
    }
  }

  validatePassword(String password) {
    if (password == null) {
      return "Please enter password";
    } else {
      return true;
    }
  }
}
