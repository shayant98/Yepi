import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:yepi/ui/dumb_widgets/flat_button_widget.dart';
import 'package:yepi/ui/dumb_widgets/input_field.dart';
import 'package:yepi/ui/dumb_widgets/title_widget.dart';
import 'package:yepi/ui/views/entry/post_viewmodel.dart';

class PostView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<PostViewModel>.reactive(
      builder: (context, model, child) => Scaffold(
          backgroundColor: Theme.of(context).backgroundColor,
          appBar: AppBar(
            backgroundColor: Colors.transparent,
            elevation: 0,
            iconTheme: IconThemeData(
              color: Color(0xFF2E4057),
            ),
          ),
          body: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                children: [
                  TitleWidget(
                    title: "Add an entry",
                  ),
                  Form(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: 20,
                        ),
                        Text("Message"),
                        SizedBox(
                          height: 5,
                        ),
                        InputFieldWidget(
                          label: "Title",
                          inputType: TextInputType.text,
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text("Message"),
                        SizedBox(
                          height: 5,
                        ),
                        InputFieldWidget(
                          label: "Message",
                          inputType: TextInputType.multiline,
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Row(
                          children: [
                            Switch(
                              value: false,
                              onChanged: (value) {},
                            ),
                            Text("Public"),
                          ],
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Align(
                          alignment: Alignment.centerRight,
                          child: Hero(
                            tag: 'add-post',
                            child: FlatButtonWidget(
                              title: "Add",
                              onPressed: model.addPost,
                            ),
                          ),
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
          )),
      viewModelBuilder: () => PostViewModel(),
    );
  }
}
