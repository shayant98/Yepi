import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:yepi/app/locator.dart';
import 'package:yepi/app/router.gr.dart';
import 'package:yepi/services/local_storage_service.dart';
import 'package:yepi/utils/date_util.dart';

class MoodViewModel extends BaseViewModel {
  final NavigationService _navigationService = locator<NavigationService>();
  final LocalStorage _localStorage = locator<LocalStorage>();

  bool _showButton = false;
  bool get showButton => showButton;

  Future navigateToHome() async {
    await _localStorage.setValue(
        value: new DateUtil().getTodayDate(), key: 'todayMood');
    await _navigationService.replaceWith(Routes.parentView);
  }

  void selectMood(String desc) {
    switch (desc) {
      case "Happy":
        break;
      case "Ok":
        break;
      case "Sad":
        break;
      default:
    }
  }
}
