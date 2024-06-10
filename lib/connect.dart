import 'package:arpit_rangi/education.dart';
import 'package:arpit_rangi/main.dart';
import 'package:arpit_rangi/projects.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:url_launcher/url_launcher.dart';

import 'about.dart';

class MyConnectPage extends StatefulWidget {
  const MyConnectPage({super.key});

  @override
  State<MyConnectPage> createState() => _MyConnectPageState();
}

class _MyConnectPageState extends State<MyConnectPage> {
  bool isHoveredTwitter = false;
  bool isHoveredLinkedIn = false;
  bool isHoveredGitHub = false;
  bool box1 = false;
  bool box2 = false;
  bool box3 = false;
  bool box4 = false;
  bool box5 = false;
  bool box6 = false;
  bool text1 = false;
  bool text2 = false;
  bool text3 = false;
  bool text4 = false;
  final TextEditingController _NameController = TextEditingController();
  final TextEditingController _MessageController = TextEditingController();
  final TextEditingController _SubjectController = TextEditingController();
  final TextEditingController _EmailController = TextEditingController();
  

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
                          onPressed: () {},
                          child: const Text("Connect",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 20, fontWeight: FontWeight.bold))),
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
                        onPressed: () {},
                        child: const Text("Connect",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 20, fontWeight: FontWeight.bold))),
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
                          "Connect",
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
                              "Connect with me through social media and other communication channels.",
                              style: TextStyle(
                                  color: Color.fromRGBO(89, 89, 89, 1.0),
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ),
                        SizedBox(height: 20,),
                        SizedBox(
                          width: MediaQuery.of(context).size.width * .93,
                          child: const Text("Name : ", style: TextStyle(fontSize: 18, color: Colors.white, fontWeight: FontWeight.bold),),
                        ),
                        SizedBox(height: 10,),
                        MouseRegion(
                          onEnter: (_) => setState(() => text1 = true),
                          onExit: (_) => setState(() => text1 = false),
                          child: AnimatedContainer(
                            duration: const Duration(milliseconds: 300),
                            decoration: BoxDecoration(
                              borderRadius: const BorderRadius.all(Radius.circular(5)),
                              boxShadow: text1
                                  ? [
                                BoxShadow(
                                  color:
                                  Colors.grey.withOpacity(0.5),
                                  spreadRadius: 7,
                                  blurRadius: 7,
                                  offset: const Offset(0, 0),
                                ),
                              ]
                                  : [],
                            ),
                            child: Container(
                              width:
                              MediaQuery.of(context).size.width *
                                  .93 -
                                  1,
                              // height: 180 - 1,
                              decoration: const BoxDecoration(
                                borderRadius: BorderRadius.all(
                                    Radius.circular(5)),
                                color: Colors.grey,
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(1.0),
                                child: Container(
                                  width:
                                  MediaQuery.of(context).size.width *
                                      .93 -
                                      1,
                                  // height: 180 - 1,
                                  decoration: const BoxDecoration(
                                    borderRadius: BorderRadius.all(
                                        Radius.circular(5)),
                                    color: Colors.black,
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.only(
                                      left: 10.0,),
                                    child: TextFormField(
                                      cursorColor: Colors.grey,
                                      maxLength: 64,
                                      controller: _NameController,
                                      // textInputAction: TextInputAction.next,
                                      style: TextStyle(
                                          fontSize: 16.0, color: Colors.grey),
                                      decoration: const InputDecoration(
                                        border: InputBorder.none,
                                        hintText: "Enter your name here (e.g. Arpit Rangi)",
                                        counterText: '',
                                        hintStyle: TextStyle(
                                            fontSize: 16.0,
                                            color: Colors.grey),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(height: 10,),
                        SizedBox(
                          width: MediaQuery.of(context).size.width * .93,
                          child: const Text("Email : ", style: TextStyle(fontSize: 18, color: Colors.white, fontWeight: FontWeight.bold),),
                        ),
                        SizedBox(height: 10,),
                        MouseRegion(
                          onEnter: (_) => setState(() => text2 = true),
                          onExit: (_) => setState(() => text2 = false),
                          child: AnimatedContainer(
                            duration: const Duration(milliseconds: 300),
                            decoration: BoxDecoration(
                              borderRadius: const BorderRadius.all(Radius.circular(5)),
                              boxShadow: text2
                                  ? [
                                BoxShadow(
                                  color:
                                  Colors.grey.withOpacity(0.5),
                                  spreadRadius: 7,
                                  blurRadius: 7,
                                  offset: const Offset(0, 0),
                                ),
                              ]
                                  : [],
                            ),
                            child: Container(
                              width:
                              MediaQuery.of(context).size.width *
                                  .93 -
                                  1,
                              // height: 180 - 1,
                              decoration: const BoxDecoration(
                                borderRadius: BorderRadius.all(
                                    Radius.circular(5)),
                                color: Colors.grey,
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(1.0),
                                child: Container(
                                  width:
                                  MediaQuery.of(context).size.width *
                                      .93 -
                                      1,
                                  // height: 180 - 1,
                                  decoration: const BoxDecoration(
                                    borderRadius: BorderRadius.all(
                                        Radius.circular(5)),
                                    color: Colors.black,
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.only(
                                      left: 10.0,),
                                    child: TextFormField(
                                      cursorColor: Colors.grey,
                                      maxLength: 64,
                                      controller: _EmailController,
                                      // textInputAction: TextInputAction.next,
                                      keyboardType: TextInputType.emailAddress,
                                      style: const TextStyle(
                                          fontSize: 16.0, color: Colors.grey),
                                      decoration: const InputDecoration(
                                        border: InputBorder.none,
                                        hintText: "Enter your email here (e.g. contact@arpitrangi.in)",
                                        counterText: '',
                                        hintStyle: TextStyle(
                                            fontSize: 16.0,
                                            color: Colors.grey),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(height: 10,),
                        SizedBox(
                          width: MediaQuery.of(context).size.width * .93,
                          child: const Text("Subject : ", style: TextStyle(fontSize: 18, color: Colors.white, fontWeight: FontWeight.bold),),
                        ),
                        SizedBox(height: 10,),
                        MouseRegion(
                          onEnter: (_) => setState(() => text3 = true),
                          onExit: (_) => setState(() => text3 = false),
                          child: AnimatedContainer(
                            duration: const Duration(milliseconds: 300),
                            decoration: BoxDecoration(
                              borderRadius: const BorderRadius.all(Radius.circular(5)),
                              boxShadow: text3
                                  ? [
                                BoxShadow(
                                  color:
                                  Colors.grey.withOpacity(0.5),
                                  spreadRadius: 7,
                                  blurRadius: 7,
                                  offset: const Offset(0, 0),
                                ),
                              ]
                                  : [],
                            ),
                            child: Container(
                              width:
                              MediaQuery.of(context).size.width *
                                  .93 -
                                  1,
                              // height: 180 - 1,
                              decoration: const BoxDecoration(
                                borderRadius: BorderRadius.all(
                                    Radius.circular(5)),
                                color: Colors.grey,
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(1.0),
                                child: Container(
                                  width:
                                  MediaQuery.of(context).size.width *
                                      .93 -
                                      1,
                                  // height: 180 - 1,
                                  decoration: const BoxDecoration(
                                    borderRadius: BorderRadius.all(
                                        Radius.circular(5)),
                                    color: Colors.black,
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.only(
                                      left: 10.0,),
                                    child: TextFormField(
                                      cursorColor: Colors.grey,
                                      maxLength: 64,
                                      controller: _SubjectController,
                                      // textInputAction: TextInputAction.next,
                                      style: const TextStyle(
                                          fontSize: 16.0, color: Colors.grey),
                                      decoration: const InputDecoration(
                                        border: InputBorder.none,
                                        hintText: "Enter your subject here (e.g. Just saying Hi!)",
                                        counterText: '',
                                        hintStyle: TextStyle(
                                            fontSize: 16.0,
                                            color: Colors.grey),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(height: 10,),
                        SizedBox(
                          width: MediaQuery.of(context).size.width * .93,
                          child: const Text("Message : ", style: TextStyle(fontSize: 18, color: Colors.white, fontWeight: FontWeight.bold),),
                        ),
                        SizedBox(height: 10,),
                        MouseRegion(
                          onEnter: (_) => setState(() => text4 = true),
                          onExit: (_) => setState(() => text4 = false),
                          child: AnimatedContainer(
                            duration: const Duration(milliseconds: 300),
                            decoration: BoxDecoration(
                              borderRadius: const BorderRadius.all(Radius.circular(5)),
                              boxShadow: text4
                                  ? [
                                BoxShadow(
                                  color:
                                  Colors.grey.withOpacity(0.5),
                                  spreadRadius: 7,
                                  blurRadius: 7,
                                  offset: const Offset(0, 0),
                                ),
                              ]
                                  : [],
                            ),
                            child: Container(
                              width:
                              MediaQuery.of(context).size.width *
                                  .93 -
                                  1,
                              height: 120,
                              decoration: const BoxDecoration(
                                borderRadius: BorderRadius.all(
                                    Radius.circular(5)),
                                color: Colors.grey,
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(1.0),
                                child: Container(
                                  width:
                                  MediaQuery.of(context).size.width *
                                      .93 -
                                      1,
                                  height: 120 - 1,
                                  decoration: const BoxDecoration(
                                    borderRadius: BorderRadius.all(
                                        Radius.circular(5)),
                                    color: Colors.black,
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.only(
                                      left: 10.0,),
                                    child: TextField(
                                        cursorColor: Colors.grey,
                                        maxLines: 5000,
                                        controller: _MessageController,
                                        style: const TextStyle(
                                            fontSize: 16.0, color: Colors.grey),
                                        decoration: const InputDecoration(
                                          border: InputBorder.none,
                                          hintText: "Enter your message here (e.g. Hello Arpit! I'd like to say Hi!)",
                                          counterText: '',
                                          hintStyle: TextStyle(
                                              fontSize: 16.0,
                                              color: Colors.grey),
                                        ),
                                      ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(height: 20,),
                        SizedBox(
                          width: MediaQuery.of(context).size.width * .93,
                          child: Center(
                            child: MouseRegion(
                              onEnter: (_) => setState(() => box5 = true),
                              onExit: (_) => setState(() => box5 = false),
                              child: AnimatedContainer(
                                duration: const Duration(milliseconds: 300),
                                decoration: BoxDecoration(
                                  borderRadius: const BorderRadius.all(Radius.circular(5)),
                                  boxShadow: box5
                                      ? [
                                    BoxShadow(
                                      color:
                                      Colors.grey.withOpacity(0.5),
                                      spreadRadius: 7,
                                      blurRadius: 7,
                                      offset: const Offset(0, 0),
                                    ),
                                  ]
                                      : [],
                                ),
                                child: InkWell(
                                  onTap: () async {
                                    showDialog(
                                      context: context,
                                      builder: (BuildContext context) {
                                        return Center(
                                          child: Container(
                                              width: 150,
                                              height: 150,
                                              decoration: const BoxDecoration(
                                                color: Colors.transparent,
                                              ),
                                              child: const CircularProgressIndicator(color: Colors.white,)
                                          ),
                                        );
                                      },
                                    );
                                    await Firebase.initializeApp(
                                        options: const FirebaseOptions(
                                          apiKey: '',
                                          appId: '',
                                          messagingSenderId: '',
                                          projectId: '',
                                          storageBucket: '',
                                        ));
                                    final databaseReference = FirebaseDatabase.instanceFor(
                                        app: Firebase.app(),
                                        databaseURL:
                                        'database_url').reference().child("msg");
                                    databaseReference.push().set({
                                      'name': (_NameController.text.trim()),
                                      'subject': _SubjectController.text.trim(),
                                      'email': _EmailController.text.trim(),
                                      'message': _MessageController.text.trim(),
                                    }).then((_) {
                                      Navigator.pop(context);
                                      Fluttertoast.showToast(
                                          msg: "Message sent!",
                                          toastLength: Toast.LENGTH_LONG,
                                          gravity: ToastGravity.BOTTOM,
                                          timeInSecForIosWeb: 1,
                                          backgroundColor: Colors.grey,
                                          textColor: Colors.white,
                                          fontSize: 16.0);
                                    }).catchError((error) {
                                      print(error);
                                      Navigator.pop(context);
                                      Fluttertoast.showToast(
                                          msg: "Something went wrong!",
                                          toastLength: Toast.LENGTH_LONG,
                                          gravity: ToastGravity.BOTTOM,
                                          timeInSecForIosWeb: 1,
                                          backgroundColor: Colors.grey,
                                          textColor: Colors.white,
                                          fontSize: 16.0);
                                    });
                                  },
                                  child: Container(
                                    decoration: const BoxDecoration(
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(5)),
                                      color: Colors.grey,
                                    ),
                                    child: Padding(
                                      padding: const EdgeInsets.all(1.0),
                                      child: Container(
                                        decoration: const BoxDecoration(
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(5)),
                                          color: Colors.black,
                                        ),
                                        child: const Padding(
                                            padding: EdgeInsets.only(
                                                left: 30.0, right: 30, top: 5, bottom: 5),
                                            child: Text("Submit", style: TextStyle(fontSize: 18, color: Colors.white),)
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(height: 10,),
                        Container(
                          width: double.infinity,
                          height: 1,
                          color: const Color.fromRGBO(61, 61, 61, 1.0),
                        ),
                        SizedBox(height: 10,),
                        Padding(
                          padding: const EdgeInsets.only(top: 10.0),
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
                              child: InkWell(
                                onTap: () {
                                  final Uri uri = Uri.parse(
                                      "mailto:arpitrangi72@gmail.com");
                                  launchUrl(uri);
                                },
                                child:  Container(
                                  width:
                                  MediaQuery.of(context).size.width * .93,
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
                                          .93 -
                                          1,
                                      height: 180 - 1,
                                      decoration: const BoxDecoration(
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(15)),
                                        color: Colors.black,
                                      ),
                                      child: Column(
                                        mainAxisAlignment:
                                        MainAxisAlignment.center,
                                        children: [
                                          Padding(
                                            padding:
                                            const EdgeInsets.all(10.0),
                                            child: SizedBox(
                                                height: 50,
                                                child: Image.network(
                                                  "https://firebasestorage.googleapis.com/v0/b/arpit-rangi.appspot.com/o/email.png?alt=media&token=7c024b99-c7ad-4889-b3a6-5f24a50fed0a",
                                                  fit: BoxFit.fitHeight,
                                                )),
                                          ),
                                          // SizedBox(height: 5,),
                                          Text("Email", style: TextStyle(fontSize: 20, color: Colors.grey, fontWeight: FontWeight.bold),),
                                          SizedBox(height: 5,),
                                          Padding(
                                            padding: const EdgeInsets.only(left: 3.0, right: 3),
                                            child: Text("arpitrangi72@gmail.com", style: TextStyle(fontSize: 16, color: Colors.grey,),),
                                          ),
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
                              child:  InkWell(
                                onTap: (){
                                  final Uri uri = Uri.parse(
                                      "https://x.com/arpit_rangi");
                                  launchUrl(uri);
                                },
                                child: Container(
                                  width:
                                  MediaQuery.of(context).size.width * .93,
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
                                          .93 -
                                          1,
                                      height: 180 - 1,
                                      decoration: const BoxDecoration(
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(15)),
                                        color: Colors.black,
                                      ),
                                      child: Column(
                                        mainAxisAlignment:
                                        MainAxisAlignment.center,
                                        children: [
                                          Padding(
                                            padding:
                                            const EdgeInsets.all(10.0),
                                            child: SizedBox(
                                                height: 50,
                                                child: Image.network(
                                                  "https://firebasestorage.googleapis.com/v0/b/arpit-rangi.appspot.com/o/x.png?alt=media&token=2743e138-4899-43bf-8375-0784e0401087",
                                                  fit: BoxFit.fitHeight,
                                                )),
                                          ),
                                          // SizedBox(height: 5,),
                                          Text("X", style: TextStyle(fontSize: 20, color: Colors.grey, fontWeight: FontWeight.bold),),
                                          SizedBox(height: 5,),
                                          Padding(
                                            padding: const EdgeInsets.only(left: 3.0, right: 3),
                                            child: Text("arpit_rangi", style: TextStyle(fontSize: 16, color: Colors.grey,),),
                                          ),
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
                              child:  InkWell(
                                onTap: (){
                                  final Uri uri = Uri.parse(
                                      "https://www.linkedin.com/in/arpit-rangi-37957428b/");
                                  launchUrl(uri);
                                },
                                child: Container(
                                  width:
                                  MediaQuery.of(context).size.width * .93,
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
                                          .93 -
                                          1,
                                      height: 180 - 1,
                                      decoration: const BoxDecoration(
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(15)),
                                        color: Colors.black,
                                      ),
                                      child: Column(
                                        mainAxisAlignment:
                                        MainAxisAlignment.center,
                                        children: [
                                          Padding(
                                            padding:
                                            const EdgeInsets.all(10.0),
                                            child: SizedBox(
                                                height: 50,
                                                child: Image.network(
                                                  "https://firebasestorage.googleapis.com/v0/b/arpit-rangi.appspot.com/o/linkedin.png?alt=media&token=1be5a9ba-974f-43ca-ba84-427874a21170",
                                                  fit: BoxFit.fitHeight,
                                                )),
                                          ),
                                          // SizedBox(height: 5,),
                                          const Text("LinkedIn", style: TextStyle(fontSize: 20, color: Colors.grey, fontWeight: FontWeight.bold),),
                                          const SizedBox(height: 5,),
                                          const Padding(
                                            padding: EdgeInsets.only(left: 3.0, right: 3),
                                            child: Text("in/arpit-rangi", style: TextStyle(fontSize: 16, color: Colors.grey,),),
                                          ),
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
                              child: InkWell(
                                onTap: (){
                                  final Uri uri = Uri.parse(
                                      "https://github.com/arangi0072");
                                  launchUrl(uri);
                                },
                                child: Container(
                                  width:
                                  MediaQuery.of(context).size.width * .93,
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
                                          .93 -
                                          1,
                                      height: 180 - 1,
                                      decoration: const BoxDecoration(
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(15)),
                                        color: Colors.black,
                                      ),
                                      child: Column(
                                        mainAxisAlignment:
                                        MainAxisAlignment.center,
                                        children: [
                                          Padding(
                                            padding:
                                            const EdgeInsets.all(10.0),
                                            child: SizedBox(
                                                height: 50,
                                                child: Image.network(
                                                  "https://firebasestorage.googleapis.com/v0/b/arpit-rangi.appspot.com/o/github.png?alt=media&token=be6b3b8b-cca6-4b48-bc2a-ea3f556d9f8e",
                                                  fit: BoxFit.fitHeight,
                                                )),
                                          ),
                                          // SizedBox(height: 5,),
                                          const Text("GitHub", style: TextStyle(fontSize: 20, color: Colors.grey, fontWeight: FontWeight.bold),),
                                          const SizedBox(height: 5,),
                                          const Padding(
                                            padding: EdgeInsets.only(left: 3.0, right: 3),
                                            child: Text("arangi0072", style: TextStyle(fontSize: 16, color: Colors.grey,),),
                                          ),
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
                    ) : Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        const Text(
                          "Connect",
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
                              "Connect with me through social media and other communication channels.",
                              style: TextStyle(
                                  color: Color.fromRGBO(89, 89, 89, 1.0),
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ),
                        Row(
                          // mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            SizedBox(
                              width: MediaQuery.of(context).size.width * .60,
                              child: Padding(
                                padding: const EdgeInsets.only(right: 10.0),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    SizedBox(height: 20,),
                                    SizedBox(
                                      width: MediaQuery.of(context).size.width * .55,
                                      child: const Text("Name : ", style: TextStyle(fontSize: 18, color: Colors.white, fontWeight: FontWeight.bold),),
                                    ),
                                    SizedBox(height: 10,),
                                    MouseRegion(
                                      onEnter: (_) => setState(() => text1 = true),
                                      onExit: (_) => setState(() => text1 = false),
                                      child: AnimatedContainer(
                                        duration: const Duration(milliseconds: 300),
                                        decoration: BoxDecoration(
                                          borderRadius: const BorderRadius.all(Radius.circular(5)),
                                          boxShadow: text1
                                              ? [
                                            BoxShadow(
                                              color:
                                              Colors.grey.withOpacity(0.5),
                                              spreadRadius: 7,
                                              blurRadius: 7,
                                              offset: const Offset(0, 0),
                                            ),
                                          ]
                                              : [],
                                        ),
                                        child: Container(
                                          width:
                                          MediaQuery.of(context).size.width *
                                              .55 -
                                              1,
                                          // height: 180 - 1,
                                          decoration: const BoxDecoration(
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(5)),
                                            color: Colors.grey,
                                          ),
                                          child: Padding(
                                            padding: const EdgeInsets.all(1.0),
                                            child: Container(
                                              width:
                                              MediaQuery.of(context).size.width *
                                                  .55 -
                                                  1,
                                              // height: 180 - 1,
                                              decoration: const BoxDecoration(
                                                borderRadius: BorderRadius.all(
                                                    Radius.circular(5)),
                                                color: Colors.black,
                                              ),
                                              child: Padding(
                                                padding: const EdgeInsets.only(
                                                    left: 10.0,),
                                                child: TextFormField(
                                                  cursorColor: Colors.grey,
                                                  maxLength: 64,
                                                  controller: _NameController,
                                                  // textInputAction: TextInputAction.next,
                                                  style: TextStyle(
                                                      fontSize: 16.0, color: Colors.grey),
                                                  decoration: const InputDecoration(
                                                      border: InputBorder.none,
                                                      hintText: "Enter your name here (e.g. Arpit Rangi)",
                                                      counterText: '',
                                                      hintStyle: TextStyle(
                                                          fontSize: 16.0,
                                                          color: Colors.grey),
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                    SizedBox(height: 10,),
                                    SizedBox(
                                      width: MediaQuery.of(context).size.width * .55,
                                      child: const Text("Email : ", style: TextStyle(fontSize: 18, color: Colors.white, fontWeight: FontWeight.bold),),
                                    ),
                                    SizedBox(height: 10,),
                                    MouseRegion(
                                      onEnter: (_) => setState(() => text2 = true),
                                      onExit: (_) => setState(() => text2 = false),
                                      child: AnimatedContainer(
                                        duration: const Duration(milliseconds: 300),
                                        decoration: BoxDecoration(
                                          borderRadius: const BorderRadius.all(Radius.circular(5)),
                                          boxShadow: text2
                                              ? [
                                            BoxShadow(
                                              color:
                                              Colors.grey.withOpacity(0.5),
                                              spreadRadius: 7,
                                              blurRadius: 7,
                                              offset: const Offset(0, 0),
                                            ),
                                          ]
                                              : [],
                                        ),
                                        child: Container(
                                          width:
                                          MediaQuery.of(context).size.width *
                                              .55 -
                                              1,
                                          // height: 180 - 1,
                                          decoration: const BoxDecoration(
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(5)),
                                            color: Colors.grey,
                                          ),
                                          child: Padding(
                                            padding: const EdgeInsets.all(1.0),
                                            child: Container(
                                              width:
                                              MediaQuery.of(context).size.width *
                                                  .55 -
                                                  1,
                                              // height: 180 - 1,
                                              decoration: const BoxDecoration(
                                                borderRadius: BorderRadius.all(
                                                    Radius.circular(5)),
                                                color: Colors.black,
                                              ),
                                              child: Padding(
                                                padding: const EdgeInsets.only(
                                                  left: 10.0,),
                                                child: TextFormField(
                                                  cursorColor: Colors.grey,
                                                  maxLength: 64,
                                                  controller: _EmailController,
                                                  // textInputAction: TextInputAction.next,
                                                  keyboardType: TextInputType.emailAddress,
                                                  style: const TextStyle(
                                                      fontSize: 16.0, color: Colors.grey),
                                                  decoration: const InputDecoration(
                                                    border: InputBorder.none,
                                                    hintText: "Enter your email here (e.g. contact@arpitrangi.in)",
                                                    counterText: '',
                                                    hintStyle: TextStyle(
                                                        fontSize: 16.0,
                                                        color: Colors.grey),
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                    SizedBox(height: 10,),
                                    SizedBox(
                                      width: MediaQuery.of(context).size.width * .55,
                                      child: const Text("Subject : ", style: TextStyle(fontSize: 18, color: Colors.white, fontWeight: FontWeight.bold),),
                                    ),
                                    SizedBox(height: 10,),
                                    MouseRegion(
                                      onEnter: (_) => setState(() => text3 = true),
                                      onExit: (_) => setState(() => text3 = false),
                                      child: AnimatedContainer(
                                        duration: const Duration(milliseconds: 300),
                                        decoration: BoxDecoration(
                                          borderRadius: const BorderRadius.all(Radius.circular(5)),
                                          boxShadow: text3
                                              ? [
                                            BoxShadow(
                                              color:
                                              Colors.grey.withOpacity(0.5),
                                              spreadRadius: 7,
                                              blurRadius: 7,
                                              offset: const Offset(0, 0),
                                            ),
                                          ]
                                              : [],
                                        ),
                                        child: Container(
                                          width:
                                          MediaQuery.of(context).size.width *
                                              .55 -
                                              1,
                                          // height: 180 - 1,
                                          decoration: const BoxDecoration(
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(5)),
                                            color: Colors.grey,
                                          ),
                                          child: Padding(
                                            padding: const EdgeInsets.all(1.0),
                                            child: Container(
                                              width:
                                              MediaQuery.of(context).size.width *
                                                  .55 -
                                                  1,
                                              // height: 180 - 1,
                                              decoration: const BoxDecoration(
                                                borderRadius: BorderRadius.all(
                                                    Radius.circular(5)),
                                                color: Colors.black,
                                              ),
                                              child: Padding(
                                                padding: const EdgeInsets.only(
                                                  left: 10.0,),
                                                child: TextFormField(
                                                  cursorColor: Colors.grey,
                                                  maxLength: 64,
                                                  controller: _SubjectController,
                                                  // textInputAction: TextInputAction.next,
                                                  style: const TextStyle(
                                                      fontSize: 16.0, color: Colors.grey),
                                                  decoration: const InputDecoration(
                                                    border: InputBorder.none,
                                                    hintText: "Enter your subject here (e.g. Just saying Hi!)",
                                                    counterText: '',
                                                    hintStyle: TextStyle(
                                                        fontSize: 16.0,
                                                        color: Colors.grey),
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                    SizedBox(height: 10,),
                                    SizedBox(
                                      width: MediaQuery.of(context).size.width * .55,
                                      child: const Text("Message : ", style: TextStyle(fontSize: 18, color: Colors.white, fontWeight: FontWeight.bold),),
                                    ),
                                    SizedBox(height: 10,),
                                    MouseRegion(
                                      onEnter: (_) => setState(() => text4 = true),
                                      onExit: (_) => setState(() => text4 = false),
                                      child: AnimatedContainer(
                                        duration: const Duration(milliseconds: 300),
                                        decoration: BoxDecoration(
                                          borderRadius: const BorderRadius.all(Radius.circular(5)),
                                          boxShadow: text4
                                              ? [
                                            BoxShadow(
                                              color:
                                              Colors.grey.withOpacity(0.5),
                                              spreadRadius: 7,
                                              blurRadius: 7,
                                              offset: const Offset(0, 0),
                                            ),
                                          ]
                                              : [],
                                        ),
                                        child: Container(
                                          width:
                                          MediaQuery.of(context).size.width *
                                              .55 -
                                              1,
                                          height: 120,
                                          decoration: const BoxDecoration(
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(5)),
                                            color: Colors.grey,
                                          ),
                                          child: Padding(
                                            padding: const EdgeInsets.all(1.0),
                                            child: Container(
                                              width:
                                              MediaQuery.of(context).size.width *
                                                  .55 -
                                                  1,
                                              height: 120 - 1,
                                              decoration: const BoxDecoration(
                                                borderRadius: BorderRadius.all(
                                                    Radius.circular(5)),
                                                color: Colors.black,
                                              ),
                                              child: Padding(
                                                padding: const EdgeInsets.only(
                                                  left: 10.0,),
                                                child:
                                                TextField(
                                                    cursorColor: Colors.grey,
                                                    maxLines: 5000,
                                                    controller: _MessageController,
                                                    style: const TextStyle(
                                                        fontSize: 16.0, color: Colors.grey),
                                                    decoration: const InputDecoration(
                                                      border: InputBorder.none,
                                                      hintText: "Enter your message here (e.g. Hello Arpit! I'd like to say Hi!)",
                                                      counterText: '',
                                                      hintStyle: TextStyle(
                                                          fontSize: 16.0,
                                                          color: Colors.grey),
                                                    ),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                    SizedBox(height: 20,),
                                    SizedBox(
                                      width: MediaQuery.of(context).size.width * .55,
                                      child: Center(
                                        child: MouseRegion(
                                          onEnter: (_) => setState(() => box5 = true),
                                          onExit: (_) => setState(() => box5 = false),
                                          child: AnimatedContainer(
                                            duration: const Duration(milliseconds: 300),
                                            decoration: BoxDecoration(
                                              borderRadius: const BorderRadius.all(Radius.circular(5)),
                                              boxShadow: box5
                                                  ? [
                                                BoxShadow(
                                                  color:
                                                  Colors.grey.withOpacity(0.5),
                                                  spreadRadius: 7,
                                                  blurRadius: 7,
                                                  offset: const Offset(0, 0),
                                                ),
                                              ]
                                                  : [],
                                            ),
                                            child: InkWell(
                                              onTap: () async {
                                                showDialog(
                                                  context: context,
                                                  builder: (BuildContext context) {
                                                    return Center(
                                                      child: Container(
                                                        width: 150,
                                                        height: 150,
                                                        decoration: const BoxDecoration(
                                                          color: Colors.transparent,
                                                        ),
                                                        child: const CircularProgressIndicator(color: Colors.white,)
                                                      ),
                                                    );
                                                  },
                                                );
                                                await Firebase.initializeApp(
                                                    options: const FirebaseOptions(
                                                      apiKey: '',
                                                      appId: '',
                                                      messagingSenderId: '',
                                                      projectId: '',
                                                      storageBucket: '',
                                                    ));
                                                final databaseReference = FirebaseDatabase.instanceFor(
                                                    app: Firebase.app(),
                                                    databaseURL:
                                                    'database_url').reference().child("msg");
                                                databaseReference.push().set({
                                                  'name': (_NameController.text.trim()),
                                                  'subject': _SubjectController.text.trim(),
                                                  'email': _EmailController.text.trim(),
                                                  'message': _MessageController.text.trim(),
                                                }).then((_) {
                                                  Navigator.pop(context);
                                                  Fluttertoast.showToast(
                                                      msg: "Message sent!",
                                                      toastLength: Toast.LENGTH_LONG,
                                                      gravity: ToastGravity.BOTTOM,
                                                      timeInSecForIosWeb: 1,
                                                      backgroundColor: Colors.grey,
                                                      textColor: Colors.white,
                                                      fontSize: 16.0);
                                                }).catchError((error) {
                                                  print(error);
                                                  Navigator.pop(context);
                                                  Fluttertoast.showToast(
                                                      msg: "Something went wrong!",
                                                      toastLength: Toast.LENGTH_LONG,
                                                      gravity: ToastGravity.BOTTOM,
                                                      timeInSecForIosWeb: 1,
                                                      backgroundColor: Colors.grey,
                                                      textColor: Colors.white,
                                                      fontSize: 16.0);
                                                });
                                              },
                                              child: Container(
                                                decoration: const BoxDecoration(
                                                  borderRadius: BorderRadius.all(
                                                      Radius.circular(5)),
                                                  color: Colors.grey,
                                                ),
                                                child: Padding(
                                                  padding: const EdgeInsets.all(1.0),
                                                  child: Container(
                                                    decoration: const BoxDecoration(
                                                      borderRadius: BorderRadius.all(
                                                          Radius.circular(5)),
                                                      color: Colors.black,
                                                    ),
                                                    child: const Padding(
                                                      padding: EdgeInsets.only(
                                                        left: 30.0, right: 30, top: 5, bottom: 5),
                                                      child: Text("Submit", style: TextStyle(fontSize: 18, color: Colors.white),)
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ),
                            SizedBox(
                              width: MediaQuery.of(context).size.width * .38,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        left: 15.0, right: 15,),
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
                                                child: InkWell(
                                                  onTap: () {
                                                    final Uri uri = Uri.parse(
                                                        "mailto:arpitrangi72@gmail.com");
                                                    launchUrl(uri);
                                                  },
                                                child:  Container(
                                                  width:
                                                  MediaQuery.of(context).size.width * .15,
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
                                                          .15 -
                                                          1,
                                                      height: 180 - 1,
                                                      decoration: const BoxDecoration(
                                                        borderRadius: BorderRadius.all(
                                                            Radius.circular(15)),
                                                        color: Colors.black,
                                                      ),
                                                      child: Column(
                                                        mainAxisAlignment:
                                                        MainAxisAlignment.center,
                                                        children: [
                                                          Padding(
                                                            padding:
                                                            const EdgeInsets.all(10.0),
                                                              child: SizedBox(
                                                                  height: 50,
                                                                  child: Image.network(
                                                                    "https://firebasestorage.googleapis.com/v0/b/arpit-rangi.appspot.com/o/email.png?alt=media&token=7c024b99-c7ad-4889-b3a6-5f24a50fed0a",
                                                                    fit: BoxFit.fitHeight,
                                                                  )),
                                                          ),
                                                          // SizedBox(height: 5,),
                                                          Text("Email", style: TextStyle(fontSize: 20, color: Colors.grey, fontWeight: FontWeight.bold),),
                                                          SizedBox(height: 5,),
                                                          Padding(
                                                            padding: const EdgeInsets.only(left: 3.0, right: 3),
                                                            child: Text("arpitrangi72@gmail.com", style: TextStyle(fontSize: 16, color: Colors.grey,),),
                                                          ),
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
                                                child:  InkWell(
                                                  onTap: (){
                                                    final Uri uri = Uri.parse(
                                                        "https://x.com/arpit_rangi");
                                                    launchUrl(uri);
                                                  },
                                                  child: Container(
                                                    width:
                                                    MediaQuery.of(context).size.width * .15,
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
                                                            .15 -
                                                            1,
                                                        height: 180 - 1,
                                                        decoration: const BoxDecoration(
                                                          borderRadius: BorderRadius.all(
                                                              Radius.circular(15)),
                                                          color: Colors.black,
                                                        ),
                                                        child: Column(
                                                          mainAxisAlignment:
                                                          MainAxisAlignment.center,
                                                          children: [
                                                            Padding(
                                                              padding:
                                                              const EdgeInsets.all(10.0),
                                                              child: SizedBox(
                                                                  height: 50,
                                                                  child: Image.network(
                                                                    "https://firebasestorage.googleapis.com/v0/b/arpit-rangi.appspot.com/o/x.png?alt=media&token=2743e138-4899-43bf-8375-0784e0401087",
                                                                    fit: BoxFit.fitHeight,
                                                                  )),
                                                            ),
                                                            // SizedBox(height: 5,),
                                                            Text("X", style: TextStyle(fontSize: 20, color: Colors.grey, fontWeight: FontWeight.bold),),
                                                            SizedBox(height: 5,),
                                                            Padding(
                                                              padding: const EdgeInsets.only(left: 3.0, right: 3),
                                                              child: Text("arpit_rangi", style: TextStyle(fontSize: 16, color: Colors.grey,),),
                                                            ),
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
                                        left: 15.0, right: 15, top: 30),
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
                                                child:  InkWell(
                                                  onTap: (){
                                                    final Uri uri = Uri.parse(
                                                        "https://www.linkedin.com/in/arpit-rangi-37957428b/");
                                                    launchUrl(uri);
                                                  },
                                                  child: Container(
                                                    width:
                                                    MediaQuery.of(context).size.width * .15,
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
                                                            .15 -
                                                            1,
                                                        height: 180 - 1,
                                                        decoration: const BoxDecoration(
                                                          borderRadius: BorderRadius.all(
                                                              Radius.circular(15)),
                                                          color: Colors.black,
                                                        ),
                                                        child: Column(
                                                          mainAxisAlignment:
                                                          MainAxisAlignment.center,
                                                          children: [
                                                            Padding(
                                                              padding:
                                                              const EdgeInsets.all(10.0),
                                                              child: SizedBox(
                                                                  height: 50,
                                                                  child: Image.network(
                                                                    "https://firebasestorage.googleapis.com/v0/b/arpit-rangi.appspot.com/o/linkedin.png?alt=media&token=1be5a9ba-974f-43ca-ba84-427874a21170",
                                                                    fit: BoxFit.fitHeight,
                                                                  )),
                                                            ),
                                                            // SizedBox(height: 5,),
                                                            const Text("LinkedIn", style: TextStyle(fontSize: 20, color: Colors.grey, fontWeight: FontWeight.bold),),
                                                            const SizedBox(height: 5,),
                                                            const Padding(
                                                              padding: EdgeInsets.only(left: 3.0, right: 3),
                                                              child: Text("in/arpit-rangi", style: TextStyle(fontSize: 16, color: Colors.grey,),),
                                                            ),
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
                                                child: InkWell(
                                                  onTap: (){
                                                    final Uri uri = Uri.parse(
                                                        "https://github.com/arangi0072");
                                                    launchUrl(uri);
                                                  },
                                                  child: Container(
                                                    width:
                                                    MediaQuery.of(context).size.width * .15,
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
                                                            .15 -
                                                            1,
                                                        height: 180 - 1,
                                                        decoration: const BoxDecoration(
                                                          borderRadius: BorderRadius.all(
                                                              Radius.circular(15)),
                                                          color: Colors.black,
                                                        ),
                                                        child: Column(
                                                          mainAxisAlignment:
                                                          MainAxisAlignment.center,
                                                          children: [
                                                            Padding(
                                                              padding:
                                                              const EdgeInsets.all(10.0),
                                                              child: SizedBox(
                                                                  height: 50,
                                                                  child: Image.network(
                                                                    "https://firebasestorage.googleapis.com/v0/b/arpit-rangi.appspot.com/o/github.png?alt=media&token=be6b3b8b-cca6-4b48-bc2a-ea3f556d9f8e",
                                                                    fit: BoxFit.fitHeight,
                                                                  )),
                                                            ),
                                                            // SizedBox(height: 5,),
                                                            const Text("GitHub", style: TextStyle(fontSize: 20, color: Colors.grey, fontWeight: FontWeight.bold),),
                                                            const SizedBox(height: 5,),
                                                            const Padding(
                                                              padding: EdgeInsets.only(left: 3.0, right: 3),
                                                              child: Text("arangi0072", style: TextStyle(fontSize: 16, color: Colors.grey,),),
                                                            ),
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
                                ],
                              ),
                            ),
                          ],
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
                    onEnter: (_) => setState(() => box6 = true),
                    onExit: (_) => setState(() => box6 = false),
                    child: AnimatedContainer(
                      duration: const Duration(milliseconds: 300),
                      decoration: BoxDecoration(
                        borderRadius:
                        const BorderRadius.all(Radius.circular(100)),
                        boxShadow: box6
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
