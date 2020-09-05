import 'package:injectable/injectable.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:yepi/services/auth_service.dart';

@module
abstract class ThirdPartyServicesModule {
  @lazySingleton
  NavigationService get navigationService;
  @lazySingleton
  DialogService get dialogService;
  @lazySingleton
  AuthService get authService;
}
