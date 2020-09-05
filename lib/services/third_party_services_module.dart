import 'package:injectable/injectable.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:yepi/services/auth_service.dart';
import 'package:yepi/services/firestore_service.dart';

@module
abstract class ThirdPartyServicesModule {
  @lazySingleton
  NavigationService get navigationService;
  @lazySingleton
  SnackbarService get snackbarService;
  @lazySingleton
  AuthService get authService;
  @lazySingleton
  FirestoreService get firestoreService;
}
