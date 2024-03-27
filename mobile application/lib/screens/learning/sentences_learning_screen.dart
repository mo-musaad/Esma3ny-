import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:gp_project/provider/provider.dart';
import 'package:gp_project/shared/constants.dart';
import 'package:provider/provider.dart';

class SentencesLearningScreen extends StatefulWidget {
  const SentencesLearningScreen({Key? key}) : super(key: key);

  @override
  State<SentencesLearningScreen> createState() =>
      _SentencesLearningScreenState();
}

class _SentencesLearningScreenState extends State<SentencesLearningScreen> {
  final CarouselController _carouselController = CarouselController();
  int selectedSentenceIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Consumer<MyProvider>(builder: (context, myModel, child) {
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
                      final p = Provider.of<MyProvider>(context, listen: false);
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
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: const [
                Text(
                  "الجمل",
                  style: TextStyle(fontSize: 20, color: Colors.white),
                )
              ],
            ),
            Expanded(
              flex: 2,
              child: CarouselSlider(
                  carouselController: _carouselController,
                  options: CarouselOptions(
                    aspectRatio: 0.9,
                    viewportFraction: 1,
                    onPageChanged: (index, _) {
                      selectedSentenceIndex = index;
                      setState(() {});
                    },
                  ),
                  items: sentences
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
                                  end: Alignment.bottomCenter)),
                          child: Container(
                            alignment: Alignment.center,
                            margin: const EdgeInsets.all(5),
                            padding: const EdgeInsets.all(10),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(25),
                              color: Colors.white,
                              image: DecorationImage(
                                fit: BoxFit.fitHeight,
                                image: AssetImage(
                                  "assets/gifs/${sentences[selectedSentenceIndex]}.gif",
                                ),
                              ),
                            ),
                          ),
                        ),
                      )
                      .toList()),
            ),
            const SizedBox(height: 15),

            Container(
              height: 100,
              padding: const EdgeInsets.symmetric(horizontal: 5),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                    onTap: () {
                      selectedSentenceIndex--;
                      if (selectedSentenceIndex == 0) {
                        selectedSentenceIndex = sentences.length - 1;
                      }
                      _carouselController.jumpToPage(selectedSentenceIndex);

                      setState(() {});
                    },
                    child: Stack(
                      // crossAxisAlignment: CrossAxisAlignment.center,
                      // mainAxisAlignment: MainAxisAlignment.start,
                      children: const [
                        Text(
                          "  <<<",
                          style: TextStyle(
                              color: Colors.purpleAccent, fontSize: 24),
                        ),
                        Text(
                          "\nالسابق",
                          style: TextStyle(
                              color: Colors.yellow,
                              fontSize: 20,
                              fontWeight: FontWeight.w600),
                        ),
                      ],
                    ),
                  ),
                  Text(
                    sentences[selectedSentenceIndex],
                    style: const TextStyle(
                        fontSize: 24,
                        color: Colors.white,
                        fontWeight: FontWeight.w700),
                  ),
                  GestureDetector(
                    onTap: () {
                      selectedSentenceIndex++;
                      if (selectedSentenceIndex == sentences.length) {
                        selectedSentenceIndex = 0;
                      }
                      _carouselController.jumpToPage(selectedSentenceIndex);

                      setState(() {});
                    },
                    child: Stack(
                      // crossAxisAlignment: CrossAxisAlignment.center,
                      // mainAxisAlignment: MainAxisAlignment.start,
                      children: const [
                        Text(
                          "  >>>",
                          style: TextStyle(
                              color: Colors.purpleAccent, fontSize: 24),
                        ),
                        Text(
                          "\nالقادم",
                          style: TextStyle(
                              color: Colors.yellow,
                              fontSize: 20,
                              fontWeight: FontWeight.w600),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            // Expanded(child: ,),
          ],
        ),
      ));
    });
  }
}
