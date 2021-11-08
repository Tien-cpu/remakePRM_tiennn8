// import 'package:flutter/material.dart';
// import 'dart:math';
// import 'package:prm_as_tiennn8_se141023/common_patten/default_button.dart';
// import 'package:get/get.dart';
// import 'package:intl/intl.dart';
// import 'package:badges/badges.dart';
// import 'package:prm_as_tiennn8_se141023/screan/booking/components/datetime_picker_widget.dart';
// import 'package:prm_as_tiennn8_se141023/screan/booking/components/custom_elevated_button.dart';
// import 'package:prm_as_tiennn8_se141023/screan/booking/components/build_header.dart';
// import 'package:prm_as_tiennn8_se141023/screan/booking/components/headerBody.dart';
// import 'package:prm_as_tiennn8_se141023/screan/booking/components/button_widget.dart';
// //import commont
// import 'package:prm_as_tiennn8_se141023/common_patten/size_config.dart';
// //import service
// import 'package:prm_as_tiennn8_se141023/service/serviceService.dart';
// //import model
// import 'package:prm_as_tiennn8_se141023/models/service_model.dart';
// import 'package:prm_as_tiennn8_se141023/models/slot_model.dart';
// import 'package:prm_as_tiennn8_se141023/models/pickDateModel.dart';
// import 'package:prm_as_tiennn8_se141023/models/appointment_model.dart';

// class Body extends StatelessWidget {
//   final AppointmentModel service;
//   const Body({Key? key, required this.service}) : super(key: key);
//   @override
//   Widget build(BuildContext context) {
//     final _theme = Theme.of(context);
//     return SingleChildScrollView(
//       child: SingleChildScrollView(
//           child: Container(
//               width: MediaQuery.of(context).size.width,
//               height: 660,
//               margin: const EdgeInsets.only(bottom: 15),
//               padding: const EdgeInsets.all(8),
//               decoration: BoxDecoration(
//                 borderRadius: BorderRadius.circular(5),
//                 color: _theme.cardColor,
//               ),
//               child: BookingDetailScreen(service: service))),
//     );
//   }
// }

// class BookingDetailScreen extends StatefulWidget {
//   final AppointmentModel service;
//   const BookingDetailScreen({Key? key, required this.service})
//       : super(key: key);

//   @override
//   _BookingDetailScreenState createState() =>
//       _BookingDetailScreenState(service: service);
// }

// class _BookingDetailScreenState extends State<BookingDetailScreen> {
//   final AppointmentModel service;
//   late String _dateOfBirth = '';
//   late String _time = '';
//   String timebooking = '';
//   List<SlotModel> slots = [];
//   final netWorkRequestService net = netWorkRequestService();
//   String selectedSlot = '';
//   double toDouble(TimeOfDay myTime) => myTime.hour + myTime.minute / 60.0;
//   Widget _buildSlot(List<SlotModel> slots) {
//     final _theme = Theme.of(context);
//     return Padding(
//       padding: const EdgeInsets.symmetric(horizontal: 2),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           Text(
//             "Chọn giờ",
//             style: _theme.textTheme.headline4,
//           ),
//           const SizedBox(height: 12),
//           Wrap(
//             children: slots.map((e) {
//               return GestureDetector(
//                   onTap: () {
//                     setState(() {
//                       // ignore: avoid_function_literals_in_foreach_calls
//                       slots.forEach((element) {
//                         if (element != e) {
//                           element.isSelected = false;
//                           // timebooking = element.time!;
//                         }
//                       });
//                       e.isSelected = !e.isSelected!;
//                       if (e.isSelected == true) {
//                         selectedSlot = e.time!;
//                       } else {
//                         selectedSlot = '';
//                       }
//                     });
//                   },
//                   child: (e.isAvailable == true && e.isBooked == false)
//                       ? Container(
//                           width: 90,
//                           height: 50,
//                           child: (e.isSale == true)
//                               ? Container(
//                                   width: 90,
//                                   height: 50,
//                                   padding: const EdgeInsets.all(6),
//                                   child: (e.isSelected == true)
//                                       ? Badge(
//                                           badgeContent: Text(
//                                             '25%',
//                                             style: TextStyle(
//                                                 color: Colors.white,
//                                                 fontSize: 10),
//                                           ),
//                                           child: Container(
//                                             decoration: BoxDecoration(
//                                               color: Color(0xFFD1870B),
//                                               borderRadius:
//                                                   BorderRadius.circular(12),
//                                             ),
//                                             child: Center(
//                                               child: Text(
//                                                 e.time ?? '',
//                                                 style:
//                                                     _theme.textTheme.bodyText2,
//                                               ),
//                                             ),
//                                           ),
//                                         )
//                                       : Badge(
//                                           badgeContent: Text(
//                                             '25%',
//                                             style: TextStyle(
//                                                 color: Colors.white,
//                                                 fontSize: 10),
//                                           ),
//                                           child: Container(
//                                             decoration: BoxDecoration(
//                                                 color: (e.isAvailable == true)
//                                                     ? Colors.white
//                                                     : _theme.errorColor,
//                                                 borderRadius:
//                                                     BorderRadius.circular(12),
//                                                 border: Border.all(
//                                                     color:
//                                                         _theme.primaryColor)),
//                                             child: Center(
//                                               child: Text(
//                                                 e.time ?? '',
//                                                 style: _theme
//                                                     .textTheme.bodyText2
//                                                     ?.copyWith(
//                                                         color: (e.isAvailable ==
//                                                                 true)
//                                                             ? Colors.black
//                                                             : _theme
//                                                                 .backgroundColor),
//                                               ),
//                                             ),
//                                           ),
//                                         ),
//                                 )
//                               : Container(
//                                   width: 90,
//                                   height: 50,
//                                   padding: const EdgeInsets.all(6),
//                                   child: (e.isSelected == true)
//                                       ? Container(
//                                           decoration: BoxDecoration(
//                                             color: Color(0xFFD1870B),
//                                             borderRadius:
//                                                 BorderRadius.circular(12),
//                                           ),
//                                           child: Center(
//                                             child: Text(
//                                               e.time ?? '',
//                                               style: _theme.textTheme.bodyText2,
//                                             ),
//                                           ),
//                                         )
//                                       : Container(
//                                           decoration: BoxDecoration(
//                                               color: (e.isAvailable == true)
//                                                   ? Colors.white
//                                                   : _theme.errorColor,
//                                               borderRadius:
//                                                   BorderRadius.circular(12),
//                                               border: Border.all(
//                                                   color: _theme.primaryColor)),
//                                           child: Center(
//                                             child: Text(
//                                               e.time ?? '',
//                                               style: _theme.textTheme.bodyText2
//                                                   ?.copyWith(
//                                                       color: (e.isAvailable ==
//                                                               true)
//                                                           ? Colors.black
//                                                           : _theme
//                                                               .backgroundColor),
//                                             ),
//                                           ),
//                                         ),
//                                 ),
//                         )
//                       : Container(
//                           width: 90,
//                           height: 50,
//                           padding: const EdgeInsets.all(6),
//                           child: Container(
//                             decoration: BoxDecoration(
//                                 color: Colors.grey[300],
//                                 borderRadius: BorderRadius.circular(12),
//                                 border: Border.all(color: Colors.grey)),
//                             child: Center(
//                               child: Text(
//                                 e.time ?? '',
//                                 style: _theme.textTheme.bodyText2
//                                     ?.copyWith(color: Colors.grey[600]),
//                               ),
//                             ),
//                           )));
//             }).toList(),
//           ),
//         ],
//       ),
//     );
//   }

//   _BookingDetailScreenState({required this.service});
//   late TextEditingController _couponController;
//   bool _isDatePicked = false;

//   @override
//   void initState() {
//     super.initState();
//     _couponController = TextEditingController(text: '');
//   }

//   Widget _buildChosenServices() {
//     final _theme = Theme.of(context);

//     return Container(
//       width: MediaQuery.of(context).size.width,
//       margin: const EdgeInsets.symmetric(horizontal: 8),
//       decoration: BoxDecoration(
//         borderRadius: BorderRadius.circular(15),
//         border: Border.all(color: _theme.primaryColor),
//       ),
//       child: Column(
//         mainAxisSize: MainAxisSize.max,
//         children: [
//           Container(
//             width: MediaQuery.of(context).size.width,
//             height: 35,
//             decoration: BoxDecoration(
//                 color: _theme.primaryColor,
//                 borderRadius: const BorderRadius.only(
//                   topRight: Radius.circular(14),
//                   topLeft: Radius.circular(14),
//                 )),
//             child: Center(
//               child: Text(
//                 "Dịch vụ đã chọn",
//                 style: _theme.textTheme.bodyText2?.copyWith(
//                   color: Colors.white,
//                 ),
//               ),
//             ),
//           ),
//           const SizedBox(height: 15),
//           SizedBox(height: 165, child: BuildHeader(service: service)),
//         ],
//       ),
//     );
//   }

//   DateTime? dateTime;
//   DateTime? dateTime2;

//   String getTextDate() {
//     if (dateTime == null) {
//       return 'Select Date';
//     } else {
//       return DateFormat('MM/dd/yyyy').format(dateTime!);
//     }
//   }

//   String getTextTime() {
//     if (dateTime2 == null) {
//       return 'Select Time';
//     } else {
//       return DateFormat.jm().format(dateTime2!);
//     }
//   }

//   Iterable<TimeOfDay> getTimes(
//       TimeOfDay startTime, TimeOfDay endTime, Duration step) sync* {
//     var hour = startTime.hour;
//     var minute = startTime.minute;

//     do {
//       yield TimeOfDay(hour: hour, minute: minute);
//       minute += step.inMinutes;
//       while (minute >= 60) {
//         minute -= 60;
//         hour++;
//       }
//     } while (hour < endTime.hour ||
//         (hour == endTime.hour && minute <= endTime.minute));
//   }

//   Future pickDateC(BuildContext context) async {
//     final date = await pickDate(context);
//     if (date == null) return;

//     // final time = await pickTime(context);
//     // if (time == null) return;

//     setState(() {
//       dateTime = DateTime(
//         date.year,
//         date.month,
//         date.day,
//       );
//       slots = [];
//       int x = 1;
//       for (int i = 1; i < 3; i++) {
//         for (int h = 0; h < 12; h++) {
//           for (int m = 1; m < 3; m++) {
//             bool islelecting = false;
//             if (int.parse(service.open!).compareTo(x) == -1 ||
//                 int.parse(service.open!).compareTo(x) == 0) {
//               if (x.compareTo(int.parse(service.close!)) == -1 ||
//                   x.compareTo(int.parse(service.close!)) == 0) {
//                 islelecting = true;
//               }
//             }
//             String tmptime = h.toString() +
//                 ":" +
//                 (m == 1 ? "00" : "30") +
//                 " " +
//                 (i == 1 ? "AM" : "PM");
//             SlotModel slot = SlotModel(
//                 id: x,
//                 time: tmptime,
//                 isAvailable: islelecting,
//                 isSelected: false,
//                 isBooked: false,
//                 isSale: false);
//             slots.add(slot);
//             x++;
//           }
//         }
//       }
//       _isDatePicked = true;
//     });
//   }

//   Future pickTimeC(BuildContext context) async {
//     // final date = await pickDate(context);
//     // if (date == null) return;

//     final time = await pickTime(context);
//     if (time == null) return;
//     setState(() {
//       dateTime2 = DateTime(
//         time.hour,
//         time.minute,
//       );
//     });
//   }

//   Future<DateTime?> pickDate(BuildContext context) async {
//     final initialDate = DateTime.now();
//     final newDate = await showDatePicker(
//       context: context,
//       initialDate: dateTime ?? initialDate,
//       firstDate: DateTime(DateTime.now().day),
//       lastDate: DateTime(DateTime.now().year + 5),
//     );

//     if (newDate == null) return null;

//     return newDate;
//   }

//   Future<TimeOfDay?> pickTime(BuildContext context) async {
//     final initialTime = TimeOfDay(hour: 9, minute: 0);
//     final newTime = await showTimePicker(
//       context: context,
//       initialTime: dateTime != null
//           ? TimeOfDay(hour: dateTime!.hour, minute: dateTime!.minute)
//           : initialTime,
//     );

//     if (newTime == null) return null;

//     return newTime;
//   }

//   DateTime now = new DateTime.now();
//   @override
//   Widget build(BuildContext context) {
//     final _theme = Theme.of(context);
//     DatetimePickerWidget picktime = new DatetimePickerWidget();
//     return Scaffold(
//       body: ListView(
//         children: [
//           const SizedBox(height: 25),
//           _buildChosenServices(),
//           const SizedBox(height: 25),
//           Padding(
//             padding: const EdgeInsets.symmetric(
//               horizontal: 12,
//             ),
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 Text(
//                   "Chọn ngày",
//                   style: _theme.textTheme.headline4,
//                 ),
//                 const SizedBox(height: 12),
//                 ButtonHeaderWidget(
//                   title: 'DateTime',
//                   text: getTextDate(),
//                   onClicked: () => pickDateC(context),
//                 ),
//                 // ButtonHeaderWidget(
//                 //   title: 'DateTime',
//                 //   text: getTextTime(),
//                 //   onClicked: () => pickTimeC(context),
//                 // ),
//                 // if (_isDatePicked == true)
//                 //   _buildSlot(slots)
//                 // else
//                 //   const SizedBox(),
//               ],
//             ),
//           ),
//           const SizedBox(height: 25),
//           if (_isDatePicked == true) _buildSlot(slots) else const SizedBox(),
//           Container(
//             padding: const EdgeInsets.all(15),
//             margin: const EdgeInsets.symmetric(horizontal: 8),
//             decoration: BoxDecoration(
//               border: Border.all(
//                 color: Colors.blue,
//               ),
//               borderRadius: BorderRadius.circular(15),
//             ),
//             child: Row(
//               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               children: [
//                 Text(
//                   "Tổng cộng",
//                   style: _theme.textTheme.headline3,
//                 ),
//                 Text(
//                   // NumberFormat.decimalPattern().format(service.offerPrice),
//                   selectedSlot,
//                   style:
//                       _theme.textTheme.headline3?.copyWith(color: Colors.black),
//                 ),
//               ],
//             ),
//           ),
//           const SizedBox(height: 25),
//           DefaultButton(
//             text: "Đặt lịch",
//             press: () {
//               net.booking(service, dateTime!, selectedSlot).then((value) => {
//                     if (value)
//                       {Navigator.pushNamed(context, '/signinFail')}
//                     else
//                       {Navigator.pushNamed(context, '/signinSuccess')}
//                   });
//             },
//           ),
//           const SizedBox(height: 25),
//         ],
//       ),
//     );
//   }
// }
