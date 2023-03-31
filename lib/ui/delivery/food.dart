import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:zomatoui/constants/colors.dart';
import 'package:zomatoui/constants/textstyles.dart';
import 'package:zomatoui/ui/delivery/restaurant/restaurant_list_api.dart';

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
          Container(
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Column(
                    children: <Widget>[
                      ClipRRect(
                        borderRadius: BorderRadius.circular(4.0),
                        child: Image.network(
                          'https://e7.pngegg.com/pngimages/635/1022/png-clipart-blue-ceramic-bowl-with-ice-cream-in-it-chocolate-ice-cream-milkshake-ice-cream-cone-ice-cream-free-cream-food.png',
                          height: 80,
                          width: 80,
                          fit: BoxFit.cover,
                        ),
                      ),
                      SizedBox(
                        height: 5.0,
                      ),
                      Text('Ice Cream')
                    ],
                  ),
                  Column(
                    children: <Widget>[
                      ClipRRect(
                        borderRadius: BorderRadius.circular(4.0),
                        child: Image.network(
                          'https://w7.pngwing.com/pngs/134/682/png-transparent-paradise-hotel-hyderabadi-biryani-hyderabadi-cuisine-indian-cuisine-kerala-biriyani-food-recipe-cuisine.png',
                          height: 80,
                          width: 80,
                          fit: BoxFit.cover,
                        ),
                      ),
                      SizedBox(
                        height: 5.0,
                      ),
                      Text('Biryani')
                    ],
                  ),
                  Column(
                    children: <Widget>[
                      ClipRRect(
                        borderRadius: BorderRadius.circular(4.0),
                        child: Image.network(
                          'https://assets.stickpng.com/images/580b57fbd9996e24bc43c0cc.png',
                          height: 80,
                          width: 80,
                          fit: BoxFit.cover,
                        ),
                      ),
                      SizedBox(
                        height: 5.0,
                      ),
                      Text('Chicken')
                    ],
                  ),
                  Column(
                    children: <Widget>[
                      ClipRRect(
                          borderRadius: BorderRadius.circular(4.0),
                          child: Image.network(
                            'https://e7.pngegg.com/pngimages/547/938/png-clipart-several-assorted-flavor-sherbets-ice-cream-milkshake-juice-milkshake-cream-food.png',
                            height: 80,
                            width: 80,
                            fit: BoxFit.cover,
                          )),
                      SizedBox(
                        height: 5.0,
                      ),
                      Text('Shake')
                    ],
                  ),
                ],
              ),
            ),
          ),
          Container(
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Column(
                    children: <Widget>[
                      ClipRRect(
                          borderRadius: BorderRadius.circular(4.0),
                          child: Image.network(
                            'https://w7.pngwing.com/pngs/369/24/png-transparent-hamburger-chicken-sandwich-veggie-burger-fast-food-burger-king-food-recipe-fast-food-restaurant.png',
                            height: 80,
                            width: 80,
                            fit: BoxFit.cover,
                          )),
                      SizedBox(
                        height: 5.0,
                      ),
                      Text('Burger')
                    ],
                  ),
                  Column(
                    children: <Widget>[
                      ClipRRect(
                          borderRadius: BorderRadius.circular(4.0),
                          child: Image.network(
                            'https://e7.pngegg.com/pngimages/935/770/png-clipart-pizza-pizza.png',
                            height: 80,
                            width: 80,
                            fit: BoxFit.cover,
                          )),
                      SizedBox(
                        height: 5.0,
                      ),
                      Text('Pizza')
                    ],
                  ),
                  Column(
                    children: <Widget>[
                      ClipRRect(
                          borderRadius: BorderRadius.circular(4.0),
                          child: Image.network(
                            'https://w7.pngwing.com/pngs/323/803/png-transparent-chocolate-ice-cream-sundae-chocolate-brownie-chocolate-pudding-sundae-cream-food-frozen-dessert.png',
                            height: 80,
                            width: 80,
                            fit: BoxFit.cover,
                          )),
                      SizedBox(
                        height: 5.0,
                      ),
                      Text('Sundae')
                    ],
                  ),
                  Column(
                    children: <Widget>[
                      ClipRRect(
                          borderRadius: BorderRadius.circular(4.0),
                          child: Image.network(
                            'https://desichef.in/assets/img/product/slider-image/malabar_paratha.png',
                            height: 80,
                            width: 80,
                            fit: BoxFit.cover,
                          )),
                      SizedBox(
                        height: 5.0,
                      ),
                      Text('Paratha')
                    ],
                  ),
                ],
              ),
            ),
          ),
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
          Container(height: 470, child: ExampleTwo()),
        ],
      ),
    );
  }
}
