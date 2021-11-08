import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
//import commont
import 'package:prm_as_tiennn8_se141023/common_patten/size_config.dart';
//import service
import 'package:prm_as_tiennn8_se141023/service/serviceService.dart';
//import model
import 'package:prm_as_tiennn8_se141023/models/Product.dart';
import 'package:prm_as_tiennn8_se141023/models/service_model.dart';

class ServiceDescription extends StatelessWidget {
  const ServiceDescription({
    Key? key,
    required this.service,
    this.pressOnSeeMore,
  }) : super(key: key);

  final ServicesModel service;
  final GestureTapCallback? pressOnSeeMore;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding:
              EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(20)),
          child: Text(
            service.name!,
            style: Theme.of(context).textTheme.headline6,
          ),
        ),
        Padding(
          padding: EdgeInsets.only(
            left: getProportionateScreenWidth(20),
            right: getProportionateScreenWidth(64),
          ),
          child: Text(
            service.description!,
            maxLines: 3,
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(
            horizontal: getProportionateScreenWidth(20),
            vertical: 10,
          ),
          child: GestureDetector(
            onTap: () {},
            child: Row(
              children: [
                Text(
                  "See More Detail",
                  style: TextStyle(
                      fontWeight: FontWeight.w600, color: Color(0xFF606770)),
                ),
                SizedBox(width: 5),
                Icon(
                  Icons.arrow_forward_ios,
                  size: 12,
                  color: Color(0xFF606770),
                ),
              ],
            ),
          ),
        )
      ],
    );
  }
}
