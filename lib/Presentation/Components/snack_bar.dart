import 'package:flutter/material.dart';

ScaffoldFeatureController buildSnackBar(context, data) =>
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(data)));
