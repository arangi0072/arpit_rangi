import 'package:arpit_rangi/about.dart';
import 'package:arpit_rangi/connect.dart';
import 'package:arpit_rangi/education.dart';
import 'package:arpit_rangi/projects.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import 'blogs.dart';

Future<void> main() async {
  await Firebase.initializeApp(
      options: const FirebaseOptions(
    apiKey: 'AIzaSyADbr2QGFp-hdZEvtbp7Jm8f-U_Ecs8eMk',
    appId: '1:278803359802:web:14cb22db9b063f570ded03',
    messagingSenderId: '278803359802',
    projectId: 'arpit-rangi',
    storageBucket: 'arpit-rangi.appspot.com',
  ));
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Home',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        scaffoldBackgroundColor: const Color(0xFF000000),
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.black),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Home'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  bool box1 = false;
  bool box2 = false;
  bool isHoveredTwitter = false;
  bool isHoveredLinkedIn = false;
  bool isHoveredGitHub = false;

  @override
  Widget build(BuildContext context) {
    bool height = MediaQuery.of(context).size.width <= 600;
    return Scaffold(
      body: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: SizedBox(
              child: height
                  ? SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text(
                            "Arpit Rangi",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 18,
                                fontWeight: FontWeight.bold),
                          ),
                          Row(
                            children: [
                              TextButton(
                                  onPressed: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              const MyAboutPage()),
                                    );
                                  },
                                  child: const Text("About",
                                      style: TextStyle(
                                          color: Colors.grey, fontSize: 18))),
                              TextButton(
                                  onPressed: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              const MyEducationPage()),
                                    );
                                  },
                                  child: const Text("Education",
                                      style: TextStyle(
                                          color: Colors.grey, fontSize: 18))),
                              TextButton(
                                  onPressed: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              const MyProjectsPage()),
                                    );
                                  },
                                  child: const Text("Projects",
                                      style: TextStyle(
                                          color: Colors.grey, fontSize: 18))),
                              TextButton(
                                  onPressed: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              const MyBlogsPage()),
                                    );
                                  },
                                  child: const Text("Blogs",
                                      style: TextStyle(
                                          color: Colors.grey, fontSize: 18))),
                              TextButton(
                                  onPressed: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              const MyConnectPage()),
                                    );
                                  },
                                  child: const Text("Connect",
                                      style: TextStyle(
                                          color: Colors.grey, fontSize: 18))),
                            ],
                          ),
                          Padding(
                            padding: const EdgeInsets.only(right: 8.0),
                            child: Row(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(left: 16.0),
                                  child: InkWell(
                                    onTap: () {
                                      final Uri uri = Uri.parse(
                                          "https://x.com/arpit_rangi");
                                      launchUrl(uri);
                                    },
                                    child: SizedBox(
                                        width: 18,
                                        height: 18,
                                        child: Image.network(
                                          "https://firebasestorage.googleapis.com/v0/b/arpit-rangi.appspot.com/o/x.png?alt=media&token=2743e138-4899-43bf-8375-0784e0401087",
                                          fit: BoxFit.cover,
                                        )),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(left: 16.0),
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
                                        )),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(left: 16.0),
                                  child: InkWell(
                                    onTap: () {
                                      final Uri uri = Uri.parse(
                                          "https://github.com/arangi0072");
                                      launchUrl(uri);
                                    },
                                    child: SizedBox(
                                        width: 18,
                                        height: 18,
                                        child: Image.network(
                                          "https://firebasestorage.googleapis.com/v0/b/arpit-rangi.appspot.com/o/github.png?alt=media&token=be6b3b8b-cca6-4b48-bc2a-ea3f556d9f8e",
                                          fit: BoxFit.cover,
                                        )),
                                  ),
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                    )
                  : Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        InkWell(
                          onTap: () {},
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
                                        builder: (context) =>
                                            const MyAboutPage()),
                                  );
                                },
                                child: const Text("About",
                                    style: TextStyle(
                                      color: Colors.grey,
                                      fontSize: 18,
                                    ))),
                            TextButton(
                                onPressed: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            const MyEducationPage()),
                                  );
                                },
                                child: const Text("Education",
                                    style: TextStyle(
                                        color: Colors.grey, fontSize: 18))),
                            TextButton(
                                onPressed: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            const MyProjectsPage()),
                                  );
                                },
                                child: const Text("Projects",
                                    style: TextStyle(
                                        color: Colors.grey, fontSize: 18))),
                            TextButton(
                                onPressed: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                        const MyBlogsPage()),
                                  );
                                },
                                child: const Text("Blogs",
                                    style: TextStyle(
                                        color: Colors.grey, fontSize: 18))),
                            TextButton(
                                onPressed: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            const MyConnectPage()),
                                  );
                                },
                                child: const Text("Connect",
                                    style: TextStyle(
                                        color: Colors.grey, fontSize: 18))),
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsets.only(right: 8.0),
                          child: Row(
                            children: [
                              MouseRegion(
                                onEnter: (_) =>
                                    setState(() => isHoveredTwitter = true),
                                onExit: (_) =>
                                    setState(() => isHoveredTwitter = false),
                                child: AnimatedContainer(
                                  duration: const Duration(milliseconds: 300),
                                  decoration: BoxDecoration(
                                    borderRadius: const BorderRadius.all(
                                        Radius.circular(100)),
                                    boxShadow: isHoveredTwitter
                                        ? [
                                            BoxShadow(
                                              color:
                                                  Colors.grey.withOpacity(0.5),
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
                                          "https://x.com/arpit_rangi");
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
                                    borderRadius: const BorderRadius.all(
                                        Radius.circular(100)),
                                    boxShadow: isHoveredLinkedIn
                                        ? [
                                            BoxShadow(
                                              color:
                                                  Colors.grey.withOpacity(0.5),
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
                                onEnter: (_) =>
                                    setState(() => isHoveredGitHub = true),
                                onExit: (_) =>
                                    setState(() => isHoveredGitHub = false),
                                child: AnimatedContainer(
                                  duration: const Duration(milliseconds: 300),
                                  decoration: BoxDecoration(
                                    borderRadius: const BorderRadius.all(
                                        Radius.circular(100)),
                                    boxShadow: isHoveredGitHub
                                        ? [
                                            BoxShadow(
                                              color:
                                                  Colors.grey.withOpacity(0.5),
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
                                          "https://github.com/arangi0072");
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
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        const Text(
                          "Hi, everyone!\nI'm Arpit Rangi.",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 42,
                              fontWeight: FontWeight.bold),
                          textAlign: TextAlign.center,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 20.0),
                          child: SizedBox(
                            width: MediaQuery.of(context).size.width * 0.7,
                            child: const Text(
                              "Welcome to my profile. I'm a student and developer who loves to solve problems while helping others by leveraging DSA, Software Development, and Cloud Computing technologies.",
                              style: TextStyle(
                                  color: Color.fromRGBO(89, 89, 89, 1.0),
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ),
                        const SizedBox(height: 50),
                        SizedBox(
                          width: 300,
                          height: 300,
                          child: ClipOval(
                            child: Image.network(
                              "https://firebasestorage.googleapis.com/v0/b/arpit-rangi.appspot.com/o/me.jpeg?alt=media&token=b44e6e50-9882-4549-a47f-42e29ef3b847",
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        const SizedBox(height: 30),
                        MouseRegion(
                          onEnter: (_) => setState(() => box1 = true),
                          onExit: (_) => setState(() => box1 = false),
                          child: AnimatedContainer(
                            duration: const Duration(milliseconds: 300),
                            decoration: BoxDecoration(
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(100)),
                              boxShadow: box1
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
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          const MyConnectPage()),
                                );
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
                                        "Seeking contact? Let's connect! 💬",
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
                    onEnter: (_) => setState(() => box2 = true),
                    onExit: (_) => setState(() => box2 = false),
                    child: AnimatedContainer(
                      duration: const Duration(milliseconds: 300),
                      decoration: BoxDecoration(
                        borderRadius:
                        const BorderRadius.all(Radius.circular(100)),
                        boxShadow: box2
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
