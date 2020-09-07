import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:yepi/app/locator.dart';
import 'package:yepi/app/router.gr.dart';
import 'package:yepi/services/auth_service.dart';

class ParentViewModel extends IndexTrackingViewModel {
  NavigationService _navigationService = locator<NavigationService>();
  AuthService _authService = locator<AuthService>();

  navigateToPostPage() async {
    await _navigationService.navigateTo(Routes.postView);
  }

  logOut() async {
    await _authService.logOut();
    await _navigationService.replaceWith(Routes.loginView);
  }
}
