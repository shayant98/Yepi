import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:yepi/app/locator.dart';
import 'package:yepi/models/mood_model.dart';
import 'package:yepi/models/user_model.dart';
import 'package:yepi/services/auth_service.dart';
import 'package:yepi/services/firestore_service.dart';
import 'package:yepi/services/local_storage_service.dart';

class HomeViewModel extends FutureViewModel<List<MoodModel>> {
  AuthService _authService = locator<AuthService>();
  FirestoreService _firestoreService = locator<FirestoreService>();
  UserModel _user;
  Map<DateTime, List<dynamic>> moodMap = {};

  UserModel get user => _user;
  CalendarController calendarController = CalendarController();

  init() {
    _user = _authService.currentUser;
  }

  @override
  Future<List<MoodModel>> futureToRun() {
    return _firestoreService.getUserMood(_authService.currentUser.id);
  }

  @override
  void onData(List<MoodModel> data) {
    for (var mood in data) {
      DateTime parsedDate = DateTime.parse(mood.date);
      moodMap[parsedDate] = [mood];
    }
    // TODO: implement onData
    super.onData(data);
  }
}
