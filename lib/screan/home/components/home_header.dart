import 'package:flutter/material.dart';
import 'package:get/get.dart';

// commont import
import 'package:prm_as_tiennn8_se141023/common_patten/size_config.dart';
import 'package:prm_as_tiennn8_se141023/common_patten/icon_btn_with_counter.dart';
import 'package:prm_as_tiennn8_se141023/common_patten/search_field.dart';
//import page
import 'package:prm_as_tiennn8_se141023/screan/search_page/detail_service_scren.dart';

class BuildHeader extends StatelessWidget {
  const BuildHeader({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: getProportionateScreenWidth(15),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            width: SizeConfig.screenWidth * 0.9,
            // height: 50,
            decoration: BoxDecoration(
                color: Colors.black.withOpacity(0.1),
                borderRadius: BorderRadius.circular(25)),
            child: TextField(
              onChanged: (value) => {
                //
              },
              onSubmitted: (Value) => Navigator.pushNamed(
                context,
                SearchServiceScreen.routeName,
                arguments: ServiceSearchArguments(service: 0),
              ),
              decoration: InputDecoration(
                enabledBorder: InputBorder.none,
                focusedBorder: InputBorder.none,
                hintText: "serch name store",
                prefixIcon: Icon(Icons.search),
                contentPadding: EdgeInsets.symmetric(
                  horizontal: getProportionateScreenWidth(20),
                  vertical: getProportionateScreenWidth(9),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
