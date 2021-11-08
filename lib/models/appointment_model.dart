class AppointmentModel {
  int id;
  int totalPrice;
  String date;
  String time;
  String status;
  String services;
  String barbershop;
  String img;

  AppointmentModel(
      {required this.totalPrice,
      required this.date,
      required this.id,
      required this.time,
      required this.status,
      required this.services,
      required this.barbershop,
      required this.img});

  factory AppointmentModel.fromJson(Map<String, dynamic> json) {
    return AppointmentModel(
      totalPrice: json['totalPrice'],
      id: json['id'],
      date: json['date'],
      time: json['time'],
      status: json['status'],
      services: json['services'],
      barbershop: json['barbershop'],
      img: json['image'],
    );
  }
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['totalPrice'] = this.totalPrice;
    data['date'] = this.date;
    data['time'] = this.time;
    data['status'] = this.status;
    data['services'] = this.services;
    data['barbershop'] = this.barbershop;
    data['image'] = this.img;
    return data;
  }
}
