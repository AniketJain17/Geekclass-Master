import 'dart:ui';

import 'package:geeclass/data/model/subject.dart';
import 'package:geeclass/ui/theme/app_color.dart';

final List<Subject> subjects = [
  Subject(
    id: 1,
    slug: "Automata",
    name: "FLAT",
    desc: "Become a proficient FLAT",
    lecturer: " Prof. Sagrika Gosh",
    image: "assets/images/digital_arts.png",
    gradient: [
      const Color.fromARGB(255, 161, 124, 236),
      AppColor.purpleGradientEnd
    ],
  ),
  Subject(
    id: 2,
    slug: "JAVA",
    name: "OOPS IN JAVA",
    desc: "Learning Java Programming",
    lecturer: "Prof. G. Uma Devi",
    image: "assets/images/network_security.png",
    gradient: [
      const Color.fromARGB(255, 53, 199, 228),
      AppColor.cyanGradientEnd
    ],
  ),
  Subject(
    id: 3,
    slug: "DBMS",
    name: "DBMS ",
    desc: "Learing data base ",
    lecturer: "Prof. Jyoti Anand",
    image: "assets/images/finance.png",
    gradient: [AppColor.orangeGradientStart, AppColor.orangeGradientEnd],
  ),
  Subject(
    id: 4,
    slug: "GSC ",
    name: "ESP-SDP",
    desc: "Apptitude",
    lecturer: "Prof. Yash Yadav",
    image: "assets/images/mobile_dev.png",
    gradient: [AppColor.pinkGradientStart, AppColor.pinkGradientEnd],
  ),
  Subject(
    id: 5,
    slug: "Big data",
    name: "Big Data ",
    desc: "Big data",
    lecturer: "Prof. Jyoti khandelwal",
    image: "assets/images/digital_arts.png",
    gradient: [AppColor.purpleGradientStart, AppColor.purpleGradientEnd],
  ),
  Subject(
    id: 6,
    slug: "Managment",
    name: "Management",
    desc: "Management",
    lecturer: "Prof. KVK",
    image: "assets/images/network_security.png",
    gradient: [AppColor.cyanGradientStart, AppColor.cyanGradientEnd],
  ),
  Subject(
    id: 7,
    slug: "Software Engg",
    name: "Software Engg",
    desc: "",
    lecturer: "Prof. Subrat Gautam",
    image: "assets/images/finance.png",
    gradient: [AppColor.orangeGradientStart, AppColor.orangeGradientEnd],
  ),
  Subject(
    id: 8,
    slug: "AIML",
    name: "AI-ML",
    desc: "Prolog ",
    lecturer: "Prof. Rupayan Das",
    image: "assets/images/mobile_dev.png",
    gradient: [AppColor.pinkGradientStart, AppColor.pinkGradientEnd],
  ),
];
