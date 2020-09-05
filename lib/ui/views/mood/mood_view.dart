import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:yepi/ui/dumb_widgets/title_widget.dart';
import 'package:yepi/ui/views/mood/mood_viewmodel.dart';

class MoodView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<MoodViewModel>.reactive(
      builder: (context, model, child) => Scaffold(
          backgroundColor: Theme.of(context).backgroundColor,
          body: Center(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TitleWidget(
                    title: "How do you feel?",
                    showProfile: false,
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                    padding: EdgeInsets.all(8),
                    height: 150,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(20)),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        MoodWidget(
                          desc: "Sad",
                          icon: Icon(Icons.sentiment_dissatisfied),
                        ),
                        MoodWidget(
                          desc: "Ok",
                          icon: Icon(Icons.sentiment_neutral),
                        ),
                        MoodWidget(
                          desc: "Happy",
                          icon: Icon(Icons.sentiment_very_satisfied),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Align(
                    alignment: Alignment.centerRight,
                    child: FlatButton(
                      onPressed: () {
                        model.navigateToHome();
                      },
                      child: Text(
                        "Continue",
                        style: TextStyle(color: Colors.white),
                      ),
                      color: Color(0xFF6B8F71),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10)),
                    ),
                  )
                ],
              ),
            ),
          )),
      viewModelBuilder: () => MoodViewModel(),
    );
  }
}

class MoodWidget extends ViewModelWidget<MoodViewModel> {
  final String desc;
  final Icon icon;

  const MoodWidget({
    Key key,
    this.desc,
    this.icon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, MoodViewModel model) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        IconButton(
          iconSize: 60,
          color: Color(0xFF6B8F71).withOpacity(0.3),
          icon: icon,
          onPressed: () {
            model.selectMood(desc);
          },
        ),
        Text(desc)
      ],
    );
  }
}
