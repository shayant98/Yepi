import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:yepi/app/locator.dart';
import 'package:yepi/app/router.gr.dart';
import 'package:yepi/services/auth_service.dart';

class StartupViewModel extends BaseViewModel {
  final NavigationService _navigationService = locator<NavigationService>();
  final AuthService _authService = locator<AuthService>();

  Future navigateToHome() async {
    await _navigationService.replaceWith(Routes.parentView);
  }

  Future navigateToLogin() async {
    await _navigationService.replaceWith(Routes.loginView);
  }

  Future navigateToMood() async {
    await _navigationService.replaceWith(Routes.moodView);
  }

  Future handleStartupLogic() async {
    bool hasLoggedInUser = await _authService.isUserLoggedIn();

    if (hasLoggedInUser) {
      navigateToHome();
    } else {
      navigateToLogin();
    }
  }
}
