import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:yepi/app/locator.dart';
import 'package:yepi/app/router.gr.dart';

class PostViewModel extends BaseViewModel {
  final NavigationService _navigationService = locator<NavigationService>();

  Future navigateToHome() async {
    await _navigationService.replaceWith(Routes.moodView);
  }

  addPost() {}
}
