import 'dart:convert';

import 'package:flutter/material.dart';
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

  RestData(
      this.name, this.description, this.address, this.logo, this.feature_image);
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

    while (hasNextPage) {
      final response = await http.get(
          Uri.parse('https://admin.fataakse.co.in/api/vendors?page=$page'));
      var data = jsonDecode(response.body.toString());

      if (response.statusCode == 200) {
        for (Map i in data['data']) {
          if (i['is_active'] == 1) {
            // Check if the data is active
            RestData restData = RestData(i['name'], i['description'],
                i['address'], i['logo_url'], i['feature_image']);
            restaurantList.add(restData);
            activeCount++;
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

    return restaurantList;
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: getRestData(),
        builder: (context, AsyncSnapshot<List<RestData>> snapshot) {
          return ListView.builder(
              itemCount: snapshot.hasData ? snapshot.data.length : 0,
              itemBuilder: (context, index) {
                return GestureDetector(
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
                                      snapshot.data[index].feature_image),
                                  fit: BoxFit.fill,
                                ),
                              ),
                              child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.start,
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
                                            left: 5,
                                            right: 10,
                                            top: 5,
                                            bottom: 5),
                                        decoration: BoxDecoration(
                                            color: AppColors.persianColor,
                                            borderRadius:
                                                BorderRadius.circular(5.0)),
                                        child: new Text(
                                            'Daily Temperature checks',
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
                                        borderRadius:
                                            BorderRadius.circular(5.0)),
                                    child: new Text(
                                        '30% OFF - no code required',
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
                                  snapshot.data[index].name
                                      .toString(), //Vendor name
                                  style: TextStyles.actionTitle,
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(top: 2.0),
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
                );
              });
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
