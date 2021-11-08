class notification {
  int id;
  int style;
  String name;
  String createtime;

  notification(
      {required this.id,
      required this.name,
      required this.createtime,
      required this.style});

  factory notification.fromJson(Map<String, dynamic> json) {
    return notification(
        id: json['id'],
        name: json['name'],
        createtime: json['createtime'],
        style: json['style']);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['createtime'] = this.createtime;
    data['style'] = this.style;
    return data;
  }
}
