import 'package:arpit_rangi/connect.dart';
import 'package:arpit_rangi/education.dart';
import 'package:arpit_rangi/main.dart';
import 'package:arpit_rangi/projects.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:url_launcher/url_launcher.dart';

import 'about.dart';
import 'blogs.dart';

class MyProjectDetailPage extends StatefulWidget {
  const MyProjectDetailPage(
      {super.key, required this.node, required this.data});

  final String node;
  final Map<Object?, Object?> data;

  @override
  State<MyProjectDetailPage> createState() => _MyProjectDetailPageState();
}

class _MyProjectDetailPageState extends State<MyProjectDetailPage> {
  bool box2 = false;
  bool isHoveredTwitter = false;
  bool isHoveredLinkedIn = false;
  bool isHoveredGitHub = false;

  void _showImagePopup(int initialIndex, List<String> imageUrls) {
    showDialog(
      context: context,
      builder: (context) {
        return Dialog(
          backgroundColor: Colors.transparent,
          insetPadding: EdgeInsets.all(10),
          child: Container(
            child: PageView.builder(
              controller: PageController(initialPage: initialIndex),
              itemCount: imageUrls.length,
              itemBuilder: (context, index) {
                return Stack(
                  alignment: Alignment.center,
                  children: [
                    GestureDetector(
                      onTap: () {
                        Navigator.of(context).pop();
                      },
                      child: Image.network(
                        imageUrls[index],
                        fit: BoxFit.contain,
                      ),
                    ),
                    Positioned(
                      left: 10,
                      child: IconButton(
                        icon: Icon(Icons.arrow_back, color: Colors.white),
                        onPressed: () {
                          if (index > 0) {
                            Navigator.of(context).pop();
                            _showImagePopup(index - 1, imageUrls);
                          }
                        },
                      ),
                    ),Positioned(
                      left: 10,
                      top: 10,
                      child: IconButton(
                        icon: const Icon(Icons.close, color: Colors.white),
                        onPressed: () {
                            Navigator.of(context).pop();
                        },
                      ),
                    ),
                    Positioned(
                      right: 10,
                      child: IconButton(
                        icon: const Icon(Icons.arrow_forward, color: Colors.white),
                        onPressed: () {
                          if (index < imageUrls.length - 1) {
                            Navigator.of(context).pop();
                            _showImagePopup(index + 1, imageUrls);
                          }
                        },
                      ),
                    ),
                  ],
                );
              },
            ),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final mediaItems = widget.data["media"] as List<dynamic>?;
    final imageUrls = mediaItems
            ?.where((item) => item != null)
            .map((item) => item.toString())
            .toList() ??
        [];

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
                                  Navigator.pop(context);
                                },
                                child: const Text("Projects",
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold))),
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
                                Navigator.pop(context);
                              },
                              child: const Text("Projects",
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold))),
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
                              children: [
                                SizedBox(height: 30,),
                                SizedBox(
                                  width: MediaQuery.of(context).size.width,
                                  height: 250,
                                  child: Center(
                                      child: Image.network(
                                        widget.data["logo"].toString(),
                                        fit: BoxFit.fitHeight,
                                      )),
                                ),
                                SizedBox(
                                  height: 30,
                                ),
                                SizedBox(
                                  width: MediaQuery.of(context).size.width * .95,
                                  child: Text(
                                    widget.data["title"].toString(),
                                    style: const TextStyle(
                                        fontSize: 26,
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold),
                                    textAlign: TextAlign.center,
                                  ),
                                ),
                                const SizedBox(
                                  height: 20,
                                ),
                                Container(
                                  width: double.infinity,
                                  height: 1,
                                  color: const Color.fromRGBO(61, 61, 61, 1.0),
                                ),
                                const SizedBox(
                                  height: 20,
                                ),
                                Padding(
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
                                ),
                                SizedBox(
                                  height: 30,
                                ),
                                SingleChildScrollView(
                                  scrollDirection: Axis.horizontal,
                                  child: Row(
                                    children: imageUrls.map((imageUrl) {
                                      int index = imageUrls.indexOf(imageUrl);
                                      return GestureDetector(
                                        onTap: () =>
                                            _showImagePopup(index, imageUrls),
                                        child: Padding(
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 8.0),
                                          child: Image.network(
                                            imageUrl,
                                            height: 300,
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                      );
                                    }).toList(),
                                  ),
                                ),
                                const SizedBox(
                                  height: 20,
                                ),
                                Container(
                                  width: double.infinity,
                                  height: 1,
                                  color: const Color.fromRGBO(61, 61, 61, 1.0),
                                ),
                                const SizedBox(
                                  height: 20,
                                ),
                                Padding(
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
                                ),
                                Padding(
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
                                ),
                                const SizedBox(
                                  height: 20,
                                ),
                                Container(
                                  width: double.infinity,
                                  height: 1,
                                  color: const Color.fromRGBO(61, 61, 61, 1.0),
                                ),
                                const SizedBox(
                                  height: 20,
                                ),
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
                                Padding(
                                  padding: const EdgeInsets.only(left: 8.0, top: 10),
                                  child: SizedBox(
                                    width:
                                    MediaQuery.of(context).size.width * .95,
                                    child: Text(
                                      widget.data["info"].toString().replaceAll("\\n", "\n"),
                                      style: const TextStyle(
                                          fontSize: 22,
                                          color: Colors.grey,
                                          fontWeight: FontWeight.normal),
                                      textAlign: TextAlign.start,
                                    ),
                                  ),
                                ),
                              ],
                            )
                          : Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                SizedBox(height: 30,),
                                SizedBox(
                                  width: MediaQuery.of(context).size.width,
                                  height: 250,
                                  child: Center(
                                      child: Image.network(
                                    widget.data["logo"].toString(),
                                    fit: BoxFit.fitHeight,
                                  )),
                                ),
                                SizedBox(
                                  height: 30,
                                ),
                                Text(
                                  widget.data["title"].toString(),
                                  style: const TextStyle(
                                      fontSize: 26,
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold),
                                  textAlign: TextAlign.center,
                                ),
                                const SizedBox(
                                  height: 20,
                                ),
                                Container(
                                  width: double.infinity,
                                  height: 1,
                                  color: const Color.fromRGBO(61, 61, 61, 1.0),
                                ),
                                const SizedBox(
                                  height: 20,
                                ),
                                Padding(
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
                                ),
                                SizedBox(
                                  height: 30,
                                ),
                                SingleChildScrollView(
                                  scrollDirection: Axis.horizontal,
                                  child: Row(
                                    children: imageUrls.map((imageUrl) {
                                      int index = imageUrls.indexOf(imageUrl);
                                      return GestureDetector(
                                        onTap: () =>
                                            _showImagePopup(index, imageUrls),
                                        child: Padding(
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 8.0),
                                          child: Image.network(
                                            imageUrl,
                                            height: 300,
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                      );
                                    }).toList(),
                                  ),
                                ),
                                const SizedBox(
                                  height: 20,
                                ),
                                Container(
                                  width: double.infinity,
                                  height: 1,
                                  color: const Color.fromRGBO(61, 61, 61, 1.0),
                                ),
                                const SizedBox(
                                  height: 20,
                                ),
                                Padding(
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
                                ),
                                Padding(
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
                                ),
                                const SizedBox(
                                  height: 20,
                                ),
                                Container(
                                  width: double.infinity,
                                  height: 1,
                                  color: const Color.fromRGBO(61, 61, 61, 1.0),
                                ),
                                const SizedBox(
                                  height: 20,
                                ),
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
                                Padding(
                                  padding: const EdgeInsets.only(left: 8.0, top: 10),
                                  child: SizedBox(
                                    width:
                                    MediaQuery.of(context).size.width * .95,
                                    child: Text(
                                      widget.data["info"].toString().replaceAll("\\n", "\n"),
                                      style: const TextStyle(
                                          fontSize: 22,
                                          color: Colors.grey,
                                          fontWeight: FontWeight.normal),
                                      textAlign: TextAlign.start,
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
    ]
              ),
            ),
          ),
        ],
      ),
    );
  }
}
