import 'dart:typed_data';
import 'package:flutter/material.dart';

Widget buildImage(Uint8List bytes) => bytes != null
    ? Image.memory(bytes)
    : Container(
        child: Text('nope'),
      );
