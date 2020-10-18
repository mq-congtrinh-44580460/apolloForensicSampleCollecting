import 'package:dartz/dartz.dart';

class User {
  String firstName;
  String lastName;
  String govID;
  String privilege;
  var projects = new List();

  User(String fName, String lName, String govID, String priviledge) {
    this.firstName = fName;
    this.lastName = lName;
    this.govID = govID;
    this.privilege = privilege;
  }

  List getProjects() {
    return this.projects;
  }

  List addProject(String project) {
    this.projects.add(project);
    return this.projects;
  }

  bool commitProject(String project) {
    bool check = this.projects.remove(project);
    return check;
  }
}

class FieldAgent extends User {
  FieldAgent(String fName, String lName, String govID)
      : super(fName, lName, govID, "fieldAgent");
}

class LabScientist extends User {
  LabScientist(String fName, String lName, String govID)
      : super(fName, lName, govID, "labScientist");
}

class Admin extends User {
  Admin(String fName, String lName, String govID)
      : super(fName, lName, govID, "god");
}

void main() {
  Admin ben = new Admin('Ben', 'Trinh', '6969');
  print(ben.firstName);
}
