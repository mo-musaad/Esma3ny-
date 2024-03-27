import 'package:flutter/material.dart';

// 0: learning home screen
// 1: translating home screen
// 2: about us
// 3: numbers learning screen
// 4: letters learning screen
// 5: words learning screen
// 6: sentences learning screen
// 7: online translating screen

BoxDecoration backgroundDecoration = const BoxDecoration(
  gradient: LinearGradient(
    colors: [
      Color(0xFF000013),
      // Color(0xFF261D5C),
      Color(0xFF0E092A),
    ],
    begin: Alignment.centerLeft,
    end: Alignment.centerRight,
  ),
);

EdgeInsets screensDefaultPadding =
    const EdgeInsets.symmetric(vertical: 20, horizontal: 30);
final List<String> numbers = ["0", "1", "2", "3", "4", "5", "6", "7", "8", "9"];

final List<String> letters = [
  "أ",
  "ب",
  "ت",
  "ث",
  "ج",
  "ح",
  "خ",
  "د",
  "ذ",
  "ر",
  "ز",
  "س",
  "ش",
  "ص",
  "ض",
  "ط",
  "ظ",
  "ع",
  "غ",
  "ف",
  "ق",
  "ك",
  "ل",
  "م",
  "ن",
  "ه",
  "و",
  "ى"
];

final List<String> words = [
  "أحبك",

  "أضحكتنى",
  "حقا احبك",
  "لست متأكد",
  "مرحبا",
  "أنا اراقبك",
  "هذا رهيب",
  "اقتباس",
  "سؤال",
  // "هذا ممتاز",
  // "لا",
  // "انت",
  // "موافق",
  // "عمل جيد",
  // "لست متأكد",
];

List<String> sentences = [
  "اسرة",
  "اسمك ايه",
  "الحمد لله",
  "السلام عليكم",
  "بكام فلوس",
  "مستشفي",
];
