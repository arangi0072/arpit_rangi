import 'package:arpit_rangi/education.dart';
import 'package:arpit_rangi/projects.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:url_launcher/url_launcher.dart';

import 'connect.dart';
import 'main.dart';

class MyAboutPage extends StatefulWidget {
  const MyAboutPage({super.key});

  @override
  State<MyAboutPage> createState() => _MyAboutPageState();
}

class _MyAboutPageState extends State<MyAboutPage> {
  bool isHoveredTwitter = false;
  bool isHoveredLinkedIn = false;
  bool isHoveredGitHub = false;
  bool box1 = false;
  bool box2 = false;
  bool box3 = false;
  bool box4 = false;
  bool box5 = false;

  @override
  Widget build(BuildContext context) {
    bool height = MediaQuery.of(context).size.width <= 600;
    return Scaffold(
      body: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: height ? SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  InkWell(
                    onTap: () {
                      Navigator.pushAndRemoveUntil(
                        context,
                        MaterialPageRoute(builder: (context) => const MyHomePage(title: 'Home',)),
                            (route) => false,
                      );
                    },
                    child: const Text(
                      "Arpit Rangi",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  Row(
                    children: [
                      TextButton(
                          onPressed: () {},
                          child: const Text("About",
                              style: TextStyle(
                                  color: Color.fromRGBO(225, 225, 225, 1.0),
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold))),
                      TextButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const MyEducationPage()),
                            );
                          },
                          child: const Text("Education",
                              style: TextStyle(
                                  color: Colors.grey,
                                  fontSize: 18))),
                      TextButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const MyProjectsPage()),
                            );
                          },
                          child: const Text("Projects",
                              style: TextStyle(
                                  color: Colors.grey,
                                  fontSize: 18))),
                      TextButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const MyConnectPage()),
                            );
                          },
                          child: const Text("Connect",
                              style: TextStyle(
                                  color: Colors.grey,
                                  fontSize: 18))),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 8.0),
                    child: Row(
                      children: [
                        MouseRegion(
                          onEnter: (_) => setState(() => isHoveredTwitter = true),
                          onExit: (_) => setState(() => isHoveredTwitter = false),
                          child: AnimatedContainer(
                            duration: const Duration(milliseconds: 300),
                            decoration: BoxDecoration(
                              boxShadow: isHoveredTwitter
                                  ? [
                                      BoxShadow(
                                        color: Colors.grey.withOpacity(0.5),
                                        spreadRadius: 5,
                                        blurRadius: 7,
                                        offset: const Offset(0, 3),
                                      ),
                                    ]
                                  : [],
                            ),
                            child: InkWell(
                              onTap: () {
                                final Uri uri =
                                    Uri.parse("https://x.com/arpit_rangi");
                                launchUrl(uri);
                              },
                              child: SizedBox(
                                width: 18,
                                height: 18,
                                child: Image.network(
                                  "https://firebasestorage.googleapis.com/v0/b/arpit-rangi.appspot.com/o/x.png?alt=media&token=2743e138-4899-43bf-8375-0784e0401087",
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(width: 16),
                        MouseRegion(
                          onEnter: (_) =>
                              setState(() => isHoveredLinkedIn = true),
                          onExit: (_) =>
                              setState(() => isHoveredLinkedIn = false),
                          child: AnimatedContainer(
                            duration: const Duration(milliseconds: 300),
                            decoration: BoxDecoration(
                              boxShadow: isHoveredLinkedIn
                                  ? [
                                      BoxShadow(
                                        color: Colors.grey.withOpacity(0.5),
                                        spreadRadius: 5,
                                        blurRadius: 7,
                                        offset: const Offset(0, 3),
                                      ),
                                    ]
                                  : [],
                            ),
                            child: InkWell(
                              onTap: () {
                                final Uri uri = Uri.parse(
                                    "https://www.linkedin.com/in/arpit-rangi-37957428b/");
                                launchUrl(uri);
                              },
                              child: SizedBox(
                                width: 18,
                                height: 18,
                                child: Image.network(
                                  "https://firebasestorage.googleapis.com/v0/b/arpit-rangi.appspot.com/o/linkedin.png?alt=media&token=1be5a9ba-974f-43ca-ba84-427874a21170",
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(width: 16),
                        MouseRegion(
                          onEnter: (_) => setState(() => isHoveredGitHub = true),
                          onExit: (_) => setState(() => isHoveredGitHub = false),
                          child: AnimatedContainer(
                            duration: const Duration(milliseconds: 300),
                            decoration: BoxDecoration(
                              boxShadow: isHoveredGitHub
                                  ? [
                                      BoxShadow(
                                        color: Colors.grey.withOpacity(0.5),
                                        spreadRadius: 5,
                                        blurRadius: 7,
                                        offset: const Offset(0, 3),
                                      ),
                                    ]
                                  : [],
                            ),
                            child: InkWell(
                              onTap: () {
                                final Uri uri =
                                    Uri.parse("https://github.com/arangi0072");
                                launchUrl(uri);
                              },
                              child: SizedBox(
                                width: 18,
                                height: 18,
                                child: Image.network(
                                  "https://firebasestorage.googleapis.com/v0/b/arpit-rangi.appspot.com/o/github.png?alt=media&token=be6b3b8b-cca6-4b48-bc2a-ea3f556d9f8e",
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ): Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                InkWell(
                  onTap: () {
                    Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(builder: (context) => const MyHomePage(title: 'Home',)),
                          (route) => false,
                    );
                  },
                  child: const Text(
                    "Arpit Rangi",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                Row(
                  children: [
                    TextButton(
                        onPressed: () {

                        },
                        child: const Text("About",
                            style: TextStyle(
                                color: Color.fromRGBO(225, 225, 225, 1.0),
                                fontSize: 20,
                                fontWeight: FontWeight.bold))),
                    TextButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const MyEducationPage()),
                          );
                        },
                        child: const Text("Education",
                            style: TextStyle(
                                color: Colors.grey,
                                fontSize: 18))),
                    TextButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const MyProjectsPage()),
                          );
                        },
                        child: const Text("Projects",
                            style: TextStyle(
                                color: Colors.grey,
                                fontSize: 18))),
                    TextButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const MyConnectPage()),
                          );
                        },
                        child: const Text("Connect",
                            style: TextStyle(
                                color: Colors.grey,
                                fontSize: 18))),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 8.0),
                  child: Row(
                    children: [
                      MouseRegion(
                        onEnter: (_) => setState(() => isHoveredTwitter = true),
                        onExit: (_) => setState(() => isHoveredTwitter = false),
                        child: AnimatedContainer(
                          duration: const Duration(milliseconds: 300),
                          decoration: BoxDecoration(
                            borderRadius: const BorderRadius.all(Radius.circular(100)),
                            boxShadow: isHoveredTwitter
                                ? [
                              BoxShadow(
                                color: Colors.grey.withOpacity(0.5),
                                spreadRadius: 5,
                                blurRadius: 7,
                                offset: const Offset(0, 0),
                              ),
                            ]
                                : [],
                          ),
                          child: InkWell(
                            onTap: () {
                              final Uri uri =
                              Uri.parse("https://x.com/arpit_rangi");
                              launchUrl(uri);
                            },
                          child: CircleAvatar(
                            backgroundColor: Colors.black,

                              child: SizedBox(
                                width: 18,
                                height: 18,
                                child: Image.network(
                                  "https://firebasestorage.googleapis.com/v0/b/arpit-rangi.appspot.com/o/x.png?alt=media&token=2743e138-4899-43bf-8375-0784e0401087",
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(width: 16),
                      MouseRegion(
                        onEnter: (_) =>
                            setState(() => isHoveredLinkedIn = true),
                        onExit: (_) =>
                            setState(() => isHoveredLinkedIn = false),
                        child: AnimatedContainer(
                          duration: const Duration(milliseconds: 300),
                          decoration: BoxDecoration(
                            borderRadius: const BorderRadius.all(Radius.circular(100)),
                            boxShadow: isHoveredLinkedIn
                                ? [
                              BoxShadow(
                                color: Colors.grey.withOpacity(0.5),
                                spreadRadius: 5,
                                blurRadius: 7,
                                offset: const Offset(0, 0),
                              ),
                            ]
                                : [],
                          ),
                          child: InkWell(
                            onTap: () {
                              final Uri uri = Uri.parse(
                                  "https://www.linkedin.com/in/arpit-rangi-37957428b/");
                              launchUrl(uri);
                            },
                          child: CircleAvatar(
                            backgroundColor: Colors.black,
                              child: SizedBox(
                                width: 18,
                                height: 18,
                                child: Image.network(
                                  "https://firebasestorage.googleapis.com/v0/b/arpit-rangi.appspot.com/o/linkedin.png?alt=media&token=1be5a9ba-974f-43ca-ba84-427874a21170",
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(width: 16),
                      MouseRegion(
                        onEnter: (_) => setState(() => isHoveredGitHub = true),
                        onExit: (_) => setState(() => isHoveredGitHub = false),
                        child: AnimatedContainer(
                          duration: const Duration(milliseconds: 300),
                          decoration: BoxDecoration(
                            borderRadius: const BorderRadius.all(Radius.circular(100)),
                            boxShadow: isHoveredGitHub
                                ? [
                              BoxShadow(
                                color: Colors.grey.withOpacity(0.5),
                                spreadRadius: 5,
                                blurRadius: 7,
                                offset: const Offset(0, 0),
                              ),
                            ]
                                : [],
                          ),
                          child: InkWell(
                            onTap: () {
                              final Uri uri =
                              Uri.parse("https://github.com/arangi0072");
                              launchUrl(uri);
                            },
                          child: CircleAvatar(
                            backgroundColor: Colors.black,

                              child: SizedBox(
                                width: 18,
                                height: 18,
                                child: Image.network(
                                  "https://firebasestorage.googleapis.com/v0/b/arpit-rangi.appspot.com/o/github.png?alt=media&token=be6b3b8b-cca6-4b48-bc2a-ea3f556d9f8e",
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
          Container(
            width: double.infinity,
            height: 1,
            color: const Color.fromRGBO(61, 61, 61, 1.0),
          ),
          Expanded(
            child: SingleChildScrollView(
              child: height? Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        const Text(
                          "Let's Get Acquainted",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 42,
                              fontWeight: FontWeight.bold),
                          textAlign: TextAlign.center,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 10.0),
                          child: SizedBox(
                            width: MediaQuery.of(context).size.width * 0.7,
                            child: const Text(
                              "This is a brief overview about my background, goals, and interests.",
                              style: TextStyle(
                                  color: Color.fromRGBO(89, 89, 89, 1.0),
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 10.0),
                          child: MouseRegion(
                          onEnter: (_) => setState(() => box1 = true),
                          onExit: (_) => setState(() => box1 = false),
                          child: AnimatedContainer(
                            duration: const Duration(milliseconds: 300),
                            decoration: BoxDecoration(
                              borderRadius: const BorderRadius.all(Radius.circular(15)),
                              boxShadow: box1
                                  ? [
                                BoxShadow(
                                  color:
                                  Colors.grey.withOpacity(0.5),
                                  spreadRadius: 10,
                                  blurRadius: 7,
                                  offset: const Offset(0, 3),
                                ),
                              ]
                                  : [],
                            ),
                              child: Container(
                                width:
                                MediaQuery.of(context).size.width * .9,
                                // height: 380,
                                decoration: const BoxDecoration(
                                  borderRadius:
                                  BorderRadius.all(Radius.circular(15)),
                                  color: Colors.grey,
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.all(1.0),
                                  child: Container(
                                    width:
                                    MediaQuery.of(context).size.width *
                                        .45 -
                                        1,
                                    // height: 380 - 1,
                                    decoration: const BoxDecoration(
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(15)),
                                      color: Colors.black,
                                    ),
                                    child: SingleChildScrollView(
                                      scrollDirection: Axis.vertical,
                                      child: Column(
                                        mainAxisAlignment:
                                        MainAxisAlignment.start,
                                        children: [
                                          const SizedBox(
                                            height: 15,
                                          ),
                                          SizedBox(
                                              width: MediaQuery.of(context)
                                                  .size
                                                  .width *
                                                  .9 -
                                                  40,
                                              child: const Text(
                                                "Introduction",
                                                style: TextStyle(
                                                    fontWeight:
                                                    FontWeight.bold,
                                                    color: Colors.white,
                                                    fontSize: 24),
                                              )),
                                          const SizedBox(
                                            height: 30,
                                          ),
                                          SizedBox(
                                              width: MediaQuery.of(context)
                                                  .size
                                                  .width *
                                                  .9 -
                                                  40,
                                              child: const Text(
                                                "Hi everyone! I'm a computing student, solutions developer, and community volunteer. Exploring the fascinating fields of Software Development, DSA, and Cloud Computing technologies, I have a keen interest in and excitement for discovering new things as a student.\nMy passion aligns with enjoying solving problems with code and creating useful applications using computing skills as a solution developer. While I'm doing this, I believe in giving back to the community and sharing my knowledge with others. So, I volunteer for various communities and create content that can help people achieve their goals and improve their lives.",
                                                style: TextStyle(
                                                    color: Colors.grey,
                                                    fontSize: 16),
                                              )),
                                          const SizedBox(height: 10,)
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 10.0),
                        child: MouseRegion(
                          onEnter: (_) => setState(() => box2 = true),
                          onExit: (_) => setState(() => box2 = false),
                          child: AnimatedContainer(
                            duration: const Duration(milliseconds: 300),
                            decoration: BoxDecoration(
                              borderRadius: const BorderRadius.all(Radius.circular(15)),
                              boxShadow: box2
                                  ? [
                                BoxShadow(
                                  color:
                                  Colors.grey.withOpacity(0.5),
                                  spreadRadius: 10,
                                  blurRadius: 7,
                                  offset: const Offset(0, 3),
                                ),
                              ]
                                  : [],
                            ),
                              child: Container(
                                width:
                                MediaQuery.of(context).size.width * .9,
                                height: 380,
                                decoration: const BoxDecoration(
                                  borderRadius:
                                  BorderRadius.all(Radius.circular(15)),
                                  color: Colors.grey,
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.all(1.0),
                                  child: Container(
                                    width:
                                    MediaQuery.of(context).size.width *
                                        .9 -
                                        1,
                                    height: 380 - 1,
                                    decoration: const BoxDecoration(
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(15)),
                                      color: Colors.black,
                                    ),
                                    child: SingleChildScrollView(
                                      scrollDirection: Axis.vertical,
                                      child: Column(
                                        mainAxisAlignment:
                                        MainAxisAlignment.start,
                                        children: [
                                          const SizedBox(
                                            height: 15,
                                          ),
                                          SizedBox(
                                              width: MediaQuery.of(context)
                                                  .size
                                                  .width *
                                                  .9 -
                                                  40,
                                              child: const Text(
                                                "Background",
                                                style: TextStyle(
                                                    fontWeight:
                                                    FontWeight.bold,
                                                    color: Colors.white,
                                                    fontSize: 24),
                                              )),
                                          const SizedBox(
                                            height: 30,
                                          ),
                                          SizedBox(
                                              width: MediaQuery.of(context)
                                                  .size
                                                  .width *
                                                  .9 -
                                                  40,
                                              child: const Text(
                                                "These are some intriguing facts about my personal details.\n\n🔖Name: Arpit Rangi\n\n🎂Birthday: May 18th\n\n👨🏽Gender: Male (He/Him/His)\n\n🌏Location: India (GMT+5:30)\n\n💬Communicate: English & Hindi",
                                                style: TextStyle(
                                                    color: Colors.grey,
                                                    fontSize: 16),
                                              )),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 10.0),
                          child: MouseRegion(
                          onEnter: (_) => setState(() => box3 = true),
                          onExit: (_) => setState(() => box3 = false),
                          child: AnimatedContainer(
                            duration: const Duration(milliseconds: 300),
                            decoration: BoxDecoration(
                              borderRadius: const BorderRadius.all(Radius.circular(15)),
                              boxShadow: box3
                                  ? [
                                BoxShadow(
                                  color:
                                  Colors.grey.withOpacity(0.5),
                                  spreadRadius: 10,
                                  blurRadius: 7,
                                  offset: const Offset(0, 3),
                                ),
                              ]
                                  : [],
                            ),
                              child: Container(
                                width:
                                MediaQuery.of(context).size.width * .9,
                                height: 350,
                                decoration: const BoxDecoration(
                                  borderRadius:
                                  BorderRadius.all(Radius.circular(15)),
                                  color: Colors.grey,
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.all(1.0),
                                  child: Container(
                                    width:
                                    MediaQuery.of(context).size.width *
                                        .9 -
                                        1,
                                    height: 350 - 1,
                                    decoration: const BoxDecoration(
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(15)),
                                      color: Colors.black,
                                    ),
                                    child: SingleChildScrollView(
                                      scrollDirection: Axis.vertical,
                                      child: Column(
                                        mainAxisAlignment:
                                        MainAxisAlignment.start,
                                        children: [
                                          const SizedBox(
                                            height: 15,
                                          ),
                                          SizedBox(
                                              width: MediaQuery.of(context)
                                                  .size
                                                  .width *
                                                  .9 -
                                                  40,
                                              child: const Text(
                                                "Goals",
                                                style: TextStyle(
                                                    fontWeight:
                                                    FontWeight.bold,
                                                    color: Colors.white,
                                                    fontSize: 24),
                                              )),
                                          const SizedBox(
                                            height: 30,
                                          ),
                                          SizedBox(
                                              width: MediaQuery.of(context)
                                                  .size
                                                  .width *
                                                  .9 -
                                                  40,
                                              child: const Text(
                                                "I've set these main goals for my career development.\n\n☁️Follow: Cloud Engineering\n\n💻Practice: Software Development\n\n🚩Support: Tech Communities\n\n🎓Complete: Bachelor's Degree",
                                                style: TextStyle(
                                                    color: Colors.grey,
                                                    fontSize: 16),
                                              )),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 10.0),
                        child: MouseRegion(
                          onEnter: (_) => setState(() => box4 = true),
                          onExit: (_) => setState(() => box4 = false),
                          child: AnimatedContainer(
                            duration: const Duration(milliseconds: 300),
                            decoration: BoxDecoration(
                              borderRadius: const BorderRadius.all(Radius.circular(15)),
                              boxShadow: box4
                                  ? [
                                BoxShadow(
                                  color:
                                  Colors.grey.withOpacity(0.5),
                                  spreadRadius: 10,
                                  blurRadius: 7,
                                  offset: const Offset(0, 3),
                                ),
                              ]
                                  : [],
                            ),
                              child: Container(
                                width:
                                MediaQuery.of(context).size.width * .9,
                                height: 350,
                                decoration: const BoxDecoration(
                                  borderRadius:
                                  BorderRadius.all(Radius.circular(15)),
                                  color: Colors.grey,
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.all(1.0),
                                  child: Container(
                                    width:
                                    MediaQuery.of(context).size.width *
                                        .9 -
                                        1,
                                    height: 350 - 1,
                                    decoration: const BoxDecoration(
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(15)),
                                      color: Colors.black,
                                    ),
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: SingleChildScrollView(
                                        scrollDirection: Axis.vertical,
                                        child: Column(
                                          mainAxisAlignment:
                                          MainAxisAlignment.start,
                                          children: [
                                            SizedBox(
                                                width: MediaQuery.of(context)
                                                    .size
                                                    .width *
                                                    .9 -
                                                    40,
                                                child: const Text(
                                                  "Interests",
                                                  style: TextStyle(
                                                      fontWeight:
                                                      FontWeight.bold,
                                                      color: Colors.white,
                                                      fontSize: 24),
                                                )),
                                            const SizedBox(
                                              height: 30,
                                            ),
                                            SizedBox(
                                                width: MediaQuery.of(context)
                                                    .size
                                                    .width *
                                                    .9 -
                                                    40,
                                                child: const Text(
                                                  "I'm passionate about these activities and hobbies.\n\n🎬Watch: Movies & TV Shows\n\n🎧Listen: Songs & Music\n\n🖌️Create: Contents & Media\n\n🔍Explore: New Things",
                                                  style: TextStyle(
                                                      color: Colors.grey,
                                                      fontSize: 16),
                                                )),
                                          ],
                                        ),
                                      ),
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
                  const SizedBox(
                    height: 100,
                  ),
                  Container(
                    width: double.infinity,
                    height: 1,
                    color: const Color.fromRGBO(61, 61, 61, 1.0),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  const Text(
                    "Copyright © 2024 Arpit Rangi",
                    style: TextStyle(fontSize: 16, color: Colors.white),
                  ),
                  const Text(
                    "Version 1.0.0 | Built with Flutter 3.19.6",
                    style: TextStyle(fontSize: 16, color: Colors.white),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                ],
              ) : Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        const Text(
                          "Let's Get Acquainted",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 42,
                              fontWeight: FontWeight.bold),
                          textAlign: TextAlign.center,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 10.0),
                          child: SizedBox(
                            width: MediaQuery.of(context).size.width * 0.7,
                            child: const Text(
                              "This is a brief overview about my background, goals, and interests.",
                              style: TextStyle(
                                  color: Color.fromRGBO(89, 89, 89, 1.0),
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                              left: 50.0, right: 50, top: 30),
                          child: SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(right: 10.0),
                                child: MouseRegion(
                                  onEnter: (_) => setState(() => box1 = true),
                                  onExit: (_) => setState(() => box1 = false),
                                  child: AnimatedContainer(
                                    duration: const Duration(milliseconds: 300),
                                    decoration: BoxDecoration(
                                      borderRadius: const BorderRadius.all(Radius.circular(15)),
                                      boxShadow: box1
                                          ? [
                                              BoxShadow(
                                                color:
                                                    Colors.grey.withOpacity(0.5),
                                                spreadRadius: 10,
                                                blurRadius: 7,
                                                offset: const Offset(0, 3),
                                              ),
                                            ]
                                          : [],
                                    ),
                                      child: Container(
                                        width:
                                            MediaQuery.of(context).size.width * .45,
                                        height: 380,
                                        decoration: const BoxDecoration(
                                          borderRadius:
                                              BorderRadius.all(Radius.circular(15)),
                                          color: Colors.grey,
                                        ),
                                        child: Padding(
                                          padding: const EdgeInsets.all(1.0),
                                          child: Container(
                                            width:
                                                MediaQuery.of(context).size.width *
                                                        .45 -
                                                    1,
                                            height: 380 - 1,
                                            decoration: const BoxDecoration(
                                              borderRadius: BorderRadius.all(
                                                  Radius.circular(15)),
                                              color: Colors.black,
                                            ),
                                            child: SingleChildScrollView(
                                              scrollDirection: Axis.vertical,
                                              child: Column(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.start,
                                                children: [
                                                  const SizedBox(
                                                    height: 15,
                                                  ),
                                                  SizedBox(
                                                      width: MediaQuery.of(context)
                                                                  .size
                                                                  .width *
                                                              .45 -
                                                          40,
                                                      child: const Text(
                                                        "Introduction",
                                                        style: TextStyle(
                                                            fontWeight:
                                                                FontWeight.bold,
                                                            color: Colors.white,
                                                            fontSize: 24),
                                                      )),
                                                  const SizedBox(
                                                    height: 30,
                                                  ),
                                                  SizedBox(
                                                      width: MediaQuery.of(context)
                                                                  .size
                                                                  .width *
                                                              .45 -
                                                          40,
                                                      child: const Text(
                                                        "Hi everyone! I'm a computing student, solutions developer, and community volunteer. Exploring the fascinating fields of Software Development, DSA, and Cloud Computing technologies, I have a keen interest in and excitement for discovering new things as a student.\nMy passion aligns with enjoying solving problems with code and creating useful applications using computing skills as a solution developer. While I'm doing this, I believe in giving back to the community and sharing my knowledge with others. So, I volunteer for various communities and create content that can help people achieve their goals and improve their lives.",
                                                        style: TextStyle(
                                                            color: Colors.grey,
                                                            fontSize: 16),
                                                      )),
                                                ],
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(left: 10.0),
                                child: MouseRegion(
                                  onEnter: (_) => setState(() => box2 = true),
                                  onExit: (_) => setState(() => box2 = false),
                                  child: AnimatedContainer(
                                    duration: const Duration(milliseconds: 300),
                                    decoration: BoxDecoration(
                                      borderRadius: const BorderRadius.all(Radius.circular(15)),
                                      boxShadow: box2
                                          ? [
                                              BoxShadow(
                                                color:
                                                    Colors.grey.withOpacity(0.5),
                                                spreadRadius: 10,
                                                blurRadius: 7,
                                                offset: const Offset(0, 3),
                                              ),
                                            ]
                                          : [],
                                    ),
                                      child: Container(
                                        width:
                                            MediaQuery.of(context).size.width * .45,
                                        height: 380,
                                        decoration: const BoxDecoration(
                                          borderRadius:
                                              BorderRadius.all(Radius.circular(15)),
                                          color: Colors.grey,
                                        ),
                                        child: Padding(
                                          padding: const EdgeInsets.all(1.0),
                                          child: Container(
                                            width:
                                                MediaQuery.of(context).size.width *
                                                        .45 -
                                                    1,
                                            height: 380 - 1,
                                            decoration: const BoxDecoration(
                                              borderRadius: BorderRadius.all(
                                                  Radius.circular(15)),
                                              color: Colors.black,
                                            ),
                                            child: SingleChildScrollView(
                                              scrollDirection: Axis.vertical,
                                              child: Column(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.start,
                                                children: [
                                                  const SizedBox(
                                                    height: 15,
                                                  ),
                                                  SizedBox(
                                                      width: MediaQuery.of(context)
                                                                  .size
                                                                  .width *
                                                              .45 -
                                                          40,
                                                      child: const Text(
                                                        "Background",
                                                        style: TextStyle(
                                                            fontWeight:
                                                                FontWeight.bold,
                                                            color: Colors.white,
                                                            fontSize: 24),
                                                      )),
                                                  const SizedBox(
                                                    height: 30,
                                                  ),
                                                  SizedBox(
                                                      width: MediaQuery.of(context)
                                                                  .size
                                                                  .width *
                                                              .45 -
                                                          40,
                                                      child: const Text(
                                                        "These are some intriguing facts about my personal details.\n\n🔖Name: Arpit Rangi\n\n🎂Birthday: May 18th\n\n👨🏽Gender: Male (He/Him/His)\n\n🌏Location: India (GMT+5:30)\n\n💬Communicate: English & Hindi",
                                                        style: TextStyle(
                                                            color: Colors.grey,
                                                            fontSize: 16),
                                                      )),
                                                ],
                                              ),
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
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                              left: 50.0, right: 50, top: 30),
                          child: SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(right: 10.0),
                                  child: MouseRegion(
                                  onEnter: (_) => setState(() => box3 = true),
                                  onExit: (_) => setState(() => box3 = false),
                                  child: AnimatedContainer(
                                    duration: const Duration(milliseconds: 300),
                                    decoration: BoxDecoration(
                                      borderRadius: const BorderRadius.all(Radius.circular(15)),
                                      boxShadow: box3
                                          ? [
                                              BoxShadow(
                                                color:
                                                    Colors.grey.withOpacity(0.5),
                                                spreadRadius: 10,
                                                blurRadius: 7,
                                                offset: const Offset(0, 3),
                                              ),
                                            ]
                                          : [],
                                    ),
                                    child: Container(
                                      width:
                                          MediaQuery.of(context).size.width * .45,
                                      height: 350,
                                      decoration: const BoxDecoration(
                                        borderRadius:
                                            BorderRadius.all(Radius.circular(15)),
                                        color: Colors.grey,
                                      ),
                                      child: Padding(
                                        padding: const EdgeInsets.all(1.0),

                                          child: Container(
                                            width:
                                                MediaQuery.of(context).size.width *
                                                        .45 -
                                                    1,
                                            height: 350 - 1,
                                            decoration: const BoxDecoration(
                                              borderRadius: BorderRadius.all(
                                                  Radius.circular(15)),
                                              color: Colors.black,
                                            ),
                                            child: SingleChildScrollView(
                                              scrollDirection: Axis.vertical,
                                              child: Column(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.start,
                                                children: [
                                                  const SizedBox(
                                                    height: 15,
                                                  ),
                                                  SizedBox(
                                                      width: MediaQuery.of(context)
                                                                  .size
                                                                  .width *
                                                              .45 -
                                                          40,
                                                      child: const Text(
                                                        "Goals",
                                                        style: TextStyle(
                                                            fontWeight:
                                                                FontWeight.bold,
                                                            color: Colors.white,
                                                            fontSize: 24),
                                                      )),
                                                  const SizedBox(
                                                    height: 30,
                                                  ),
                                                  SizedBox(
                                                      width: MediaQuery.of(context)
                                                                  .size
                                                                  .width *
                                                              .45 -
                                                          40,
                                                      child: const Text(
                                                        "I've set these main goals for my career development.\n\n🤖Follow: AI Engineering\n\n💻Practice: Software Development\n\n🚩Support: Tech Communities\n\n🎓Complete: Bachelor's Degree",
                                                        style: TextStyle(
                                                            color: Colors.grey,
                                                            fontSize: 16),
                                                      )),
                                                ],
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(left: 10.0),
                                child: MouseRegion(
                                  onEnter: (_) => setState(() => box4 = true),
                                  onExit: (_) => setState(() => box4 = false),
                                  child: AnimatedContainer(
                                    duration: const Duration(milliseconds: 300),
                                    decoration: BoxDecoration(
                                      borderRadius: const BorderRadius.all(Radius.circular(15)),
                                      boxShadow: box4
                                          ? [
                                              BoxShadow(
                                                color:
                                                    Colors.grey.withOpacity(0.5),
                                                spreadRadius: 10,
                                                blurRadius: 7,
                                                offset: const Offset(0, 3),
                                              ),
                                            ]
                                          : [],
                                    ),
                                      child: Container(
                                        width:
                                            MediaQuery.of(context).size.width * .45,
                                        height: 350,
                                        decoration: const BoxDecoration(
                                          borderRadius:
                                              BorderRadius.all(Radius.circular(15)),
                                          color: Colors.grey,
                                        ),
                                        child: Padding(
                                          padding: const EdgeInsets.all(1.0),
                                          child: Container(
                                            width:
                                                MediaQuery.of(context).size.width *
                                                        .45 -
                                                    1,
                                            height: 350 - 1,
                                            decoration: const BoxDecoration(
                                              borderRadius: BorderRadius.all(
                                                  Radius.circular(15)),
                                              color: Colors.black,
                                            ),
                                            child: Padding(
                                              padding: const EdgeInsets.all(8.0),
                                              child: SingleChildScrollView(
                                                scrollDirection: Axis.vertical,
                                                child: Column(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.start,
                                                  children: [
                                                    SizedBox(
                                                        width: MediaQuery.of(context)
                                                            .size
                                                            .width *
                                                            .45 -
                                                            40,
                                                        child: const Text(
                                                          "Interests",
                                                          style: TextStyle(
                                                              fontWeight:
                                                              FontWeight.bold,
                                                              color: Colors.white,
                                                              fontSize: 24),
                                                        )),
                                                    const SizedBox(
                                                      height: 30,
                                                    ),
                                                    SizedBox(
                                                        width: MediaQuery.of(context)
                                                            .size
                                                            .width *
                                                            .45 -
                                                            40,
                                                        child: const Text(
                                                          "I'm passionate about these activities and hobbies.\n\n🎬Watch: Movies & TV Shows\n\n🎧Listen: Songs & Music\n\n🖌️Create: Contents & Media\n\n🔍Explore: New Things",
                                                          style: TextStyle(
                                                              color: Colors.grey,
                                                              fontSize: 16),
                                                        )),
                                                  ],
                                                ),
                                              ),
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
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 100,
                  ),
                  Container(
                    width: double.infinity,
                    height: 1,
                    color: const Color.fromRGBO(61, 61, 61, 1.0),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  const Text(
                    "Copyright © 2024 Arpit Rangi",
                    style: TextStyle(fontSize: 16, color: Colors.white),
                  ),
                  const Text(
                    "Version 1.0.0 | Built with Flutter 3.19.6",
                    style: TextStyle(fontSize: 16, color: Colors.white),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  MouseRegion(
                    onEnter: (_) => setState(() => box5 = true),
                    onExit: (_) => setState(() => box5 = false),
                    child: AnimatedContainer(
                      duration: const Duration(milliseconds: 300),
                      decoration: BoxDecoration(
                        borderRadius:
                        const BorderRadius.all(Radius.circular(100)),
                        boxShadow: box5
                            ? [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.5),
                            spreadRadius: 10,
                            blurRadius: 7,
                            offset: const Offset(0, 0),
                          ),
                        ]
                            : [],
                      ),
                      child: InkWell(
                        onTap: () {
                          final Uri uri =
                          Uri.parse("https://github.com/arangi0072/arpit_rangi");
                          launchUrl(uri);
                        },
                        child: Container(
                          // width: 260,
                          // height: 30,
                          decoration: const BoxDecoration(
                            borderRadius:
                            BorderRadius.all(Radius.circular(100)),
                            color: Colors.grey,
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(1.0),
                            child: Container(
                              // width: 259,
                              // height: 29,
                              decoration: const BoxDecoration(
                                borderRadius: BorderRadius.all(
                                    Radius.circular(100)),
                                color: Colors.black,
                              ),
                              child: const Padding(
                                padding: EdgeInsets.only(
                                    left: 10.0,
                                    top: 3,
                                    right: 10,
                                    bottom: 3),
                                child: Text(
                                  "View Source Code {}",
                                  style: TextStyle(
                                      fontSize: 14, color: Colors.white),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
