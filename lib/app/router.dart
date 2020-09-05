import 'package:auto_route/auto_route_annotations.dart';
import 'package:yepi/ui/views/entry/post_view.dart';
import 'package:yepi/ui/views/home/home_view.dart';
import 'package:yepi/ui/views/login/login_view.dart';
import 'package:yepi/ui/views/mood/mood_view.dart';
import 'package:yepi/ui/views/parent/parent_view.dart';
import 'package:yepi/ui/views/startup/startup_view.dart';

@MaterialAutoRouter(
  routes: <AutoRoute>[
    // initial route is named "/"
    MaterialRoute(page: StartupView, initial: true),
    MaterialRoute(page: HomeView),
    MaterialRoute(page: ParentView),
    MaterialRoute(page: MoodView),
    MaterialRoute(page: PostView),
    MaterialRoute(page: LoginView),
  ],
)
class $Router {}
