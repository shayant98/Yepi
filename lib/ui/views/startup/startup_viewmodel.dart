import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:yepi/app/locator.dart';
import 'package:yepi/app/router.gr.dart';
import 'package:yepi/services/auth_service.dart';
import 'package:yepi/services/local_storage_service.dart';
import 'package:yepi/utils/date_util.dart';

class StartupViewModel extends BaseViewModel {
  final NavigationService _navigationService = locator<NavigationService>();
  final AuthService _authService = locator<AuthService>();
  final LocalStorage _localStorage = locator<LocalStorage>();

  Future handleStartupLogic() async {
    bool hasLoggedInUser = await _authService.isUserLoggedIn();

    if (hasLoggedInUser) {
      if (_localStorage.getValue("todayMood") ==
          new DateUtil().getTodayDate()) {
        await _navigationService.replaceWith(Routes.parentView);
      } else {
        await _navigationService.replaceWith(Routes.moodView);
      }
    } else {
      await _navigationService.replaceWith(Routes.loginView);
    }
  }
}
