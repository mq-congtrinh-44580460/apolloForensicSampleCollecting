class User {
  String firstName;
  String lastName;
  String govID;
  String privilege;
  var projects = new List();

  User(this.firstName, this.lastName, this.govID, this.privilege);

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

Admin ben = Admin('Ben', 'Trinh', '6969');
