class Doctor {
  int id;
  String name;
  String date;

  Doctor({this.id, this.name, this.date});

  Doctor.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    date = json['date'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['date'] = this.date;
    return data;
  }
}
