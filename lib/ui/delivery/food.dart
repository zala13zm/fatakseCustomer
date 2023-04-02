import 'package:flutter/material.dart';
import 'package:zomatoui/banners.dart';
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
          SizedBox(
            height: 10,
          ),
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
          Container(child: CategoryList()),
          BannerCarousel(),
          RestaurentCardWidget(),
        ],
      ),
    );
  }
}
