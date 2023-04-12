import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:http/http.dart' as http;
import 'package:zomatoui/widgets/rating.dart';

import '../../../constants/colors.dart';
import '../../../constants/textstyles.dart';
import 'menu.dart';

main() {
  runApp(
    MaterialApp(
      home: RestaurentCardWidget(),
    ),
  );
}

class RestData {
  final String name;
  final String description;
  final String address;
  final String logo;
  final String feature_image;
  final int id;

  RestData(this.name, this.description, this.address, this.logo,
      this.feature_image, this.id);
}

class RestaurentCardWidget extends StatefulWidget {
  RestaurentCardWidget({Key key}) : super(key: key);
  @override
  _RestaurentCardWidgetState createState() => _RestaurentCardWidgetState();
}

class _RestaurentCardWidgetState extends State<RestaurentCardWidget> {
  List<RestData> restaurantList = [];
  _RestaurentCardWidgetState();
  dynamic activeCount = 0;

  Future<List<RestData>> getRestData() async {
    List<RestData> restaurantList = [];
    int page = 1;
    bool hasNextPage = true;
    int activeCount = 0; // Initialize activeCount to 0

    while (hasNextPage) {
      final response = await http.get(
          Uri.parse('https://admin.fataakse.co.in/api/vendors?page=$page'));
      var data = jsonDecode(response.body.toString());

      if (response.statusCode == 200) {
        for (Map i in data['data']) {
          if (i['is_active'] == 1) {
            // Check if the data is active
            RestData restData = RestData(i['name'], i['description'],
                i['address'], i['logo_url'], i['feature_image'], i['id']);
            restaurantList.add(restData);
            activeCount++; // Increment activeCount only if is_active is 1
          }
        }

        // Check if there are more pages
        if (data['next_page_url'] != null) {
          page++;
        } else {
          hasNextPage = false;
        }
      } else {
        Center(
          child: CircularProgressIndicator(),
        );
        return restaurantList;
      }
    }

    print(activeCount);
    return restaurantList;
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: getRestData(),
        builder: (context, AsyncSnapshot<List<RestData>> snapshot) {
          return Container(
            height:
                snapshot.hasData ? snapshot.data.length.toDouble() * 420 : 0,
            child: Column(
              children: [
                Container(
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          '${snapshot.hasData ? snapshot.data.length.toString() : 'loading'} delivery places around you',
                          style: TextStyles.h1Heading,
                        ),
                        SizedBox(
                          height: 5.0,
                        ),
                        Text(
                          'Everything in a list - go nuts!',
                          style: TextStyles.subText,
                        ),
                      ],
                    ),
                  ),
                ),
                Divider(),
                Container(
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: <Widget>[
                          Container(
                            child: Card(
                                elevation: 0,
                                shape: RoundedRectangleBorder(
                                    side: BorderSide(
                                      color: AppColors.separatorGrey,
                                    ),
                                    borderRadius: BorderRadius.circular(5)),
                                color: AppColors.whiteColor,
                                child: Padding(
                                  padding: const EdgeInsets.all(7.0),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: <Widget>[
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: <Widget>[
                                          Icon(
                                            FontAwesome.filter,
                                            size: 18,
                                            color:
                                                AppColors.primaryTextColorGrey,
                                          ),
                                          SizedBox(
                                            width: 5,
                                          ),
                                          Text(
                                            'Filters',
                                            style: TextStyles.highlighterOne,
                                          )
                                        ],
                                      ),
                                    ],
                                  ),
                                )),
                          ),
                          SizedBox(
                            width: 5,
                          ),
                          Container(
                            child: Card(
                                elevation: 0,
                                shape: RoundedRectangleBorder(
                                    side: BorderSide(
                                      color: AppColors.separatorGrey,
                                    ),
                                    borderRadius: BorderRadius.circular(5)),
                                color: AppColors.whiteColor,
                                child: Padding(
                                  padding: const EdgeInsets.all(7.0),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: <Widget>[
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: <Widget>[
                                          Text(
                                            'Rating:',
                                            style: TextStyles.highlighterOne,
                                          ),
                                          SizedBox(
                                            width: 5,
                                          ),
                                          Text(
                                            '4.0+',
                                            style: TextStyles.highlighterOne,
                                          )
                                        ],
                                      ),
                                    ],
                                  ),
                                )),
                          ),
                          SizedBox(
                            width: 5,
                          ),
                          Container(
                            child: Card(
                                elevation: 0,
                                shape: RoundedRectangleBorder(
                                    side: BorderSide(
                                      color: AppColors.separatorGrey,
                                    ),
                                    borderRadius: BorderRadius.circular(5)),
                                color: AppColors.whiteColor,
                                child: Padding(
                                  padding: const EdgeInsets.all(7.0),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: <Widget>[
                                      Text(
                                        'Safe and Hygenic',
                                        style: TextStyles.highlighterOne,
                                      )
                                    ],
                                  ),
                                )),
                          ),
                          SizedBox(
                            width: 5,
                          ),
                          Container(
                            child: Card(
                                elevation: 0,
                                shape: RoundedRectangleBorder(
                                    side: BorderSide(
                                      color: AppColors.separatorGrey,
                                    ),
                                    borderRadius: BorderRadius.circular(5)),
                                color: AppColors.whiteColor,
                                child: Padding(
                                  padding: const EdgeInsets.all(7.0),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: <Widget>[
                                      Text(
                                        'Fastest Delivery',
                                        style: TextStyles.highlighterOne,
                                      )
                                    ],
                                  ),
                                )),
                          ),
                          SizedBox(
                            width: 5,
                          ),
                          Container(
                            child: Card(
                                elevation: 0,
                                shape: RoundedRectangleBorder(
                                    side: BorderSide(
                                      color: AppColors.separatorGrey,
                                    ),
                                    borderRadius: BorderRadius.circular(5)),
                                color: AppColors.whiteColor,
                                child: Padding(
                                  padding: const EdgeInsets.all(7.0),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: <Widget>[
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: <Widget>[
                                          Text(
                                            'Rating',
                                            style: TextStyles.highlighterOne,
                                          ),
                                          SizedBox(
                                            width: 5,
                                          ),
                                          Icon(
                                            Icons.arrow_drop_down,
                                            size: 18,
                                            color:
                                                AppColors.primaryTextColorGrey,
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                )),
                          ),
                          SizedBox(
                            width: 5,
                          ),
                          Container(
                            child: Card(
                                elevation: 0,
                                shape: RoundedRectangleBorder(
                                    side: BorderSide(
                                      color: AppColors.separatorGrey,
                                    ),
                                    borderRadius: BorderRadius.circular(5)),
                                color: AppColors.whiteColor,
                                child: Padding(
                                  padding: const EdgeInsets.all(7.0),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: <Widget>[
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: <Widget>[
                                          Text(
                                            'Cost',
                                            style: TextStyles.highlighterOne,
                                          ),
                                          SizedBox(
                                            width: 5,
                                          ),
                                          Icon(
                                            Icons.arrow_drop_down,
                                            size: 18,
                                            color:
                                                AppColors.primaryTextColorGrey,
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                )),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Divider(),
                Expanded(
                  child: ListView.builder(
                      physics: NeverScrollableScrollPhysics(),
                      itemCount: snapshot.hasData ? snapshot.data.length : 0,
                      itemBuilder: (context, index) {
                        return Column(
                          children: [
                            GestureDetector(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => RestaurantDetailPage(
                                        restData: snapshot.data[index]),
                                  ),
                                );
                              },
                              child: Container(
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
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: <Widget>[
                                      Center(
                                        child: Container(
                                          constraints:
                                              new BoxConstraints.expand(
                                                  height: 200.0, width: 450),
                                          alignment: Alignment.bottomLeft,
                                          padding: new EdgeInsets.only(
                                              left: 16.0,
                                              bottom: 8.0,
                                              top: 8.0),
                                          decoration: new BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(5),
                                            image: new DecorationImage(
                                              image: new NetworkImage(snapshot
                                                  .data[index].feature_image),
                                              fit: BoxFit.fill,
                                            ),
                                          ),
                                          child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: <Widget>[
                                              Row(
                                                children: <Widget>[
                                                  Container(
                                                    padding: EdgeInsets.only(
                                                        left: 5,
                                                        right: 10,
                                                        top: 5,
                                                        bottom: 5),
                                                    decoration: BoxDecoration(
                                                        color: AppColors
                                                            .persianColor,
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(5.0)),
                                                    child: new Text(
                                                        'Well sanized kitchen',
                                                        style: new TextStyle(
                                                            fontSize: 12.0,
                                                            color: AppColors
                                                                .whiteColor)),
                                                  ),
                                                  SizedBox(
                                                    width: 5.0,
                                                  ),
                                                  Container(
                                                    padding: EdgeInsets.only(
                                                        left: 5,
                                                        right: 10,
                                                        top: 5,
                                                        bottom: 5),
                                                    decoration: BoxDecoration(
                                                        color: AppColors
                                                            .persianColor,
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(5.0)),
                                                    child: new Text(
                                                        'Daily Temperature checks',
                                                        style: new TextStyle(
                                                            fontSize: 12.0,
                                                            color: AppColors
                                                                .whiteColor)),
                                                  ),
                                                ],
                                              ),
                                              Container(
                                                padding: EdgeInsets.only(
                                                    left: 5,
                                                    right: 10,
                                                    top: 5,
                                                    bottom: 5),
                                                decoration: BoxDecoration(
                                                    color: AppColors
                                                        .highlighterBlueDark,
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            5.0)),
                                                child: new Text(
                                                    '30% OFF - no code required',
                                                    style: new TextStyle(
                                                        fontSize: 12.0,
                                                        color: AppColors
                                                            .whiteColor)),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                      Container(
                                        padding: EdgeInsets.all(10),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: <Widget>[
                                            Text(
                                              snapshot.data[index].name
                                                  .toString(), //Vendor name
                                              style: TextStyles.actionTitle,
                                            ),
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                  top: 2.0),
                                              child: Row(
                                                children: <Widget>[
                                                  StarRating(
                                                    rating: 3.5, //venor rating
                                                  ),
                                                  SizedBox(
                                                    width: 3.0,
                                                  ),
                                                  Text(
                                                    '3.5', //vendor rating
                                                    style: TextStyles
                                                        .paragraphBold,
                                                  ),
                                                  SizedBox(
                                                    width: 3.0,
                                                  ),
                                                  Text(
                                                    '(5548 Delivery Reviews)',
                                                    style: TextStyles
                                                        .paragraphdemibold,
                                                  )
                                                ],
                                              ),
                                            ),
                                            Text(
                                              snapshot.data[index].description
                                                  .toString(), //catagories
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
                              ),
                            ),
                          ],
                        );
                      }),
                ),
              ],
            ),
          );
        });
  }
}

// ListTile(
// leading: CircleAvatar(
// backgroundImage: NetworkImage(
// snapshot.data[index].url.toString()),
// ),
// subtitle: Text(snapshot.data[index].title.toString()),
// title: Text(
// 'Notes id:' + snapshot.data[index].id.toString()),
// );
