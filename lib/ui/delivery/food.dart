import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:zomatoui/constants/colors.dart';
import 'package:zomatoui/constants/textstyles.dart';
import 'package:zomatoui/ui/delivery/restaurant/restaurant_list_api.dart';

import 'categories_apilist.dart';

class FoodTab extends StatefulWidget {
  @override
  _FoodTabState createState() => _FoodTabState();
}

class _FoodTabState extends State<FoodTab> {
  double rating = 3.5;
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            child: Card(
              elevation: 0,
              shape: RoundedRectangleBorder(
                side: BorderSide(
                  color: AppColors.separatorGrey,
                ),
                borderRadius: BorderRadius.circular(5),
              ),
              color: AppColors.whiteColor,
              child: ListTile(
                trailing: Icon(Icons.arrow_forward),
                title: Text(
                  'See Safe & hygenic restaurants',
                  style: TextStyles.h1Heading,
                ),
                subtitle: Text('delivering to you right now'),
              ),
            ),
          ),
          Container(
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    'Cravings',
                    style: TextStyles.h1Heading,
                  ),
                  SizedBox(
                    height: 5.0,
                  ),
                  Text(
                    'Most Ordered in your city',
                    style: TextStyles.subText,
                  ),
                ],
              ),
            ),
          ),
          CategoryList(),
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
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: <Widget>[
                                    Icon(
                                      FontAwesome.filter,
                                      size: 18,
                                      color: AppColors.primaryTextColorGrey,
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
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
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
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
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
                                      color: AppColors.primaryTextColorGrey,
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
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
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
                                      color: AppColors.primaryTextColorGrey,
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
          Container(
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    '69 delivery places around you',
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
          Column(
            children: [
              Container(
                height: 470,
                child: RestaurentCardWidget(),
              ),
              // Container(
              //   decoration: BoxDecoration(
              //     borderRadius: BorderRadius.circular(10),
              //     color: Colors.grey,
              //   ),
              //   padding: EdgeInsets.all(50),
              //   child: Text(
              //     'Have a nice day',
              //     style: TextStyle(
              //       color: Colors.white,
              //       fontSize: 24,
              //     ),
              //   ),
              // ),
            ],
          ),
        ],
      ),
    );
  }
}
