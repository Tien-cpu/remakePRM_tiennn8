import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
// commont import
import 'package:prm_as_tiennn8_se141023/common_patten/size_config.dart';
// service import
// component
import './home_header.dart';
import './categories.dart';
import './build_scrollable_services.dart';
//import service
import 'package:prm_as_tiennn8_se141023/service/categoryService.dart';
//import model
import 'package:prm_as_tiennn8_se141023/models/category.dart';
//import page
import 'package:prm_as_tiennn8_se141023/screan/search_page/detail_service_scren.dart';

class Body extends StatefulWidget {
  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  final netWorkRequestCategory net = netWorkRequestCategory();
  int style = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: getProportionateScreenHeight(20)),
            BuildHeader(),
            SizedBox(height: getProportionateScreenWidth(10)),
            FutureBuilder(
              future: net.letcategory(),
              builder: (BuildContext context,
                  AsyncSnapshot<List<categorymodel>> snap) {
                if (snap.hasData) {
                  List<categorymodel> categorys = snap.requireData;
                  return Padding(
                    padding: EdgeInsets.all(getProportionateScreenWidth(20)),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: List.generate(
                          categorys.length,
                          (index) => GestureDetector(
                                onTap: () => Navigator.pushNamed(
                                  context,
                                  SearchServiceScreen.routeName,
                                  arguments: ServiceSearchArguments(
                                      service: categorys[index].id),
                                ),
                                child: SizedBox(
                                  width: getProportionateScreenWidth(55),
                                  child: Column(
                                    children: [
                                      Container(
                                        padding: EdgeInsets.all(
                                            getProportionateScreenWidth(15)),
                                        height: getProportionateScreenWidth(55),
                                        width: getProportionateScreenWidth(55),
                                        decoration: BoxDecoration(
                                          color: Color(0xFFFFECDF),
                                          borderRadius:
                                              BorderRadius.circular(10),
                                        ),
                                        child: SvgPicture.asset(
                                            categorys[index].icon),
                                      ),
                                      SizedBox(height: 5),
                                      Text(categorys[index].Text,
                                          textAlign: TextAlign.center)
                                    ],
                                  ),
                                ),
                              )
                          // CategoryCard(
                          //   icon: categorys[index].icon,
                          //   text: categorys[index].Text,
                          //   press: () {
                          //     style = categorys[index].id;
                          //   },
                          // ),
                          ),
                    ),
                  );
                  // return Text(postl.length.toString());
                }
                return CircularProgressIndicator();
              },
            ),
            SizedBox(height: getProportionateScreenWidth(30)),
            PopularService(
              style: style,
            ),
          ],
        ),
      ),
    );
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
