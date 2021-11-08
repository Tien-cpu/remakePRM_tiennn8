import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:prm_as_tiennn8_se141023/common_patten/size_config.dart';

import 'package:octo_image/octo_image.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import "package:flutter_feather_icons/src/icon_data.dart";
import 'package:prm_as_tiennn8_se141023/common_patten/default_button.dart';
import 'package:prm_as_tiennn8_se141023/common_patten/custom_text_button.dart';
import 'package:prm_as_tiennn8_se141023/common_patten/toast.dart';
//import service
import 'package:prm_as_tiennn8_se141023/service/serviceService.dart';
import 'package:prm_as_tiennn8_se141023/service/AppointmentService.dart';
//import model
import 'package:prm_as_tiennn8_se141023/models/service_model.dart';
import 'package:prm_as_tiennn8_se141023/models/appointment_model.dart';

class PopularService extends StatelessWidget {
  int style;
  String reason = 'Dart';
  PopularService({Key? key, required this.style}) : super(key: key);
  final netWorkRequestAppointmentService net =
      netWorkRequestAppointmentService();
  Future<dynamic> _cancelAppointmentDialog(
      BuildContext context, AppointmentModel appointmentModel) {
    final _theme = Theme.of(context);
    return showDialog<dynamic>(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text(
            "Hủy Lịch Hẹn",
            textAlign: TextAlign.center,
            style: _theme.textTheme.headline4,
          ),
          content: SingleChildScrollView(
            child: Text(
              "Bạn muốn hủy lịch hẹn này?",
              textAlign: TextAlign.center,
              style: _theme.textTheme.subtitle2,
            ),
          ),
          actions: [
            CustomTextButton(
              onTap: Get.back,
              label: "Quay lại",
            ),
            CustomTextButton(
              onTap: () {
                Get.back<dynamic>();
                showDialog<void>(
                  context: context,
                  barrierDismissible: false, // user must tap button!
                  builder: (BuildContext context) {
                    return AlertDialog(
                      title: Text('Chọn lý do hủy'),
                      content: StatefulBuilder(builder:
                          (BuildContext context, StateSetter setState) {
                        return SingleChildScrollView(
                          child: Column(
                            children: <Widget>[
                              ListTile(
                                title: Text('Đổi ý không đặt nữa'),
                                leading: new Radio(
                                  value: "Dart",
                                  groupValue: reason,
                                  onChanged: (selectedLanguage) {
                                    setState(() {
                                      reason = selectedLanguage.toString();
                                    });
                                  },
                                ),
                              ),
                              ListTile(
                                title:
                                    Text('Tìm được salon có nhiều ưu đãi hơn'),
                                leading: new Radio(
                                  value: "Java",
                                  groupValue: reason,
                                  onChanged: (selectedLanguage) {
                                    setState(() {
                                      reason = selectedLanguage.toString();
                                    });
                                  },
                                ),
                              ),
                              ListTile(
                                title: Text(
                                    'Salon không giải đáp thắc mắc của tôi'),
                                leading: new Radio(
                                  value: "Python",
                                  groupValue: reason,
                                  onChanged: (selectedLanguage) {
                                    setState(() {
                                      reason = selectedLanguage.toString();
                                    });
                                  },
                                ),
                              ),
                              ListTile(
                                title: Text('Chọn thời gian khác'),
                                leading: new Radio(
                                  value: "Ruby",
                                  groupValue: reason,
                                  onChanged: (selectedLanguage) {
                                    setState(() {
                                      reason = selectedLanguage.toString();
                                    });
                                  },
                                ),
                              ),
                              ListTile(
                                title: Text('Khác'),
                                leading: new Radio(
                                  value: "CSharp",
                                  groupValue: reason,
                                  onChanged: (selectedLanguage) {
                                    setState(() {
                                      reason = selectedLanguage.toString();
                                    });
                                  },
                                ),
                              ),
                            ],
                          ),
                        );
                      }),
                      actions: <Widget>[
                        TextButton(
                          child: Text('Bỏ qua'),
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                        ),
                        TextButton(
                          child: Text('Xong'),
                          onPressed: () {
                            // setState(() {
                            //   appointmentList.remove(appointmentModel);
                            // });
                            // showToast(msg: "Lịch hẹn được hủy thành công");
                            // Navigator.of(context).pop();
                          },
                        ),
                      ],
                    );
                  },
                );
              },
              label: "Hủy lịch",
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: net.listAppointmentPending(style),
      builder:
          (BuildContext context, AsyncSnapshot<List<AppointmentModel>> snap) {
        if (snap.hasData) {
          List<AppointmentModel> services = snap.requireData;
          if (!services.isEmpty) {
            return Column(
              children: [
                const SizedBox(height: 12),
                SizedBox(
                  child: ListView.builder(
                    itemCount: services.length,
                    shrinkWrap: true,
                    physics: const ScrollPhysics(),
                    itemBuilder: (context, index) {
                      final service = services[index];
                      if (service.services == '' || service.services == null) {
                        return Container(
                          width: MediaQuery.of(context).size.width,
                          margin: const EdgeInsets.only(bottom: 12),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            color: Colors.black,
                          ),
                          height: 45,
                          child: ListTile(
                            title: Text(service.barbershop),
                          ),
                        );
                      }
                      return
                          // Text(service.barbershop);
                          _BuildServiceCard(
                        service: service,
                        style: style,
                        reason: reason,
                      );
                    },
                  ),
                ),
              ],
            );
            // return Text(postl.length.toString());
          }
        }
        return CircularProgressIndicator();
      },
    );
  }
}

class _BuildServiceCard extends StatelessWidget {
  final AppointmentModel service;
  final int style;
  final netWorkRequestAppointmentService net =
      netWorkRequestAppointmentService();
  _BuildServiceCard(
      {Key? key,
      required this.service,
      required this.style,
      required this.reason})
      : super(key: key);
  String reason;
  Future<dynamic> _cancelAppointmentDialog(
      BuildContext context, AppointmentModel appointmentModel) {
    final _theme = Theme.of(context);
    return showDialog<dynamic>(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text(
            "Hủy Lịch Hẹn",
            textAlign: TextAlign.center,
            style: _theme.textTheme.headline4,
          ),
          content: SingleChildScrollView(
            child: Text(
              "Bạn muốn hủy lịch hẹn này?",
              textAlign: TextAlign.center,
              style: _theme.textTheme.subtitle2,
            ),
          ),
          actions: [
            CustomTextButton(
              onTap: () => {Navigator.pushNamed(context, '/schedulePage')},
              label: "Quay lại",
            ),
            CustomTextButton(
              onTap: () {
                net.CancelAppointmentPending(service.id).then(
                    (value) => {Navigator.pushNamed(context, '/schedulePage')});
                Navigator.pushNamed(context, '/schedulePage');
              },
              label: "Hủy lịch",
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final _theme = Theme.of(context);

    return Container(
      width: 200,
      height: 160,
      margin: const EdgeInsets.only(bottom: 15),
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5),
        color: Color(0xFFC1C1C1),
      ),
      child: InkWell(
        onTap: () => {},
        borderRadius: BorderRadius.circular(8),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: OctoImage(
                width: 100,
                height: 100,
                fit: BoxFit.cover,
                image: CachedNetworkImageProvider(
                  service.img,
                ),
              ),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: Text(
                          service.services,
                          maxLines: 1,
                          textAlign: TextAlign.left,
                          overflow: TextOverflow.ellipsis,
                          style: _theme.textTheme.headline6,
                        ),
                      ),
                      const SizedBox(width: 15),
                      // service.rating! > 0 && service.rating != null
                      //     ? RatingBarIndicator(
                      //         rating: service.rating ?? 0,
                      //         itemBuilder: (context, index) => Icon(
                      //           Icons.star,
                      //           color: Colors.amber,
                      //         ),
                      //         itemCount: 5,
                      //         itemSize: 18.0,
                      //         direction: Axis.horizontal,
                      //       )
                      //     : const SizedBox()
                    ],
                  ),
                  const SizedBox(height: 5),
                  Text(
                    service.barbershop,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    textAlign: TextAlign.left,
                    style: _theme.textTheme.subtitle2,
                  ),
                  const SizedBox(height: 5),
                  Row(
                    children: [
                      Row(children: [
                        Icon(
                          FeatherIconData(0xe993),
                          // Icons.access_alarms,
                          color: _theme.primaryColor,
                          size: 5,
                        ),
                        const SizedBox(width: 5),
                        Text(
                          service.date,
                          style: _theme.textTheme.subtitle2,
                        )
                      ]),
                      const SizedBox(width: 5),
                      Text(
                        "|",
                        style: _theme.textTheme.subtitle2,
                      ),
                      const SizedBox(width: 5),
                      Expanded(
                        child: Text(
                          service.time,
                          overflow: TextOverflow.ellipsis,
                          maxLines: 1,
                          style: _theme.textTheme.subtitle2,
                        ),
                      )
                    ],
                  ),
                  const SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Text(
                            service.totalPrice.toString() + "đ",
                            style: TextStyle(
                              color: Color(0xFFFFB74D),
                              fontSize: 18,
                              fontWeight: FontWeight.normal,
                            ),
                          ),
                        ],
                      ),
                      if (style == 1)
                        SizedBox(
                            width: SizeConfig.screenWidth * 0.1,
                            child: SizedBox(
                              width: double.infinity,
                              height: getProportionateScreenHeight(18),
                              child: TextButton(
                                style: TextButton.styleFrom(
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10)),
                                  primary: Colors.white,
                                  backgroundColor: Color(0xFF606770),
                                ),
                                onPressed: () => {
                                  _cancelAppointmentDialog(context, service)
                                },
                                child: Text(
                                  "cancel",
                                  style: TextStyle(
                                    fontSize: getProportionateScreenWidth(6),
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            )),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
