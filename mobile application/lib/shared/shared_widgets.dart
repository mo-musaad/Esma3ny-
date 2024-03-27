import 'package:flutter/material.dart';

Widget memberName({required String memberName}) {
  return Container(
    height: 230,
    decoration: BoxDecoration(
      gradient: const LinearGradient(
        colors: [
          Color(0xFF00FFE0),
          Color(0xFF000000),
          Color(0x00000000),
          Color(0x00000000),
        ],
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
      ),
      border: Border.all(
        width: 3.0,
        style: BorderStyle.solid,
        // Define a linear gradient for the border color
        color: Colors.transparent,
        // Use transparent color for the border color
        // so that the gradient shows through
      ),
      // image: DecorationImage(
      //     image: AssetImage("assets/images/أ.png"),
      //     fit: BoxFit.fitHeight),
    ),
    child: Column(
      children: [
        Image.asset(
          "assets/images/team_members_images/$memberName.png",
          height: 170,
          width: 150,
          fit: BoxFit.fitWidth,
        ),
        const SizedBox(height: 10),
        Container(
          width: 150,
          alignment: Alignment.centerRight,
          padding: const EdgeInsets.only(right: 4),
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [Color(0xFFFF00F5), Color(0x00000000)],
              begin: Alignment.centerRight,
              end: Alignment.centerLeft,
            ),
          ),
          child: Text(
            memberName,
            style: const TextStyle(fontSize: 16, color: Colors.white),
          ),
        )
      ],
    ),
  );
}

Widget lettersWidget({required int index, required String letter}) {
  return Container(
    height: 265,
    decoration: BoxDecoration(
      gradient: LinearGradient(
          colors: const [
            Color(0xffFFD600),
            Color(0x00000000),
          ],
          begin: index % 2 == 0 ? Alignment.topRight : Alignment.topLeft,
          end: index % 2 == 0 ? Alignment.topLeft : Alignment.topRight),
      borderRadius: BorderRadius.circular(25),

      border: Border.all(
        width: 2.0,
        style: BorderStyle.solid,
        // Define a linear gradient for the border color
        color: Colors.transparent,
        // Use transparent color for the border color
        // so that the gradient shows through
      ),
      // image: DecorationImage(
      //     image: AssetImage("assets/images/أ.png"),
      //     fit: BoxFit.fitHeight),
    ),
    child: Container(
      height: 260,
      decoration: BoxDecoration(
          color: const Color(0xff2A2A2A),
          borderRadius: BorderRadius.circular(25)),
      child: Column(
        children: [
          Container(
            height: 190,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(25),
                image: DecorationImage(
                    image: AssetImage(
                      "assets/images/$letter.png",
                    ),
                    fit: BoxFit.fitWidth)),
          ),
          const SizedBox(height: 10),
          Container(
            alignment: Alignment.center,
            // padding: const EdgeInsets.only(right: 4),
            decoration: const BoxDecoration(),
            child: Text(
              letter,
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
}

Widget homeButton(
    {required String text, required IconData icon, void Function()? onTap}) {
  return GestureDetector(
    onTap: onTap,
    child: Container(
      height: 105,
      // width: 320,
      alignment: Alignment.center,
      padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.lightGreenAccent, width: 3),
        borderRadius: BorderRadius.circular(25),
        color: const Color(0xff27272F),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Text(
            text,
            textAlign: TextAlign.center,
            style: const TextStyle(
                fontSize: 24, fontWeight: FontWeight.w700, color: Colors.white),
          ),
          Icon(
            icon,
            size: 50,
            color: Colors.white,
          ),
        ],
      ),
    ),
  );
}

Widget learningTopicButton({
  required int index,
  required String text,
  void Function()? onTap,
}) {
  AlignmentGeometry begin;
  AlignmentGeometry end;
  if (index == 0 || index == 3) {
    begin = Alignment.bottomCenter;
    end = Alignment.topCenter;
  } else {
    begin = Alignment.topCenter;
    end = Alignment.bottomCenter;
  }
  return GestureDetector(
    onTap: onTap,
    child: Container(
      height: 220,
      width: 150,
      decoration: BoxDecoration(
        gradient: LinearGradient(colors: const [
          Color(0xffFFD600),
          Color(0x00000000),
        ], begin: begin, end: end),
        borderRadius: BorderRadius.circular(25),
        border: Border.all(
          width: 2.0,
          style: BorderStyle.solid,
          color: Colors.transparent,
        ),
      ),
      child: Container(
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: Colors.black,
          borderRadius: BorderRadius.circular(25),
        ),
        child: Text(
          text,
          style: const TextStyle(fontSize: 40, color: Colors.white),
        ),
      ),
    ),
  );
}
