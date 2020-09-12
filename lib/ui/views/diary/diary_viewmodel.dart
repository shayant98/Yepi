import 'package:stacked/stacked.dart';
import 'package:yepi/app/locator.dart';
import 'package:yepi/models/post_model.dart';
import 'package:yepi/services/auth_service.dart';
import 'package:yepi/services/firestore_service.dart';

class DiaryViewModel extends FutureViewModel<List<PostModel>> {
  FirestoreService _firestoreService = locator<FirestoreService>();
  AuthService _authService = locator<AuthService>();

  @override
  Future<List<PostModel>> futureToRun() {
    return _firestoreService.getUserPrivatePosts(_authService.currentUser.id);
  }

  @override
  void onData(List<PostModel> data) {
    print(data);
    super.onData(data);
  }

  @override
  void onError(error) {
    super.onError(error);
  }

  @override
  void onFutureError(error, Object key) {
    print(error);
    super.onFutureError(error, key);
  }
}
