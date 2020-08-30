import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:yepi/app/locator.dart';
import 'package:yepi/app/router.gr.dart';

class StartupViewModel extends BaseViewModel {
  NavigationService _navigationService = locator<NavigationService>();

  redirctToHome() async {
    await _navigationService.replaceWith(Routes.homeView);
  }

  init() {
    redirctToHome();
  }
}
