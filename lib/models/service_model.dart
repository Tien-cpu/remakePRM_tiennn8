// import 'package:hairbooking/src/models/barbershop_model.dart';
// import 'package:hairbooking/src/models/category_model.dart';

class ServicesModel {
  final int? id;
  final String? name;
  final String? barbershop;
  bool? isSelected;
  final int? numberOfUsedPeople;
  final double? rating;
  final int? price;
  final int? offerPrice;
  final String? image;
  final int? estimateTime;
  final String? description;
  final List<int>? workingDay;
  final String? open;
  final String? close;

  ServicesModel({
    this.id,
    this.name,
    this.price,
    this.barbershop,
    this.isSelected,
    this.numberOfUsedPeople,
    this.offerPrice,
    this.rating,
    this.image,
    this.estimateTime,
    this.description,
    this.workingDay,
    this.close,
    this.open,
  });
  factory ServicesModel.fromJson(Map<String, dynamic> json) {
    return ServicesModel(
      id: json['id'],
      name: json['name'],
      barbershop: json['barbershop'],
      isSelected: json['isSelected'],
      numberOfUsedPeople: json['numberOfUsedPeople'],
      rating: json['rating'],
      price: json['price'],
      offerPrice: json['offerPrice'],
      image: json['image'],
      estimateTime: json['estimateTime'],
      description: json['description'],
      workingDay: json['workingDay'],
      close: json['close'],
      open: json['open'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['barbershop'] = this.barbershop;
    data['naisSelectedme'] = this.isSelected;
    data['numberOfUsedPeople'] = this.numberOfUsedPeople;
    data['rating'] = this.rating;
    data['price'] = this.price;
    data['offerPrice'] = this.offerPrice;
    data['image'] = this.image;
    data['estimateTime'] = this.estimateTime;
    data['description'] = this.description;
    data['workingDay'] = this.workingDay;
    data['close'] = this.close;
    data['open'] = this.open;
    return data;
  }
}
