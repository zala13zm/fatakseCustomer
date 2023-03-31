import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:zomatoui/constants/colors.dart';
import 'package:zomatoui/constants/textstyles.dart';
import 'package:zomatoui/vendor_api.dart';
import 'package:zomatoui/widgets/rating.dart';

class RestContainer extends StatefulWidget {
  const RestContainer();

  @override
  State<RestContainer> createState() => _RestContainerState();
}

class _RestContainerState extends State<RestContainer> {
  Future<List<Datum>> getVendorData() async {
    final response = await http.get(
      Uri.parse('https://admin.fataakse.co.in/api/vendors'),
    );
    if (response.statusCode == 200) {
      var data = jsonDecode(response.body);
      List<Datum> restContainers = [];
      for (var item in data['data']) {
        restContainers.add(
          Datum(
            name: item['name'],
            rating: item['rating'],
          ),
        );
      }
      return restContainers;
    } else {
      throw Exception('Failed to fetch data');
    }
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: getVendorData(),
      builder: (context, snapshot) {
        return ListView.builder(
            scrollDirection: Axis.vertical,
            shrinkWrap: true,
            itemBuilder: (context, index) {
              var name = snapshot.data[index]['name'];
              return Container(
                padding: EdgeInsets.all(5),
                child: Card(
                  elevation: 0,
                  shape: RoundedRectangleBorder(
                      side: BorderSide(
                        color: AppColors.separatorGrey,
                      ),
                      borderRadius: BorderRadius.circular(5)),
                  color: AppColors.whiteColor,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Center(
                        child: Container(
                          constraints: new BoxConstraints.expand(
                              height: 200.0, width: 450),
                          alignment: Alignment.bottomLeft,
                          padding: new EdgeInsets.only(
                              left: 16.0, bottom: 8.0, top: 8.0),
                          decoration: new BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            image: new DecorationImage(
                              image: new NetworkImage(
                                  'https://www.eastcoastdaily.in/wp-content/uploads/2018/05/veg-paratha-1.png'),
                              fit: BoxFit.fill,
                            ),
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Row(
                                children: <Widget>[
                                  Container(
                                    padding: EdgeInsets.only(
                                        left: 5, right: 10, top: 5, bottom: 5),
                                    decoration: BoxDecoration(
                                        color: AppColors.persianColor,
                                        borderRadius:
                                            BorderRadius.circular(5.0)),
                                    child: new Text('Well sanized kitchen',
                                        style: new TextStyle(
                                            fontSize: 12.0,
                                            color: AppColors.whiteColor)),
                                  ),
                                  SizedBox(
                                    width: 5.0,
                                  ),
                                  Container(
                                    padding: EdgeInsets.only(
                                        left: 5, right: 10, top: 5, bottom: 5),
                                    decoration: BoxDecoration(
                                        color: AppColors.persianColor,
                                        borderRadius:
                                            BorderRadius.circular(5.0)),
                                    child: new Text('Daily Temperature checks',
                                        style: new TextStyle(
                                            fontSize: 12.0,
                                            color: AppColors.whiteColor)),
                                  ),
                                ],
                              ),
                              Container(
                                padding: EdgeInsets.only(
                                    left: 5, right: 10, top: 5, bottom: 5),
                                decoration: BoxDecoration(
                                    color: AppColors.highlighterBlueDark,
                                    borderRadius: BorderRadius.circular(5.0)),
                                child: new Text('30% OFF - no code required',
                                    style: new TextStyle(
                                        fontSize: 12.0,
                                        color: AppColors.whiteColor)),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.all(10),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text(
                              name, //Vendor name
                              style: TextStyles.actionTitle,
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 2.0),
                              child: Row(
                                children: <Widget>[
                                  StarRating(
                                    rating: 3.5, //venor rating
                                    onRatingChanged: (rating) =>
                                        setState(() => rating),
                                  ),
                                  SizedBox(
                                    width: 3.0,
                                  ),
                                  Text(
                                    '3.5', //vendor rating
                                    style: TextStyles.paragraphBold,
                                  ),
                                  SizedBox(
                                    width: 3.0,
                                  ),
                                  Text(
                                    '(5548 Delivery Reviews)',
                                    style: TextStyles.paragraphdemibold,
                                  )
                                ],
                              ),
                            ),
                            Text(
                              'North Indian, Chinese, Fast Food, Mughlai', //catagories
                              style: TextStyles.subText,
                            ),
                            Text(
                              '\u20B9200 per person ' + //min order value
                                  String.fromCharCode(0x00B7) +
                                  ' 44 mins', //preaparing time
                              style: TextStyles.subText,
                            ),
                          ],
                        ),
                      ),
                      Divider(color: Colors.grey[95]),
                      SizedBox(
                        height: 1,
                      )
                    ],
                  ),
                ),
              );
            });
      },
    );
  }
}
