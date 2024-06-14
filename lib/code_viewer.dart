import 'package:flutter/material.dart';
import 'package:flutter_highlight/flutter_highlight.dart';
import 'package:flutter_highlight/themes/github.dart';
import 'package:flutter/services.dart'; // Import the services package for Clipboard

class CodeViewer extends StatelessWidget {
  final String code;
  final String language;

  CodeViewer({required this.code, required this.language});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * .95,
      padding: const EdgeInsets.all(8.0),
      color: Colors.grey,
      child: Stack(
        children: [
          SingleChildScrollView(
            child: SizedBox(
              width: MediaQuery.of(context).size.width * .95,
              child: HighlightView(
                code,
                language: language,
                theme: githubTheme,
                padding: const EdgeInsets.all(12),
                textStyle: const TextStyle(
                  fontFamily: 'Consolas',
                  fontSize: 14.0,
                ),
              ),
            ),
          ),
          Positioned(
            top: 10,
            right: 10,
            child: IconButton(
              icon: const Icon(Icons.copy),
              onPressed: () {
                Clipboard.setData(ClipboardData(text: code));
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Code copied to clipboard', style: TextStyle(color: Colors.white),)),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
