import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:stacked/stacked.dart';
import 'package:yepi/ui/views/startup/startup_viewmodel.dart';

class StartupView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<StartupViewModel>.reactive(
        builder: (context, model, child) => Scaffold(
              body: Center(),
            ),
        viewModelBuilder: () => StartupViewModel(),
        onModelReady: (model) {
          SchedulerBinding.instance
              .addPostFrameCallback((_) => model.navigateToHome());
        });
  }
}
