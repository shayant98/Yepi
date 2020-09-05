import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:yepi/app/locator.dart';
import 'package:yepi/app/router.gr.dart';

class ParentViewModel extends IndexTrackingViewModel {
  NavigationService _navigationService = locator<NavigationService>();

  navigateToPostPage() async {
    await _navigationService.navigateTo(Routes.postView);
  }
}
