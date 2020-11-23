import 'dart:io';
import 'package:flutter/widgets.dart';

import 'user.dart';
import 'samples.dart';

class Project extends ChangeNotifier {
  String loc;
  String classification;
  bool urgent;
  bool extendedStorage;
  String clientSection;
  String clientName;
  String clientNumber;
  List<Sample> _samples = [];
  List<File> _files = [];
  bool sealed;
  bool containerSealed;
  String temp;
  String shipmentCmt;
  String cmt;
  List<User> users = [];

  Project(
      this.loc,
      this.classification,
      this.urgent,
      this.extendedStorage,
      this.clientSection,
      this.clientName,
      this.clientNumber,
      this._samples,
      this._files,
      this.sealed,
      this.containerSealed,
      this.temp,
      this.shipmentCmt,
      this.cmt);

  List<Sample> get samples {
    return _samples;
  }

  List<File> get files {
    return _files;
  }
}
