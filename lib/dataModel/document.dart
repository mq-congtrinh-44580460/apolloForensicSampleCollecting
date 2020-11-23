import 'package:flutter/material.dart';
import 'project.dart';
import 'user.dart';

class ProjectModel extends ChangeNotifier {
  List<Project> _projects = [];

  List<Project> get projects {
    return _projects;
  }
}
