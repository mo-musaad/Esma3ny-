import 'package:flutter/material.dart';
import 'package:gp_project/provider/provider.dart';
import 'package:gp_project/shared/constants.dart';
import 'package:gp_project/shared/shared_widgets.dart';
import 'package:provider/provider.dart';

class LearningHomeScreen extends StatefulWidget {
  const LearningHomeScreen({Key? key}) : super(key: key);

  @override
  State<LearningHomeScreen> createState() => _LearningHomeScreenState();
}

class _LearningHomeScreenState extends State<LearningHomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Consumer<MyProvider>(builder: (context, myModel, child) {
      return SafeArea(
        child: Container(
            decoration: backgroundDecoration,
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Image.asset(
                  "assets/images/app_logo.png",
                  height: 200,
                  width: 250,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    learningTopicButton(
                        index: 0,
                        text: "الارقــام",
                        onTap: () {
                          final p =
                              Provider.of<MyProvider>(context, listen: false);
                          p.changePageNumber(pageNum: 3);
                        }),
                    learningTopicButton(
                        index: 1,
                        text: "الحروف",
                        onTap: () {
                          final p =
                              Provider.of<MyProvider>(context, listen: false);
                          p.changePageNumber(pageNum: 4);
                        }),
                  ],
                ),
                const Spacer(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    learningTopicButton(
                        index: 2,
                        text: "الكلمات",
                        onTap: () {
                          final p =
                              Provider.of<MyProvider>(context, listen: false);
                          p.changePageNumber(pageNum: 5);
                        }),
                    learningTopicButton(
                        index: 3,
                        text: "الجمل",
                        onTap: () {
                          final p =
                              Provider.of<MyProvider>(context, listen: false);
                          p.changePageNumber(pageNum: 6);
                        }),
                  ],
                ),
              ],
            )),
      );
    });
  }
}
