import 'package:flutter/material.dart';
import 'package:gp_project/provider/provider.dart';
import 'package:gp_project/shared/constants.dart';
import 'package:gp_project/shared/shared_widgets.dart';
import 'package:provider/provider.dart';

class TranslatingHomeScreen extends StatelessWidget {
  const TranslatingHomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<MyProvider>(builder: (context, myModel, child) {
      return SafeArea(
        child: Container(
          decoration: backgroundDecoration,
          padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 25),
          width: double.infinity,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.asset(
                "assets/images/app_logo.png",
                height: 200,
                width: 250,
              ),

              const SizedBox(height: 50),
              homeButton(
                  text: "ترجمة فيديو على الهاتف",
                  icon: Icons.upload,
                  onTap: () {
                    final p = Provider.of<MyProvider>(context, listen: false);
                    p.changePageNumber(pageNum: 7);
                  }),
              const SizedBox(height: 30),
              homeButton(text: "التقاط فيديو", icon: Icons.videocam_outlined),
              // const Spacer(),
            ],
          ),
        ),
      );
    });
  }
}
