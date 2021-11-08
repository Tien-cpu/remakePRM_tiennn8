import 'package:flutter/material.dart';
import 'package:octo_image/octo_image.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import "package:flutter_feather_icons/src/icon_data.dart";
//import commont
import 'package:prm_as_tiennn8_se141023/common_patten/size_config.dart';
//import service
import 'package:prm_as_tiennn8_se141023/service/NotificationService.dart';
//import model
import 'package:prm_as_tiennn8_se141023/models/Notification_Model.dart';
//import page
import 'package:prm_as_tiennn8_se141023/screan/detail_service/detail_service_scren.dart';

class PopularService extends StatelessWidget {
  final netWorkRequestNotificationnode net = netWorkRequestNotificationnode();
  PopularService({
    Key? key,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: net.listNotificationPending(),
      builder: (BuildContext context, AsyncSnapshot<List<notification>> snap) {
        if (snap.hasData) {
          List<notification> services = snap.requireData;
          if (services.isEmpty) {
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
                      if (service.name == '' || service.name == null) {
                        return Container(
                          width: MediaQuery.of(context).size.width,
                          margin: const EdgeInsets.only(bottom: 12),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            color: Colors.blueAccent,
                          ),
                          height: 45,
                          child: ListTile(
                            title: Text(service.name),
                          ),
                        );
                      }
                      return _BuildServiceCard(service: service);
                    },
                  ),
                ),
              ],
            );
            // return Text(postl.length.toString());
          } else {
            return Container(
              width: MediaQuery.of(context).size.width,
              margin: const EdgeInsets.only(bottom: 12),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                color: Colors.blueAccent,
              ),
              height: 45,
              child: ListTile(
                title: Text('No data'),
              ),
            );
          }
        } else {
          return Container(
            width: MediaQuery.of(context).size.width,
            margin: const EdgeInsets.only(bottom: 12),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              color: Colors.blueAccent,
            ),
            height: 45,
            child: ListTile(
              title: Text('No data'),
            ),
          );
        }
        return CircularProgressIndicator();
      },
    );
  }
}

class _BuildServiceCard extends StatelessWidget {
  final notification service;

  const _BuildServiceCard({Key? key, required this.service}) : super(key: key);
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
        color: _theme.cardColor,
      ),
      child: InkWell(
        onTap: () => {},
        borderRadius: BorderRadius.circular(8),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
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
                          service.createtime,
                          maxLines: 1,
                          textAlign: TextAlign.left,
                          overflow: TextOverflow.ellipsis,
                          style: _theme.textTheme.headline4,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 5),
                  Text(
                    service.name,
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
                          '10 ' + "km",
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
                          service.name,
                          overflow: TextOverflow.ellipsis,
                          maxLines: 1,
                          style: _theme.textTheme.subtitle2,
                        ),
                      )
                    ],
                  ),
                  const SizedBox(height: 10),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
