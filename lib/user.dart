import 'package:dartz/dartz.dart';

class User{
  String firstName;
  String lastName;
  String govID;
  String privilege;
  var projects = new List();

  User();

  List getProjects(){
    return this.projects;
  }

  List addProject(String project){
    this.projects.add(project);
    return this.projects;
  }

  bool commitProject(String project){
    bool check = this.projects.remove(project);
    return check;
  }
}

class FieldAgent extends User{

  FieldAgent(String fName, String lName, String govID, List projects){
    this.firstName = fName;
    this.lastName = lName;
    this.govID = govID;
    this.privilege = "fieldAgent";
    this.projects = projects;
    }
}

class LabScientist extends User{

  LabScientist(String fName, String lName, String govID, List projects){
    this.firstName = fName;
    this.lastName = lName;
    this.govID = govID;
    this.privilege = "labScientist";
    this.projects = projects;
    }
}

class Admin extends User{

  Admin(String fName, String lName, String govID, List projects){
    this.firstName = fName;
    this.lastName = lName;
    this.govID = govID;
    this.privilege = "god";
    this.projects = projects;
  }
}

void main(){

}
