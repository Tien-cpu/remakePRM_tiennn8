import 'package:flutter/material.dart';
import 'package:octo_image/octo_image.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import "package:flutter_feather_icons/src/icon_data.dart";
//import commont
import 'package:prm_as_tiennn8_se141023/common_patten/size_config.dart';
//import service
import 'package:prm_as_tiennn8_se141023/service/serviceService.dart';
//import model
import 'package:prm_as_tiennn8_se141023/models/service_model.dart';
//import page
import 'package:prm_as_tiennn8_se141023/screan/detail_service/detail_service_scren.dart';

class PopularService extends StatelessWidget {
  final netWorkRequestService net = netWorkRequestService();
  int style;
  PopularService({Key? key, required this.style}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: net.getSerVice(style),
      builder: (BuildContext context, AsyncSnapshot<List<ServicesModel>> snap) {
        if (snap.hasData) {
          List<ServicesModel> services = snap.requireData;
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
                            title: Text(service.name ?? 'No data'),
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
          }
        }
        return CircularProgressIndicator();
      },
    );
  }
}

class _BuildServiceCard extends StatelessWidget {
  final ServicesModel service;

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
        onTap: () => Navigator.pushNamed(
          context,
          DetailsServiceScreen.routeName,
          arguments: ServiceDetailsArguments(service: service),
        ),
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
                  service.image ?? '',
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
                          service.name ?? '',
                          maxLines: 1,
                          textAlign: TextAlign.left,
                          overflow: TextOverflow.ellipsis,
                          style: _theme.textTheme.headline4,
                        ),
                      ),
                      const SizedBox(width: 15),
                      service.rating! > 0 && service.rating != null
                          ? RatingBarIndicator(
                              rating: service.rating ?? 0,
                              itemBuilder: (context, index) => Icon(
                                Icons.star,
                                color: Colors.amber,
                              ),
                              itemCount: 5,
                              itemSize: 18.0,
                              direction: Axis.horizontal,
                            )
                          : const SizedBox()
                    ],
                  ),
                  const SizedBox(height: 5),
                  Text(
                    service.description ?? '',
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
                          service.barbershop!,
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
                          service.offerPrice != null
                              ? Row(
                                  children: [
                                    Text(service.offerPrice.toString() + "đ",
                                        style: TextStyle(
                                          color: Color(0xFFC1C1C1),
                                          fontSize: 15,
                                          fontWeight: FontWeight.normal,
                                          decoration:
                                              TextDecoration.lineThrough,
                                        )),
                                    const SizedBox(width: 5),
                                    Text(
                                      service.offerPrice.toString() + "đ",
                                      style: TextStyle(
                                        color: Color(0xFFFFB74D),
                                        fontSize: 18,
                                        fontWeight: FontWeight.normal,
                                      ),
                                    )
                                  ],
                                )
                              : Text(
                                  service.offerPrice.toString() + "đ",
                                  style: TextStyle(
                                    color: Color(0xFFFFB74D),
                                    fontSize: 18,
                                    fontWeight: FontWeight.normal,
                                  ),
                                ),
                        ],
                      ),
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
