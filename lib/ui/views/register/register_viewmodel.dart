import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:yepi/app/locator.dart';
import 'package:yepi/app/router.gr.dart';
import 'package:yepi/services/auth_service.dart';
import 'package:yepi/ui/views/login/login_view.dart';

class RegisterViewModel extends BaseViewModel {
  final NavigationService _navigationService = locator<NavigationService>();
  final SnackbarService _snackbarService = locator<SnackbarService>();
  final AuthService _authService = locator<AuthService>();

  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  TextEditingController _passwordConfirmController = TextEditingController();
  TextEditingController _nameController = TextEditingController();
  TextEditingController _surnameController = TextEditingController();
  TextEditingController _phoneController = TextEditingController();

  TextEditingController get emailController => _emailController;
  TextEditingController get passwordController => _passwordController;
  TextEditingController get passwordConfirmController =>
      _passwordConfirmController;
  TextEditingController get nameController => _nameController;
  TextEditingController get surnameController => _surnameController;
  TextEditingController get phoneController => _phoneController;

  Future signUp({
    @required String email,
    @required String password,
    @required String confirmPassword,
    @required String name,
    @required String surname,
    @required String phone,
  }) async {
    setBusy(true);
    if (email == "" ||
        password == "" ||
        confirmPassword == "" ||
        name == "" ||
        surname == "" ||
        phone == "") {
      _snackbarService.showSnackbar(message: "Please fill in all fields");
      setBusy(false);
      return;
    }

    if (password != confirmPassword) {
      _snackbarService.showSnackbar(message: "Password does not match");
      setBusy(false);
      return;
    }

    var result = await _authService.signUpWithEmail(
        email: email,
        password: password,
        name: name,
        phone: phone,
        surname: surname);

    if (result is bool) {
      if (result) {
        setBusy(false);
        navigateToHome();
      } else {
        _snackbarService.showSnackbar(
            message: "Sign up failed, please try again");
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

  navigateToSignIn() async {
    await _navigationService.navigateWithTransition(LoginView(),
        transition: 'leftToRight');
  }
}
