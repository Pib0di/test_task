import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class EditName extends StatelessWidget {
  const EditName(
      {super.key, required this.title, required this.textController});

  final String title;
  final TextEditingController textController;

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        middle: Text(title),
      ),
      child: Material(
        child: Padding(
          padding: const EdgeInsets.only(top: 80.0),
          child: TextFormField(
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              hintText: 'Enter a search term',
            ),
            controller: textController,
          ),
        ),
      ),
    );
  }
}
