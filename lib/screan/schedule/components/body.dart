import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:prm_as_tiennn8_se141023/common_patten/custom_app_barc.dart';
import 'package:prm_as_tiennn8_se141023/common_patten/size_config.dart';
import 'build_scrollable_services.dart';

class Body extends StatelessWidget {
  bool _isFromProfile = false;
  List<String> test = ['text1'];
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        width: MediaQuery.of(context).size.width,
        height: 850,
        decoration: const BoxDecoration(
            // image: DecorationImage(
            //   fit: BoxFit.cover,
            //   image: AssetImage(Assets.image1),
            // ),
            ),
        child: DefaultTabController(
          length: 3,
          child: Scaffold(
            appBar: CustomAppBar(
              context,
              title: 'Lịch Hẹn',
              enableLeading: _isFromProfile,
              backgroundColor: Colors.white,
              bottom: PreferredSize(
                preferredSize: const Size.fromHeight(50),
                child: Container(
                  height: 55,
                  width: MediaQuery.of(context).size.width,
                  margin: const EdgeInsets.symmetric(
                    horizontal: 18,
                    vertical: 12,
                  ),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    border: Border.all(color: Colors.black),
                  ),
                  child: TabBar(
                    labelStyle: Theme.of(context)
                        .textTheme
                        .subtitle2
                        ?.copyWith(color: Color(0xFFFFB74D)),
                    indicator: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      border: Border.all(color: Color(0xFFFFB74D)),
                      color: Color(0xFFFFB74D),
                    ),
                    labelColor: Colors.black,
                    unselectedLabelColor: Colors.black,
                    tabs: [
                      Tab(text: 'Đang Đặt'),
                      Tab(text: 'Đẫ Hoàn Thành'),
                      Tab(text: 'Đã Hủy'),
                    ],
                  ),
                ),
              ),
            ),
            body: TabBarView(
              children: [
                _BuildBooking(bookingmodellist: test, style: 1),
                _BuildBooking(bookingmodellist: test, style: 2),
                _BuildBooking(bookingmodellist: test, style: 3),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _BuildBooking extends StatelessWidget {
  final List<String> bookingmodellist;
  final int style;
  const _BuildBooking(
      {Key? key, required this.bookingmodellist, required this.style})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: bookingmodellist.length,
      shrinkWrap: true,
      physics: const ScrollPhysics(),
      itemBuilder: (context, index) {
        final _data = bookingmodellist[index];
        return PopularService(
          style: style,
        );
      },
    );
  }
}
