import 'package:flutter/material.dart';
import 'package:gp_project/provider/provider.dart';
import 'package:gp_project/shared/constants.dart';
import 'package:gp_project/shared/shared_widgets.dart';
import 'package:provider/provider.dart';

class LettersLearningScreen extends StatefulWidget {
  const LettersLearningScreen({Key? key}) : super(key: key);

  @override
  State<LettersLearningScreen> createState() => _LettersLearningScreenState();
}

class _LettersLearningScreenState extends State<LettersLearningScreen> {
  bool isGrid = true;
  bool isSorted = true;
  List<String> usedLetters = letters;

  @override
  Widget build(BuildContext context) {
    return Consumer<MyProvider>(builder: (context, myModel, child) {
      return SafeArea(
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
          decoration: backgroundDecoration,
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  IconButton(
                      onPressed: () {
                        final p =
                            Provider.of<MyProvider>(context, listen: false);
                        p.changePageNumber(pageNum: 0);
                      },
                      icon: const Icon(
                        Icons.arrow_back_ios,
                        size: 30,
                        color: Colors.white,
                      )),
                  Image.asset(
                    "assets/images/app_logo.png",
                    height: 100,
                    width: 100,
                  ),
                ],
              ),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      IconButton(
                          onPressed: () {
                            setState(() {
                              isGrid = false;
                            });
                          },
                          icon: const Icon(
                            Icons.menu,
                            color: Colors.yellow,
                            size: 30,
                          )),
                      IconButton(
                        onPressed: () {
                          setState(
                            () {
                              isGrid = true;
                            },
                          );
                        },
                        icon: const Icon(
                          Icons.grid_view,
                          color: Colors.purple,
                          size: 30,
                        ),
                      )
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      const Text(
                        "الترتيب من اعلي الي اسفل",
                        style: TextStyle(color: Colors.white, fontSize: 18),
                      ),
                      Checkbox(
                        value: isSorted,
                        onChanged: (bool? value) {
                          setState(
                            () {
                              isSorted = !isSorted;
                              usedLetters = usedLetters.reversed.toList();
                              // print(usedLetters);
                            },
                          );
                        },
                        fillColor: MaterialStateProperty.resolveWith<Color>(
                            (Set<MaterialState> states) {
                          if (states.contains(MaterialState.focused)) {
                            return Colors.blue.shade100;
                          } else if (states.contains(MaterialState.disabled)) {
                            return Colors.grey.shade300;
                          }
                          return Colors.yellow;
                        }),
                      ),
                    ],
                  )
                ],
              ),
              const SizedBox(height: 20),
              Expanded(
                child: isGrid
                    ? GridView.builder(
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 2,
                                mainAxisSpacing: 30,
                                crossAxisSpacing: 20,
                                childAspectRatio: 0.6),
                        itemCount: usedLetters.length,
                        itemBuilder: (BuildContext context, int index) {
                          return lettersWidget(
                              index: index, letter: usedLetters[index]);
                        })
                    : ListView.separated(
                        itemBuilder: (BuildContext context, int index) {
                          return Container(
                            width: MediaQuery.of(context).size.width,
                            decoration: BoxDecoration(
                              gradient: const LinearGradient(
                                  colors: [
                                    Color(0xffFFD600),
                                    Color(0x00000000),
                                  ],
                                  begin: Alignment.topRight,
                                  end: Alignment.topLeft),
                              borderRadius: const BorderRadius.only(
                                topRight: Radius.circular(25.0),
                                bottomRight: Radius.circular(25.0),
                              ),
                              border: Border.all(
                                width: 1.5,
                                style: BorderStyle.solid,
                                color: Colors.transparent,
                              ),
                              // image: DecorationImage(
                              //     image: AssetImage("assets/images/أ.png"),
                              //     fit: BoxFit.fitHeight),
                            ),
                            child: Container(
                              height: 80,
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 10),
                              decoration: const BoxDecoration(
                                color: Color(0xff2A2A2A),
                                borderRadius: BorderRadius.only(
                                  topRight: Radius.circular(25.0),
                                  bottomRight: Radius.circular(25.0),
                                ),
                              ),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Image.asset(
                                    "assets/images/${usedLetters[index]}.png",
                                    height: 75,
                                  ),
                                  const SizedBox(height: 10),
                                  Container(
                                    alignment: Alignment.center,
                                    padding: const EdgeInsets.only(right: 10),
                                    decoration: const BoxDecoration(),
                                    child: Text(
                                      usedLetters[index],
                                      style: const TextStyle(
                                          fontSize: 36,
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  )
                                ],
                              ),
                            ),
                          );
                        },
                        separatorBuilder: (BuildContext context, int index) {
                          return const SizedBox(height: 15);
                        },
                        itemCount: usedLetters.length),
              )
            ],
          ),
        ),
      );
    });
  }
}
