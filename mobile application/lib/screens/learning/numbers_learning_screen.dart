import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:gp_project/provider/provider.dart';
import 'package:gp_project/shared/constants.dart';
import 'package:provider/provider.dart';

class NumbersLearningScreen extends StatefulWidget {
  const NumbersLearningScreen({Key? key}) : super(key: key);

  @override
  State<NumbersLearningScreen> createState() => _NumbersLearningScreenState();
}

class _NumbersLearningScreenState extends State<NumbersLearningScreen> {
  final CarouselController _carouselController = CarouselController();

  int selectedNumber = 0;

  @override
  Widget build(BuildContext context) {
    return Consumer<MyProvider>(
      builder: (context, myModel, child) {
        return SafeArea(
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
            decoration: backgroundDecoration,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                      width: 100,
                      height: 100,
                    )
                  ],
                ),
                const SizedBox(height: 15),
                Expanded(
                  flex: 2,
                  child: CarouselSlider(
                      carouselController: _carouselController,
                      options: CarouselOptions(
                        aspectRatio: 0.9,
                        viewportFraction: 1,
                        onPageChanged: (index, _) {
                          print(index);
                          selectedNumber = index;
                          setState(() {});
                        },
                      ),
                      items: numbers
                          .map(
                            (e) => Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(25),
                                gradient: const LinearGradient(
                                  colors: [
                                    Color(0xffFF00F5),
                                    Color(0xff000000),
                                    Color(0xff2B2A2C),
                                  ],
                                  begin: Alignment.topCenter,
                                  end: Alignment.bottomCenter,
                                ),
                              ),
                              child: Container(
                                alignment: Alignment.center,
                                margin: const EdgeInsets.all(5),
                                padding: const EdgeInsets.all(10),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(25),
                                  color: const Color(0xff2A2A2A),
                                  image: DecorationImage(
                                    fit: BoxFit.contain,
                                    image: AssetImage(
                                      "assets/images/${numbers[selectedNumber]}.png",
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          )
                          .toList()),
                ),
                const SizedBox(height: 15),
                SizedBox(
                  height: 150,
                  child: GridView(
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 5,
                      childAspectRatio: 1.1,
                      mainAxisSpacing: 10,
                    ),
                    children: [
                      ...Iterable<int>.generate(numbers.length).map(
                        (int pageIndex) => Padding(
                          padding: const EdgeInsets.all(2.0),
                          child: Container(
                            decoration: const BoxDecoration(
                              shape: BoxShape.circle,
                              gradient: LinearGradient(
                                  colors: [
                                    Color(0xffFF00F5),
                                    Color(0xff000000),
                                    Color(0xff2B2A2C),
                                  ],
                                  begin: Alignment.topCenter,
                                  end: Alignment.bottomCenter),
                            ),
                            child: Container(
                              margin: const EdgeInsets.all(3),
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: selectedNumber == pageIndex
                                    ? const Color(0xffFF00F5)
                                    : const Color(0xff2A2A2A),
                              ),
                              child: TextButton(
                                onPressed: () {
                                  selectedNumber = pageIndex;
                                  _carouselController
                                      .jumpToPage(selectedNumber);

                                  setState(() {});
                                  // widget._controller.animateToPage(pageIndex,
                                  //     duration: const Duration(milliseconds: 300),
                                  //     curve: Curves.ease);
                                },
                                child: Text(
                                  numbers[pageIndex],
                                  style: const TextStyle(
                                    fontWeight: FontWeight.w700,
                                    fontSize: 24,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
