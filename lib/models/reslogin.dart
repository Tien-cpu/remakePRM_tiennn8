class reslogin {
  int id;

  reslogin({required this.id});

  factory reslogin.fromJson(Map<String, dynamic> json) {
    var val = 'True';
    return reslogin(id: json['id']);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    return data;
  }
}
