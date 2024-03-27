import 'package:flutter/material.dart';
import 'package:gp_project/provider/provider.dart';
import 'package:gp_project/screens/about_us.dart';
import 'package:gp_project/screens/home/learning_home_screen.dart';
import 'package:gp_project/screens/home/translation_screen.dart';
import 'package:gp_project/screens/learning/numbers_learning_screen.dart';
import 'package:gp_project/screens/learning/sentences_learning_screen.dart';
import 'package:gp_project/screens/learning/words_learning_screen.dart';
import 'package:gp_project/screens/learning/letters_learning_screen.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  Widget returnBody() {
    switch (MyProvider.pageNumber) {
      case 0:
        return const LearningHomeScreen();
      case 1:
        return const TranslationScreen();
      case 2:
        return const AboutUsScreen();
      case 3:
        return const NumbersLearningScreen();
      case 4:
        return const LettersLearningScreen();
      case 5:
        return const WordsLearningScreen();
      case 6:
        return const SentencesLearningScreen();
      // case 7:
      //   return TranslationScreen();
    }
    return const LearningHomeScreen();
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => MyProvider(),
      child: Consumer<MyProvider>(
        builder: (context, myModel, child) {
          return Scaffold(
            backgroundColor: const Color(0xff1E1E1E),
            body: returnBody(),
            bottomNavigationBar: Container(
              width: double.infinity,
              height: 70,
              decoration: const BoxDecoration(
                color: Color(0xFF2A2A2A),
                border: Border(
                  top: BorderSide(
                    width: 3.0,
                    color: Color(0xFFFE00F4),
                  ),
                ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  IconButton(
                      onPressed: () {
                        final p =
                            Provider.of<MyProvider>(context, listen: false);
                        p.changePageNumber(pageNum: 0);
                      },
                      icon: Icon(
                        Icons.menu_book_outlined,
                        color: MyProvider.pageNumber == 0 ||
                                MyProvider.pageNumber == 3 ||
                                MyProvider.pageNumber == 4 ||
                                MyProvider.pageNumber == 5 ||
                                MyProvider.pageNumber == 6
                            ? Colors.purpleAccent
                            : Colors.white,
                        size: 36,
                      )),
                  IconButton(
                      onPressed: () {
                        final p =
                            Provider.of<MyProvider>(context, listen: false);
                        p.changePageNumber(pageNum: 1);
                      },
                      icon: Icon(
                        Icons.video_call,
                        color: MyProvider.pageNumber == 1
                            ? Colors.purpleAccent
                            : Colors.white,
                        size: 36,
                      )),
                  IconButton(
                      onPressed: () {
                        final p =
                            Provider.of<MyProvider>(context, listen: false);
                        p.changePageNumber(pageNum: 2);
                      },
                      icon: Icon(
                        Icons.info_outline,
                        color: MyProvider.pageNumber == 2
                            ? Colors.purpleAccent
                            : Colors.white,
                        size: 36,
                      )),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
