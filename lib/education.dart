import 'package:arpit_rangi/main.dart';
import 'package:arpit_rangi/projects.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:url_launcher/url_launcher.dart';

import 'about.dart';
import 'connect.dart';

class MyEducationPage extends StatefulWidget {
  const MyEducationPage({super.key});

  @override
  State<MyEducationPage> createState() => _MyEducationPageState();
}

class _MyEducationPageState extends State<MyEducationPage> {
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
            child: height? SingleChildScrollView(
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
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const MyAboutPage()),
                            );
                          },
                          child: const Text("About",
                              style: TextStyle(
                                  color: Colors.grey,
                                  fontSize: 18))),
                      TextButton(
                          onPressed: () {},
                          child: const Text("Education",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 20, fontWeight: FontWeight.bold))),
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
            ):Row(
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
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const MyAboutPage()),
                          );
                        },
                        child: const Text("About",
                            style: TextStyle(
                                color: Colors.grey,
                                fontSize: 18))),
                    TextButton(
                        onPressed: () {

                        },
                        child: const Text("Education",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 20, fontWeight: FontWeight.bold))),
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
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: height? Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        const Text(
                          "Academic Education",
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
                              "Discover the stages of my academic learning journey.",
                              style: TextStyle(
                                  color: Color.fromRGBO(89, 89, 89, 1.0),
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ),
                        MouseRegion(
                          onEnter: (_) => setState(() => box1 = true),
                          onExit: (_) => setState(() => box1 = false),
                          child: AnimatedContainer(
                            duration: const Duration(milliseconds: 300),
                            decoration: BoxDecoration(
                              boxShadow: box1
                                  ? [
                                BoxShadow(
                                  color:
                                  Colors.grey.withOpacity(0.5),
                                  spreadRadius: 5,
                                  blurRadius: 5,
                                  offset: const Offset(0, 0),
                                ),
                              ]
                                  : [],
                            ),
                            child: Padding(
                              padding: const EdgeInsets.only(top: 10.0),
                              child: Container(
                                width:
                                MediaQuery.of(context).size.width * .9,
                                // height: 180,
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
                                    // height: 180 - 1,
                                    decoration: const BoxDecoration(
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(15)),
                                      color: Colors.black,
                                    ),
                                    child: Row(
                                      mainAxisAlignment:
                                      MainAxisAlignment.start,
                                      children: [
                                        Padding(
                                          padding:
                                          const EdgeInsets.all(10.0),
                                          child: InkWell(
                                            onTap: () {
                                              final Uri uri = Uri.parse(
                                                  "https://lpu.in");
                                              launchUrl(uri);
                                            },
                                            child: SizedBox(
                                                width: 100,
                                                height: 100,
                                                child: Image.network(
                                                  "https://firebasestorage.googleapis.com/v0/b/arpit-rangi.appspot.com/o/lpu.png?alt=media&token=f527188d-064b-4bc7-a85e-3705d2698aee",
                                                  fit: BoxFit.cover,
                                                )),
                                          ),
                                        ),
                                        Padding(
                                          padding:
                                          const EdgeInsets.all(10.0),
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
                                                    width:
                                                    MediaQuery.of(context)
                                                        .size
                                                        .width *
                                                        .9 -
                                                        150,
                                                    child: const Text(
                                                      "B.Tech CSE Data Science with ML",
                                                      style: TextStyle(
                                                          fontWeight:
                                                          FontWeight.bold,
                                                          color: Colors.white,
                                                          fontSize: 24),
                                                    )),
                                                const SizedBox(
                                                  height: 20,
                                                ),
                                                SizedBox(
                                                    width:
                                                    MediaQuery.of(context)
                                                        .size
                                                        .width *
                                                        .9 -
                                                        150,
                                                    child: const Text(
                                                      "Lovely Professional University\nAug 2023 - Present\nPunjab, India",
                                                      style: TextStyle(
                                                          color: Colors.grey,
                                                          fontSize: 16),
                                                    )),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                        MouseRegion(
                          onEnter: (_) => setState(() => box2 = true),
                          onExit: (_) => setState(() => box2 = false),
                          child: AnimatedContainer(
                            duration: const Duration(milliseconds: 300),
                            decoration: BoxDecoration(
                              boxShadow: box2
                                  ? [
                                BoxShadow(
                                  color:
                                  Colors.grey.withOpacity(0.5),
                                  spreadRadius: 5,
                                  blurRadius: 5,
                                  offset: const Offset(0, 0),
                                ),
                              ]
                                  : [],
                            ),
                            child: Padding(
                              padding: const EdgeInsets.only(top: 10.0),
                              child: Container(
                                width:
                                MediaQuery.of(context).size.width * .9,
                                // height: 180,
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
                                    // height: 180 - 1,
                                    decoration: const BoxDecoration(
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(15)),
                                      color: Colors.black,
                                    ),
                                    child: Row(
                                      mainAxisAlignment:
                                      MainAxisAlignment.start,
                                      children: [
                                        Padding(
                                          padding:
                                          const EdgeInsets.all(10.0),
                                          child: InkWell(
                                            onTap: () {
                                              final Uri uri = Uri.parse(
                                                  "https://rkp.education/");
                                              launchUrl(uri);
                                            },
                                            child: SizedBox(
                                                width: 100,
                                                height: 100,
                                                child: Image.network(
                                                  "https://firebasestorage.googleapis.com/v0/b/arpit-rangi.appspot.com/o/school.png?alt=media&token=ff19eee0-8c8d-44c8-a8ab-eb2d2551d0a9",
                                                  fit: BoxFit.cover,
                                                )),
                                          ),
                                        ),
                                        Padding(
                                          padding:
                                          const EdgeInsets.all(10.0),
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
                                                    width:
                                                    MediaQuery.of(context)
                                                        .size
                                                        .width *
                                                        .9 -
                                                        150,
                                                    child: const Text(
                                                      "Senior Study Class XI - XII",
                                                      style: TextStyle(
                                                          fontWeight:
                                                          FontWeight.bold,
                                                          color: Colors.white,
                                                          fontSize: 24),
                                                    )),
                                                const SizedBox(
                                                  height: 20,
                                                ),
                                                SizedBox(
                                                    width:
                                                    MediaQuery.of(context)
                                                        .size
                                                        .width *
                                                        .9 -
                                                        150,
                                                    child: const Text(
                                                      "RKP Sr. Sec. School\nAug 2021 - March 2023 · 1 year 5 Months \nHaryana, India",
                                                      style: TextStyle(
                                                          color: Colors.grey,
                                                          fontSize: 16),
                                                    )),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                        MouseRegion(
                          onEnter: (_) => setState(() => box3 = true),
                          onExit: (_) => setState(() => box3 = false),
                          child: AnimatedContainer(
                            duration: const Duration(milliseconds: 300),
                            decoration: BoxDecoration(
                              boxShadow: box3
                                  ? [
                                BoxShadow(
                                  color:
                                  Colors.grey.withOpacity(0.5),
                                  spreadRadius: 5,
                                  blurRadius: 5,
                                  offset: const Offset(0, 0),
                                ),
                              ]
                                  : [],
                            ),
                            child: Padding(
                              padding: const EdgeInsets.only(top: 10.0),
                              child: Container(
                                width:
                                MediaQuery.of(context).size.width * .9,
                                // height: 180,
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
                                    // height: 180 - 1,
                                    decoration: const BoxDecoration(
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(15)),
                                      color: Colors.black,
                                    ),
                                    child: Row(
                                      mainAxisAlignment:
                                      MainAxisAlignment.start,
                                      children: [
                                        Padding(
                                          padding:
                                          const EdgeInsets.all(10.0),
                                          child: InkWell(
                                            onTap: () {
                                              // final Uri uri = Uri.parse(
                                              //     "https://rkp.education/");
                                              // launchUrl(uri);
                                            },
                                            child: SizedBox(
                                                width: 100,
                                                height: 100,
                                                child: Image.network(
                                                  "https://firebasestorage.googleapis.com/v0/b/arpit-rangi.appspot.com/o/indus.png?alt=media&token=4ff593b7-28aa-4959-aac0-d68eae694fce",
                                                  fit: BoxFit.cover,
                                                )),
                                          ),
                                        ),
                                        Padding(
                                          padding:
                                          const EdgeInsets.all(10.0),
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
                                                    width:
                                                    MediaQuery.of(context)
                                                        .size
                                                        .width *
                                                        .9 -
                                                        150,
                                                    child: const Text(
                                                      "Study Class VI - X",
                                                      style: TextStyle(
                                                          fontWeight:
                                                          FontWeight.bold,
                                                          color: Colors.white,
                                                          fontSize: 24),
                                                    )),
                                                const SizedBox(
                                                  height: 20,
                                                ),
                                                SizedBox(
                                                    width:
                                                    MediaQuery.of(context)
                                                        .size
                                                        .width *
                                                        .9 -
                                                        150,
                                                    child: const Text(
                                                      "Indus Public School\n April 2016 - Aug 2021 · 5 year 5 Months \nHaryana, India",
                                                      style: TextStyle(
                                                          color: Colors.grey,
                                                          fontSize: 16),
                                                    )),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                        MouseRegion(
                          onEnter: (_) => setState(() => box4 = true),
                          onExit: (_) => setState(() => box4 = false),
                          child: AnimatedContainer(
                            duration: const Duration(milliseconds: 300),
                            decoration: BoxDecoration(
                              boxShadow: box4
                                  ? [
                                BoxShadow(
                                  color:
                                  Colors.grey.withOpacity(0.5),
                                  spreadRadius: 5,
                                  blurRadius: 5,
                                  offset: const Offset(0, 0),
                                ),
                              ]
                                  : [],
                            ),
                            child: Padding(
                              padding: const EdgeInsets.only(top: 10.0),
                              child: Container(
                                width:
                                MediaQuery.of(context).size.width * .9,
                                // height: 180,
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
                                    // height: 180 - 1,
                                    decoration: const BoxDecoration(
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(15)),
                                      color: Colors.black,
                                    ),
                                    child: Row(
                                      mainAxisAlignment:
                                      MainAxisAlignment.start,
                                      children: [
                                        Padding(
                                          padding:
                                          const EdgeInsets.all(10.0),
                                          child: InkWell(
                                            onTap: () {
                                              final Uri uri = Uri.parse(
                                                  "https://svmssschool.com/");
                                              launchUrl(uri);
                                            },
                                            child: SizedBox(
                                                width: 100,
                                                height: 100,
                                                child: Image.network(
                                                  "https://firebasestorage.googleapis.com/v0/b/arpit-rangi.appspot.com/o/school2.png?alt=media&token=d9101bea-14fd-454b-9caa-1354685485d1",
                                                  fit: BoxFit.cover,
                                                )),
                                          ),
                                        ),
                                        Padding(
                                          padding:
                                          const EdgeInsets.all(10.0),
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
                                                    width:
                                                    MediaQuery.of(context)
                                                        .size
                                                        .width *
                                                        .9 -
                                                        150,
                                                    child: const Text(
                                                      "Junior Study Class I - V",
                                                      style: TextStyle(
                                                          fontWeight:
                                                          FontWeight.bold,
                                                          color: Colors.white,
                                                          fontSize: 24),
                                                    )),
                                                const SizedBox(
                                                  height: 20,
                                                ),
                                                SizedBox(
                                                    width:
                                                    MediaQuery.of(context)
                                                        .size
                                                        .width *
                                                        .9 -
                                                        150,
                                                    child: const Text(
                                                      "Saraswati Vidya Mandir Sr. Sec. School\n April 2011 - April 2016 · 5 year \nHaryana, India",
                                                      style: TextStyle(
                                                          color: Colors.grey,
                                                          fontSize: 16),
                                                    )),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ) : Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        const Text(
                          "Academic Education",
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
                              "Discover the stages of my academic learning journey.",
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
                              left: 20.0, right: 20, top: 30),
                          child: SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(right: 10.0),
                                  child:
                                MouseRegion(
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
                                          offset: const Offset(0, 0),
                                        ),
                                      ]
                                          : [],
                                    ),
                                    child:  Container(
                                        width:
                                        MediaQuery.of(context).size.width * .45,
                                        height: 180,
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
                                            height: 180 - 1,
                                            decoration: const BoxDecoration(
                                              borderRadius: BorderRadius.all(
                                                  Radius.circular(15)),
                                              color: Colors.black,
                                            ),
                                            child: Row(
                                              mainAxisAlignment:
                                              MainAxisAlignment.start,
                                              children: [
                                                Padding(
                                                  padding:
                                                  const EdgeInsets.all(10.0),
                                                  child: InkWell(
                                                    onTap: () {
                                                      final Uri uri = Uri.parse(
                                                          "https://lpu.in");
                                                      launchUrl(uri);
                                                    },
                                                    child: SizedBox(
                                                        width: 100,
                                                        height: 100,
                                                        child: Image.network(
                                                          "https://firebasestorage.googleapis.com/v0/b/arpit-rangi.appspot.com/o/lpu.png?alt=media&token=f527188d-064b-4bc7-a85e-3705d2698aee",
                                                          fit: BoxFit.cover,
                                                        )),
                                                  ),
                                                ),
                                                Padding(
                                                  padding:
                                                  const EdgeInsets.all(10.0),
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
                                                            width:
                                                            MediaQuery.of(context)
                                                                .size
                                                                .width *
                                                                .45 -
                                                                150,
                                                            child: const Text(
                                                              "B.Tech CSE Data Science with ML",
                                                              style: TextStyle(
                                                                  fontWeight:
                                                                  FontWeight.bold,
                                                                  color: Colors.white,
                                                                  fontSize: 24),
                                                            )),
                                                        const SizedBox(
                                                          height: 20,
                                                        ),
                                                        SizedBox(
                                                            width:
                                                            MediaQuery.of(context)
                                                                .size
                                                                .width *
                                                                .45 -
                                                                150,
                                                            child: const Text(
                                                              "Lovely Professional University\nAug 2023 - Present\nPunjab, India",
                                                              style: TextStyle(
                                                                  color: Colors.grey,
                                                                  fontSize: 16),
                                                            )),
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(left: 10.0),
                                  child:
                                MouseRegion(
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
                                          offset: const Offset(0, 0),
                                        ),
                                      ]
                                          : [],
                                    ),
                                    child:  Container(
                                        width:
                                        MediaQuery.of(context).size.width * .45,
                                        height: 180,
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
                                            height: 180 - 1,
                                            decoration: const BoxDecoration(
                                              borderRadius: BorderRadius.all(
                                                  Radius.circular(15)),
                                              color: Colors.black,
                                            ),
                                            child: Row(
                                              mainAxisAlignment:
                                              MainAxisAlignment.start,
                                              children: [
                                                Padding(
                                                  padding:
                                                  const EdgeInsets.all(10.0),
                                                  child: InkWell(
                                                    onTap: () {
                                                      final Uri uri = Uri.parse(
                                                          "https://rkp.education/");
                                                      launchUrl(uri);
                                                    },
                                                    child: SizedBox(
                                                        width: 100,
                                                        height: 100,
                                                        child: Image.network(
                                                          "https://firebasestorage.googleapis.com/v0/b/arpit-rangi.appspot.com/o/school.png?alt=media&token=ff19eee0-8c8d-44c8-a8ab-eb2d2551d0a9",
                                                          fit: BoxFit.cover,
                                                        )),
                                                  ),
                                                ),
                                                Padding(
                                                  padding:
                                                  const EdgeInsets.all(10.0),
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
                                                            width:
                                                            MediaQuery.of(context)
                                                                .size
                                                                .width *
                                                                .45 -
                                                                150,
                                                            child: const Text(
                                                              "Senior Study Class XI - XII",
                                                              style: TextStyle(
                                                                  fontWeight:
                                                                  FontWeight.bold,
                                                                  color: Colors.white,
                                                                  fontSize: 24),
                                                            )),
                                                        const SizedBox(
                                                          height: 20,
                                                        ),
                                                        SizedBox(
                                                            width:
                                                            MediaQuery.of(context)
                                                                .size
                                                                .width *
                                                                .45 -
                                                                150,
                                                            child: const Text(
                                                              "RKP Sr. Sec. School\nAug 2021 - March 2023 · 1 year 5 Months \nHaryana, India",
                                                              style: TextStyle(
                                                                  color: Colors.grey,
                                                                  fontSize: 16),
                                                            )),
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                              ],
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
                              left: 20.0, right: 20, top: 30),
                          child: SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(right: 10.0),
                                  child:
                                MouseRegion(
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
                                          offset: const Offset(0, 0),
                                        ),
                                      ]
                                          : [],
                                    ),
                                    child:  Container(
                                        width:
                                        MediaQuery.of(context).size.width * .45,
                                        height: 180,
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
                                            height: 180 - 1,
                                            decoration: const BoxDecoration(
                                              borderRadius: BorderRadius.all(
                                                  Radius.circular(15)),
                                              color: Colors.black,
                                            ),
                                            child: Row(
                                              mainAxisAlignment:
                                              MainAxisAlignment.start,
                                              children: [
                                                Padding(
                                                  padding:
                                                  const EdgeInsets.all(10.0),
                                                  child: InkWell(
                                                    onTap: () {
                                                      // final Uri uri = Uri.parse(
                                                      //     "https://rkp.education/");
                                                      // launchUrl(uri);
                                                    },
                                                    child: SizedBox(
                                                        width: 100,
                                                        height: 100,
                                                        child: Image.network(
                                                          "https://firebasestorage.googleapis.com/v0/b/arpit-rangi.appspot.com/o/indus.png?alt=media&token=4ff593b7-28aa-4959-aac0-d68eae694fce",
                                                          fit: BoxFit.cover,
                                                        )),
                                                  ),
                                                ),
                                                Padding(
                                                  padding:
                                                  const EdgeInsets.all(10.0),
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
                                                            width:
                                                            MediaQuery.of(context)
                                                                .size
                                                                .width *
                                                                .45 -
                                                                150,
                                                            child: const Text(
                                                              "Study Class VI - X",
                                                              style: TextStyle(
                                                                  fontWeight:
                                                                  FontWeight.bold,
                                                                  color: Colors.white,
                                                                  fontSize: 24),
                                                            )),
                                                        const SizedBox(
                                                          height: 20,
                                                        ),
                                                        SizedBox(
                                                            width:
                                                            MediaQuery.of(context)
                                                                .size
                                                                .width *
                                                                .45 -
                                                                150,
                                                            child: const Text(
                                                              "Indus Public School\n April 2016 - Aug 2021 · 5 year 5 Months \nHaryana, India",
                                                              style: TextStyle(
                                                                  color: Colors.grey,
                                                                  fontSize: 16),
                                                            )),
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(left: 10.0),
                                  child:
                                  MouseRegion(
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
                                          offset: const Offset(0, 0),
                                        ),
                                      ]
                                          : [],
                                    ),
                                    child: Container(
                                        width:
                                        MediaQuery.of(context).size.width * .45,
                                        height: 180,
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
                                            height: 180 - 1,
                                            decoration: const BoxDecoration(
                                              borderRadius: BorderRadius.all(
                                                  Radius.circular(15)),
                                              color: Colors.black,
                                            ),
                                            child: Row(
                                              mainAxisAlignment:
                                              MainAxisAlignment.start,
                                              children: [
                                                Padding(
                                                  padding:
                                                  const EdgeInsets.all(10.0),
                                                  child: InkWell(
                                                    onTap: () {
                                                      final Uri uri = Uri.parse(
                                                          "https://svmssschool.com/");
                                                      launchUrl(uri);
                                                    },
                                                    child: SizedBox(
                                                        width: 100,
                                                        height: 100,
                                                        child: Image.network(
                                                          "https://firebasestorage.googleapis.com/v0/b/arpit-rangi.appspot.com/o/school2.png?alt=media&token=d9101bea-14fd-454b-9caa-1354685485d1",
                                                          fit: BoxFit.cover,
                                                        )),
                                                  ),
                                                ),
                                                Padding(
                                                  padding:
                                                  const EdgeInsets.all(10.0),
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
                                                            width:
                                                            MediaQuery.of(context)
                                                                .size
                                                                .width *
                                                                .45 -
                                                                150,
                                                            child: const Text(
                                                              "Junior Study Class I - V",
                                                              style: TextStyle(
                                                                  fontWeight:
                                                                  FontWeight.bold,
                                                                  color: Colors.white,
                                                                  fontSize: 24),
                                                            )),
                                                        const SizedBox(
                                                          height: 20,
                                                        ),
                                                        SizedBox(
                                                            width:
                                                            MediaQuery.of(context)
                                                                .size
                                                                .width *
                                                                .45 -
                                                                150,
                                                            child: const Text(
                                                              "Saraswati Vidya Mandir Sr. Sec. School\n April 2011 - April 2016 · 5 year \nHaryana, India",
                                                              style: TextStyle(
                                                                  color: Colors.grey,
                                                                  fontSize: 16),
                                                            )),
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                              ],
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
