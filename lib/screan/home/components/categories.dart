import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
//import commont
import 'package:prm_as_tiennn8_se141023/common_patten/size_config.dart';
//import service
import 'package:prm_as_tiennn8_se141023/service/categoryService.dart';
//import model
import 'package:prm_as_tiennn8_se141023/models/category.dart';

class Categories extends StatelessWidget {
  final netWorkRequestCategory net = netWorkRequestCategory();
  List<categorymodel> categories = [];
  void getlist() async {
    Future<List<categorymodel>> tmplist = net.letcategory();
    this.categories = await tmplist;
  }

  @override
  Widget build(BuildContext context) {
    // List<Map<String, dynamic>> categories = [
    //   {"icon": "assets/icons/coloring.svg", "text": "Nhuộm tóc"},
    //   {"icon": "assets/icons/haircut.svg", "text": "Cát Tóc"},
    //   {"icon": "assets/icons/hairstyle.svg", "text": "Tạo kiểu"},
    //   {"icon": "assets/icons/shaving.svg", "text": "Cạo mặt"},
    //   {"icon": "assets/icons/shampoo.svg", "text": "Gội đâu"},
    // ];
    return FutureBuilder(
      future: net.letcategory(),
      builder: (BuildContext context, AsyncSnapshot<List<categorymodel>> snap) {
        if (snap.hasData) {
          List<categorymodel> categorys = snap.requireData;
          return Padding(
            padding: EdgeInsets.all(getProportionateScreenWidth(20)),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: List.generate(
                categorys.length,
                (index) => CategoryCard(
                  icon: categorys[index].icon,
                  text: categorys[index].Text,
                  press: () {},
                ),
              ),
            ),
          );
          // return Text(postl.length.toString());
        }
        return CircularProgressIndicator();
      },
    );
    // return Padding(
    //   padding: EdgeInsets.all(getProportionateScreenWidth(20)),
    //   child: Row(
    //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
    //     crossAxisAlignment: CrossAxisAlignment.start,
    //     children: List.generate(
    //       categories.length,
    //       (index) => CategoryCard(
    //         icon: categories[index].icon,
    //         text: categories[index].Text,
    //         press: () {},
    //       ),
    //     ),
    //   ),
    // );
  }
}

class CategoryCard extends StatelessWidget {
  const CategoryCard({
    Key? key,
    required this.icon,
    required this.text,
    required this.press,
  }) : super(key: key);

  final String? icon, text;
  final GestureTapCallback press;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: press,
      child: SizedBox(
        width: getProportionateScreenWidth(55),
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.all(getProportionateScreenWidth(15)),
              height: getProportionateScreenWidth(55),
              width: getProportionateScreenWidth(55),
              decoration: BoxDecoration(
                color: Color(0xFFFFECDF),
                borderRadius: BorderRadius.circular(10),
              ),
              child: SvgPicture.asset(icon!),
            ),
            SizedBox(height: 5),
            Text(text!, textAlign: TextAlign.center)
          ],
        ),
      ),
    );
  }
}
