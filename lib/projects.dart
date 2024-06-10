import 'package:arpit_rangi/education.dart';
import 'package:arpit_rangi/main.dart';
import 'package:arpit_rangi/projectDetails.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:url_launcher/url_launcher.dart';

import 'about.dart';
import 'connect.dart';

class MyProjectsPage extends StatefulWidget {
  const MyProjectsPage({super.key});

  @override
  State<MyProjectsPage> createState() => _MyProjectsPageState();
}

class _MyProjectsPageState extends State<MyProjectsPage> {
  bool box2 = false;
  bool isHoveredTwitter = false;
  bool isHoveredLinkedIn = false;
  bool isHoveredGitHub = false;
  Query databaseReference = FirebaseDatabase.instanceFor(
      app: Firebase.app(),
      databaseURL:
      'https://arpit-rangi-default-rtdb.asia-southeast1.firebasedatabase.app/')
      .reference()
      .child('projects')
      .orderByKey();

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
                          },
                          child: const Text("Projects",
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
                        },
                        child: const Text("Projects",
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
                          "Featured Projects",
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
                              "Check out some of the projects I've worked on.",
                              style: TextStyle(
                                  color: Color.fromRGBO(89, 89, 89, 1.0),
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ),
                        SizedBox(
                            height: MediaQuery.of(context).size.height * .80,
                            width: MediaQuery.of(context).size.width,
                            child: StreamBuilder<DatabaseEvent>(
                              stream: databaseReference.onValue,
                              builder: (context, snapshot) {
                                if (snapshot.hasError) {
                                  return Text('Error: ${snapshot.error}', style: TextStyle(color: Colors.white));
                                }
                                if (!snapshot.hasData) {
                                  return SizedBox(
                                    width: MediaQuery.of(context).size.width,
                                    height: MediaQuery.of(context).size.height * .95,
                                    child: Center(child: CircularProgressIndicator()),
                                  );
                                } else if (snapshot.data?.snapshot.value == null) {
                                  return SizedBox(
                                    width: MediaQuery.of(context).size.width,
                                    height: MediaQuery.of(context).size.height * .95,
                                    child: const Center(
                                      child: Text(
                                        "No Data Found.",
                                        style: TextStyle(fontSize: 24, color: Colors.white),
                                      ),
                                    ),
                                  );
                                }

                                final data = snapshot.data!.snapshot.value as Map<Object?, Object?>;
                                // print(data.toString());
                                final items = data.entries
                                    .map((entry) => {entry.key: entry.value})
                                    .toList();


                                return LayoutBuilder(
                                    builder: (context, constraints) {
                                      int columns = (constraints.maxWidth ~/
                                          (MediaQuery.of(context).size.width * 0.20)); // Adjust the 200 value as needed
                                      if (columns == 0) columns = 1;
                                      double z = 0.73;
                                      if (MediaQuery.of(context).size.width <= 1024 && MediaQuery.of(context).size.width > 770){
                                        z = 0.63;
                                        columns = 3;
                                      }else if (MediaQuery.of(context).size.width <= 768 && MediaQuery.of(context).size.width > 430){
                                        z = 0.4;
                                        columns = 3;
                                      }else if (MediaQuery.of(context).size.width <= 430 && MediaQuery.of(context).size.width > 375){
                                        z = 0.72;
                                        columns = 1;
                                      }else if (MediaQuery.of(context).size.width <= 375 && MediaQuery.of(context).size.width > 320){
                                        z = 0.52;
                                        columns = 1;
                                      }else if ( MediaQuery.of(context).size.width <= 320){
                                        z = 0.42;
                                        columns = 1;
                                      }

                                      return Padding(
                                        padding: const EdgeInsets.only(top: 10.0),
                                        child: SizedBox(
                                          height: MediaQuery.of(context).size.height *.9,
                                            child: CardItem(itemData: items, height: height,)
                                        ),
                                      );
                                    }
                                );
                              },
                            )
                        )
                      ],
                    ) : Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        const Text(
                          "Featured Projects",
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
                              "Check out some of the projects I've worked on.",
                              style: TextStyle(
                                  color: Color.fromRGBO(89, 89, 89, 1.0),
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).size.height * .80,
                          width: MediaQuery.of(context).size.width,
                          child: StreamBuilder<DatabaseEvent>(
                            stream: databaseReference.onValue,
                            builder: (context, snapshot) {
                              if (snapshot.hasError) {
                                return Text('Error: ${snapshot.error}', style: TextStyle(color: Colors.white));
                              }
                              if (!snapshot.hasData) {
                                return SizedBox(
                                  width: MediaQuery.of(context).size.width,
                                  height: MediaQuery.of(context).size.height * .95,
                                  child: Center(child: CircularProgressIndicator()),
                                );
                              } else if (snapshot.data?.snapshot.value == null) {
                                return SizedBox(
                                  width: MediaQuery.of(context).size.width,
                                  height: MediaQuery.of(context).size.height * .95,
                                  child: const Center(
                                    child: Text(
                                      "No Data Found.",
                                      style: TextStyle(fontSize: 24, color: Colors.white),
                                    ),
                                  ),
                                );
                              }

                              final data = snapshot.data!.snapshot.value as Map<Object?, Object?>;
                              // print(data.toString());
                              final items = data.entries
                                  .map((entry) => {entry.key: entry.value})
                                  .toList();


                              return LayoutBuilder(
                                builder: (context, constraints) {
                                  return Padding(
                                    padding: const EdgeInsets.all(10.0),
                                    child: SizedBox(
                                      height: MediaQuery.of(context).size.height * .90,
                                      child: CardItem(itemData: items, height: height,)
                                    ),
                                  );
                                }
                              );
                            },
                          )
                        )
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

class CardItem extends StatefulWidget {
  final List<Map<Object?, Object?>> itemData;
  final bool height;

  const CardItem({Key? key, required this.itemData, required this.height}) : super(key: key);

  @override
  _CardItemState createState() => _CardItemState();
}

class _CardItemState extends State<CardItem> {
  bool isHovered = false;

  @override
  Widget build(BuildContext context) {
    int n = widget.height ?  widget.itemData.length : widget.itemData.length ~/ 3 ;
    print(widget.height);
    return  Column(
      children: [
        SizedBox(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height *.9,
          child: widget.height ? ListView.builder(
            itemCount: n,
            itemBuilder: (context, rowIndex){
              int index =  rowIndex;
              Map<Object?, Object?> data = new Map();
              if (widget.itemData.length > index) {
                 data = widget.itemData[index].values
                    .first as Map<Object?, Object?>;
              }
              // print(data);
              return widget.itemData.length  > (index) ? Padding(
                padding: const EdgeInsets.all(8.0),
                    child: Container(
                      width: MediaQuery.of(context).size.width * .3,
                      decoration: const BoxDecoration(
                        borderRadius:
                        BorderRadius.all(Radius.circular(15)),
                        color: Colors.grey,
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(1.0),
                        child: Container(
                          width: MediaQuery.of(context).size.width * .3 - 1,
                          decoration: const BoxDecoration(
                            borderRadius:
                            BorderRadius.all(Radius.circular(15)),
                            color: Colors.black,
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                SizedBox(height: 8.0),
                                SizedBox(
                                  height: 200,
                                  width: MediaQuery.of(context).size.width,
                                  child: Center(child: Image.network(data["logo"].toString())),
                                ),
                                SizedBox(height: 8.0),
                                Text(
                                  '${data["title"].toString()}',
                                  style: TextStyle(fontSize: 18, color: Colors.white, fontWeight: FontWeight.bold),
                                  textAlign: TextAlign.center,
                                ),
                                SizedBox(height: 8.0),
                                Text(
                                  '${data["info"].toString().substring(0, 180).replaceAll("\\n", "")}...',
                                  style: TextStyle(fontSize: 16, color: Colors.white),
                                ),
                                SizedBox(height: 15.0),
                                InkWell(
                                  onTap: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => MyProjectDetailPage(node: widget.itemData[index].keys.elementAt(0).toString(), data: data,)),
                                    );
                                  },
                                  child: Container(
                                    decoration: const BoxDecoration(
                                      borderRadius: BorderRadius.all(Radius.circular(100)),
                                      color: Colors.grey,
                                    ),
                                    child: Padding(
                                      padding: const EdgeInsets.all(1.0),
                                      child: Container(
                                        decoration: const BoxDecoration(
                                          borderRadius:
                                          BorderRadius.all(Radius.circular(100)),
                                          color: Colors.black,
                                        ),
                                        child: const Padding(
                                          padding: EdgeInsets.only(left: 30.0, top: 3, bottom: 3, right: 30.0),
                                          child:
                                          Text(
                                            "Read More >> ",
                                            style: TextStyle(
                                                fontSize: 24, color: Colors.white),
                                            textAlign: TextAlign.center,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(height: 8.0),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
              ): SizedBox();
            },
          ) : ListView.builder(
            itemCount: (widget.itemData.length/3).ceil(),
            itemBuilder: (context, rowIndex){
              print(rowIndex);
              int index =  rowIndex * 3;
              Map<Object?, Object?> data = new Map();
              Map<Object?, Object?> data1 = new Map();
              Map<Object?, Object?> data2 = new Map();
              if (widget.itemData.length > index) {
                data = widget.itemData[index].values
                    .first as Map<Object?, Object?>;
              }
              if (widget.itemData.length > index + 1) {
                data1 = widget.itemData[index + 1].values
                    .first as Map<Object?, Object?>;
              }
              if (widget.itemData.length > index + 2) {
                data2 = widget.itemData[index + 2].values
                    .first as Map<Object?, Object?>;
              }

              // print(data);
              return Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  widget.itemData.length  > (index) ? Padding(
                    padding: const EdgeInsets.all(8.0),
                        child: Container(
                          width: MediaQuery.of(context).size.width * .3,
                          decoration: const BoxDecoration(
                            borderRadius:
                            BorderRadius.all(Radius.circular(15)),
                            color: Colors.grey,
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(1.0),
                            child: Container(
                              width: MediaQuery.of(context).size.width * .3 - 1,
                              decoration: const BoxDecoration(
                                borderRadius:
                                BorderRadius.all(Radius.circular(15)),
                                color: Colors.black,
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    SizedBox(height: 8.0),
                                    SizedBox(
                                      height: 200,
                                      width: MediaQuery.of(context).size.width,
                                      child: Center(child: Image.network(data["logo"].toString())),
                                    ),
                                    SizedBox(height: 8.0),
                                    Text(
                                      '${data["title"].toString()}',
                                      style: TextStyle(fontSize: 18, color: Colors.white, fontWeight: FontWeight.bold),
                                      textAlign: TextAlign.center,
                                    ),
                                    SizedBox(height: 8.0),
                                    Text(
                                      '${data["info"].toString().substring(0, 180).replaceAll("\\n", "")}...',
                                      style: TextStyle(fontSize: 16, color: Colors.white),
                                    ),
                                    SizedBox(height: 15.0),
                                    InkWell(
                                      onTap: () {
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) => MyProjectDetailPage(node: widget.itemData[index].keys.elementAt(0).toString(), data: data,)),
                                        );
                                      },
                                      child: Container(
                                        decoration: const BoxDecoration(
                                          borderRadius: BorderRadius.all(Radius.circular(100)),
                                          color: Colors.grey,
                                        ),
                                        child: Padding(
                                          padding: const EdgeInsets.all(1.0),
                                          child: Container(
                                            decoration: const BoxDecoration(
                                              borderRadius:
                                              BorderRadius.all(Radius.circular(100)),
                                              color: Colors.black,
                                            ),
                                            child: const Padding(
                                              padding: EdgeInsets.only(left: 30.0, top: 3, bottom: 3, right: 30.0),
                                              child:
                                              Text(
                                                "Read More >> ",
                                                style: TextStyle(
                                                    fontSize: 24, color: Colors.white),
                                                textAlign: TextAlign.center,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                    SizedBox(height: 8.0),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                  ): SizedBox(),

                  widget.itemData.length > (index + 1) ? Padding(
                    padding: const EdgeInsets.all(8.0),
                        child: Container(
                          width: MediaQuery.of(context).size.width * .3,
                          decoration: const BoxDecoration(
                            borderRadius:
                            BorderRadius.all(Radius.circular(15)),
                            color: Colors.grey,
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(1.0),
                            child: Container(
                              width: MediaQuery.of(context).size.width * .3 - 1,
                              decoration: const BoxDecoration(
                                borderRadius:
                                BorderRadius.all(Radius.circular(15)),
                                color: Colors.black,
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    SizedBox(height: 8.0),
                                    SizedBox(
                                      height: 200,
                                      width: MediaQuery.of(context).size.width,
                                      child: Center(child: Image.network(data1!['logo'].toString())),
                                    ),
                                    SizedBox(height: 8.0),
                                    Text(
                                      '${data1['title'] ?? 'No title'}',
                                      style: TextStyle(fontSize: 18, color: Colors.white, fontWeight: FontWeight.bold),
                                      textAlign: TextAlign.center,
                                    ),
                                    SizedBox(height: 8.0),
                                    Text(
                                      '${data1["info"].toString().substring(0, 180).replaceAll("\\n", "")}...',
                                      style: TextStyle(fontSize: 16, color: Colors.white),
                                    ),
                                    SizedBox(height: 15.0),
                                    InkWell(
                                      onTap: () {
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) => MyProjectDetailPage(node: widget.itemData[index + 1].keys.elementAt(0).toString(), data: data1,)),
                                        );
                                      },
                                      child: Container(
                                        decoration: const BoxDecoration(
                                          borderRadius: BorderRadius.all(Radius.circular(100)),
                                          color: Colors.grey,
                                        ),
                                        child: Padding(
                                          padding: const EdgeInsets.all(1.0),
                                          child: Container(
                                            decoration: const BoxDecoration(
                                              borderRadius:
                                              BorderRadius.all(Radius.circular(100)),
                                              color: Colors.black,
                                            ),
                                            child: const Padding(
                                              padding: EdgeInsets.only(left: 30.0, top: 3, bottom: 3, right: 30.0),
                                              child:
                                              Text(
                                                "Read More >> ",
                                                style: TextStyle(
                                                    fontSize: 24, color: Colors.white),
                                                textAlign: TextAlign.center,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                    SizedBox(height: 8.0),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                  ) : SizedBox(),

                  widget.itemData.length > (index + 2) ? Padding(
                    padding: const EdgeInsets.all(8.0),
                        child: Container(
                          width: MediaQuery.of(context).size.width * .3,
                          decoration: const BoxDecoration(
                            borderRadius:
                            BorderRadius.all(Radius.circular(15)),
                            color: Colors.grey,
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(1.0),
                            child: Container(
                              width: MediaQuery.of(context).size.width * .30 - 1,
                              decoration: const BoxDecoration(
                                borderRadius:
                                BorderRadius.all(Radius.circular(15)),
                                color: Colors.black,
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    SizedBox(height: 8.0),
                                    SizedBox(
                                      height: 200,
                                      width: MediaQuery.of(context).size.width,
                                      child: Center(child: Image.network(data2!['logo'].toString())),
                                    ),
                                    SizedBox(height: 8.0),
                                    Text(
                                      '${data2['title'] ?? 'No title'}',
                                      style: TextStyle(fontSize: 18, color: Colors.white, fontWeight: FontWeight.bold),
                                      textAlign: TextAlign.center,
                                    ),
                                    SizedBox(height: 8.0),
                                    Text(
                                      '${data2["info"].toString().substring(0, 180).replaceAll("\\n", "")}...',
                                      style: TextStyle(fontSize: 16, color: Colors.white),
                                    ),
                                    SizedBox(height: 15.0),
                                    InkWell(
                                      onTap: () {
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) => MyProjectDetailPage(node: widget.itemData[index + 2].keys.elementAt(0).toString(), data: data2,)),
                                        );
                                      },
                                      child: Container(
                                        decoration: const BoxDecoration(
                                          borderRadius: BorderRadius.all(Radius.circular(100)),
                                          color: Colors.grey,
                                        ),
                                        child: Padding(
                                          padding: const EdgeInsets.all(1.0),
                                          child: Container(
                                            decoration: const BoxDecoration(
                                              borderRadius:
                                              BorderRadius.all(Radius.circular(100)),
                                              color: Colors.black,
                                            ),
                                            child: const Padding(
                                              padding: EdgeInsets.only(left: 30.0, top: 3, bottom: 3, right: 30.0),
                                              child:
                                              Text(
                                                "Read More >> ",
                                                style: TextStyle(
                                                    fontSize: 24, color: Colors.white),
                                                textAlign: TextAlign.center,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                    SizedBox(height: 8.0),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                  ): SizedBox(),
                ],
              );
            },
          ),
        ),
      ],
    );
  }
}
