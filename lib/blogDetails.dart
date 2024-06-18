import 'package:arpit_rangi/code_viewer.dart';
import 'package:arpit_rangi/connect.dart';
import 'package:arpit_rangi/education.dart';
import 'package:arpit_rangi/main.dart';
import 'package:arpit_rangi/projects.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:intl/intl.dart';
import 'package:url_launcher/url_launcher.dart';

import 'about.dart';

class MyBlogDetailPage extends StatefulWidget {
  const MyBlogDetailPage(
      {super.key, required this.node, required this.data});

  final String node;
  final Map<Object?, Object?> data;

  @override
  State<MyBlogDetailPage> createState() => _MyBlogDetailPageState();
}

class _MyBlogDetailPageState extends State<MyBlogDetailPage> {
  bool box2 = false;
  bool isHoveredTwitter = false;
  bool isHoveredLinkedIn = false;
  bool isHoveredGitHub = false;


  List<Widget> parseTextAndCode(String input) {
    List<Widget> widgets = [];
    RegExp regex = RegExp(r'(text-start|code-language|code-start|code-end)\s*(.*?)(?=(text-start|code-language|code-start|code-end|\Z))', dotAll: true);
    final matches = regex.allMatches(input);

    String? currentLanguage;
    widgets.add(SizedBox(height: 30,),);
    widgets.add(SizedBox(
      width: MediaQuery.of(context).size.width,
      height: 250,
      child: Center(
          child: Image.network(
            widget.data["logo"].toString(),
            fit: BoxFit.fitHeight,
          )),
    ),);
    widgets.add(SizedBox(height: 30,),);
    widgets.add(Text(
      widget.data["title"].toString(),
      style: const TextStyle(
          fontSize: 26,
          color: Colors.white,
          fontWeight: FontWeight.bold),
      textAlign: TextAlign.center,
    ),);
    widgets.add(SizedBox(height: 20,),);
    widgets.add(Container(
      width: double.infinity,
      height: 1,
      color: const Color.fromRGBO(61, 61, 61, 1.0),
    ),);
    widgets.add(SizedBox(height: 20,),);
    widgets.add(Padding(
      padding: const EdgeInsets.only(left: 8.0),
      child: SizedBox(
        width:
        MediaQuery.of(context).size.width * .95,
        child: const Text(
          "Media : ",
          style: TextStyle(
              fontSize: 22,
              color: Colors.white,
              fontWeight: FontWeight.bold),
          textAlign: TextAlign.start,
        ),
      ),
    ),);
    widgets.add(SizedBox(height: 30,),);
    widgets.add(
      Image.network(widget.data["media"].toString()),
    );
    widgets.add(SizedBox(height: 20,),);
    widgets.add(Container(
      width: double.infinity,
      height: 1,
      color: const Color.fromRGBO(61, 61, 61, 1.0),
    ),);
    widgets.add(SizedBox(height: 20,),);
    widgets.add(Padding(
      padding: const EdgeInsets.only(left: 8.0),
      child: SizedBox(
        width:
        MediaQuery.of(context).size.width * .95,
        child: const Text(
          "Link : ",
          style: TextStyle(
              fontSize: 22,
              color: Colors.white,
              fontWeight: FontWeight.bold),
          textAlign: TextAlign.start,
        ),
      ),
    ),);
    widgets.add(Padding(
      padding: const EdgeInsets.only(left: 8.0, top: 10),
      child: SizedBox(
        width:
        MediaQuery.of(context).size.width * .95,
        child: InkWell(
          onTap: (){
            final Uri uri = Uri.parse(
                widget.data["link"].toString());
            launchUrl(uri);
          },
          child: Text(
            widget.data["link"].toString(),
            style: const TextStyle(
              fontSize: 22,
              color: Colors.blue,
              fontStyle: FontStyle.italic,
              decoration: TextDecoration.underline,
              decorationColor: Colors.blue,
            ),
            textAlign: TextAlign.start,
          ),
        ),
      ),
    ),);
    widgets.add(SizedBox(height: 20,),);
    widgets.add(Container(
      width: double.infinity,
      height: 1,
      color: const Color.fromRGBO(61, 61, 61, 1.0),
    ),);
    widgets.add(SizedBox(height: 20,),);

    widgets.add(
      Padding(
        padding: const EdgeInsets.only(left: 8.0),
        child: SizedBox(
          width:
          MediaQuery.of(context).size.width * .95,
          child: const Text(
            "Info : ",
            style: TextStyle(
                fontSize: 22,
                color: Colors.white,
                fontWeight: FontWeight.bold),
            textAlign: TextAlign.start,
          ),
        ),
      ),
    );
    if (matches.length == 0){

      widgets.add(Padding(
        padding: const EdgeInsets.only(left: 8.0),
        child: SizedBox(
          width: MediaQuery.of(context).size.width * .95,
          child: Text(
            input.substring(10).replaceAll("\\n", "\n"),
            style: const TextStyle(
                fontSize: 16,
                color: Colors.white,),
          ),
        ),
      ),);
      widgets.add(
        SizedBox(height: 30,),
      );
      widgets.add(
        Padding(
          padding: const EdgeInsets.only(left: 8.0, top: 10),
          child: Text(
            DateFormat('MMMM d, yyyy – hh:mm a').format((widget.data["time"] as Timestamp).toDate()),
            style: const TextStyle(fontSize: 14, color: Colors.grey, fontWeight: FontWeight.bold),
            textAlign: TextAlign.center,
          ),
        ),
      );
      return widgets;
    }

    for (final match in matches) {
      String marker = match.group(1)!;
      String content = match.group(2)?.trim() ?? "";

      switch (marker) {
        case 'text-start':
          widgets.add(Padding(
            padding: const EdgeInsets.only(left: 8.0),
            child: SizedBox(
              width: MediaQuery.of(context).size.width * .95,
              child: SelectableText(
                content.replaceAll("\\n", "\n"),
                style: TextStyle(fontSize: 16, color: Colors.white),
              ),
            ),
          ));
          break;
        case 'code-start':
          widgets.add(CodeViewer(
            code: content.replaceAll("\\n", "\n"),
            language: currentLanguage ?? "plaintext",
          ));
          break;
        case 'code-language':
          currentLanguage = content;
          break;
        case 'code-end':
          break;
      }
    }
    widgets.add(
      Padding(
        padding: const EdgeInsets.only(left: 8.0, top: 10),
        child: Text(
          DateFormat('MMMM d, yyyy – hh:mm a').format((widget.data["time"] as Timestamp).toDate()),
          style: const TextStyle(fontSize: 14, color: Colors.grey, fontWeight: FontWeight.bold),
          textAlign: TextAlign.center,
        ),
      ),
    );

    return widgets;
  }


  @override
  Widget build(BuildContext context) {
    bool height = MediaQuery.of(context).size.width <= 600;
    return Scaffold(
      body: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: height
                ? SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  InkWell(
                    onTap: () {
                      Navigator.pushAndRemoveUntil(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const MyHomePage(
                              title: 'Home',
                            )),
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
                                fontSize: 18, ))),
                      TextButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          child: const Text("Blogs",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 20, fontWeight: FontWeight.bold))),
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
                              boxShadow: isHoveredTwitter
                                  ? [
                                BoxShadow(
                                  color:
                                  Colors.grey.withOpacity(0.5),
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
                                    "https://x.com/arpit_rangi");
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
                                  color:
                                  Colors.grey.withOpacity(0.5),
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
                          onEnter: (_) =>
                              setState(() => isHoveredGitHub = true),
                          onExit: (_) =>
                              setState(() => isHoveredGitHub = false),
                          child: AnimatedContainer(
                            duration: const Duration(milliseconds: 300),
                            decoration: BoxDecoration(
                              boxShadow: isHoveredGitHub
                                  ? [
                                BoxShadow(
                                  color:
                                  Colors.grey.withOpacity(0.5),
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
                                    "https://github.com/arangi0072");
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
            )
                : Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                InkWell(
                  onTap: () {
                    Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const MyHomePage(
                            title: 'Home',
                          )),
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
                              fontSize: 18, ))),
                    TextButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child: const Text("Blogs",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 20, fontWeight: FontWeight.bold))),
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
                                color: Colors.grey, fontSize: 18))),
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
              child: Stack(
                  children: [
                    Positioned(
                        top: 10,
                        left: 10,
                        child: IconButton(
                          icon: const Icon(Icons.arrow_back_sharp, color: Colors.white,size: 20,),
                          onPressed: () {
                            Navigator.pop(context);
                          },
                        )
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: height
                              ? Column(
                            // mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children:
                            parseTextAndCode(widget.data["info"].toString()),
                          )
                              : Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children:
                            parseTextAndCode(widget.data["info"].toString()),
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
                  ]
              ),
            ),
          ),
        ],
      ),
    );
  }
}
