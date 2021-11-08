import 'package:flutter/material.dart';
import 'package:prm_as_tiennn8_se141023/common_patten/default_button.dart';
import 'product_description.dart';
import 'top_rounded_container.dart';
import 'product_images.dart';
import 'package:get/get.dart';
//import commont
import 'package:prm_as_tiennn8_se141023/common_patten/size_config.dart';
//import service
import 'package:prm_as_tiennn8_se141023/service/serviceService.dart';
//import model
import 'package:prm_as_tiennn8_se141023/models/Product.dart';
import 'package:prm_as_tiennn8_se141023/models/service_model.dart';
//import page
import 'package:prm_as_tiennn8_se141023/screan/booking/detail_service_scren.dart';
class Body extends StatelessWidget {
  final ServicesModel service;

  const Body({Key? key, required this.service}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        ProductImages(service: service),
        TopRoundedContainer(
          color: Colors.white,
          child: Column(
            children: [
              ServiceDescription(
                service: service,
                pressOnSeeMore: () {},
              ),
              TopRoundedContainer(
                color: Color(0xFFF6F7F9),
                child: Column(
                  children: [
                    TopRoundedContainer(
                      color: Colors.white,
                      child: Padding(
                        padding: EdgeInsets.only(
                          left: SizeConfig.screenWidth * 0.15,
                          right: SizeConfig.screenWidth * 0.15,
                          bottom: getProportionateScreenWidth(40),
                          top: getProportionateScreenWidth(15),
                        ),
                        child: DefaultButton(
                          text: "Booking",
                          press: () {
                            Navigator.pushNamed(
                              context,
                              BookingScreen.routeName,
                              arguments:
                                  ServiceBookingArguments(service: service),
                            );
                          },
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
