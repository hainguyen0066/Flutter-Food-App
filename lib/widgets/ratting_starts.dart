import 'package:flutter/material.dart';

class RattingStart extends StatelessWidget {

  final int ratting;

  const RattingStart(this.ratting, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String start = '';
    for(int i = 0; i < ratting; i++) {
      start += '⭐';
    }
    start.trim();
    return Text(start);
  }
}

