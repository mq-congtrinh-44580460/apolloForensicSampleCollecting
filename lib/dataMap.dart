
class Data {
  final int id;
  final String data;Data({this.data, this.id});Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data["id"] = id;
    data["data"] = this.data;
    return data;
  }
}
