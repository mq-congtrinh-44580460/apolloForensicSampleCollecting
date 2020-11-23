import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class Sample {
  String sampleID;
  DateTime date;
  Timestamp timestamp;
  String loc;
  List<String> _tests = [];
  List<Image> _images = [];

  Sample(this.sampleID, this.date, this.timestamp, this.loc, this._tests,
      this._images);

  List<String> get tests {
    return _tests;
  }

  List<Image> get images {
    return _images;
  }
}
