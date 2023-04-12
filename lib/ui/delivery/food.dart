import 'package:flutter/material.dart';
import 'package:zomatoui/banners.dart';
import 'package:zomatoui/constants/textstyles.dart';
import 'package:zomatoui/offers_banner.dart';
import 'package:zomatoui/ui/delivery/restaurant/restaurant_list_api.dart';
import 'package:zomatoui/ui_helper.dart';

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
          StillBanner(),
          SizedBox(
            height: 10,
          ),
          OfferBannerView(),

          Container(
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    Center(
                      child: Container(
                        constraints: new BoxConstraints.expand(
                            height: 200.0, width: 165),
                        alignment: Alignment.bottomLeft,
                        padding: new EdgeInsets.only(left: 8.0, bottom: 4.0),
                        decoration: new BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          image: new DecorationImage(
                            image: new NetworkImage(
                                'https://cdn.pixabay.com/photo/2017/01/26/02/06/platter-2009590_1280.jpg'),
                            fit: BoxFit.fitHeight,
                          ),
                        ),
                        child: Container(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.end,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              new Text('Trending this\nWeek',
                                  style: TextStyles.actionTitleWhite),
                              Text(
                                '30 Places',
                                style: TextStyles.highlighterOne,
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Center(
                      child: Container(
                        constraints: new BoxConstraints.expand(
                            height: 200.0, width: 165),
                        alignment: Alignment.bottomLeft,
                        padding: new EdgeInsets.only(left: 8.0, bottom: 4.0),
                        decoration: new BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          image: new DecorationImage(
                            image: new NetworkImage(
                                'https://cdn.pixabay.com/photo/2017/12/17/13/10/architecture-3024174_1280.jpg'),
                            fit: BoxFit.fitHeight,
                          ),
                        ),
                        child: Container(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.end,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              new Text("Bengaluru's \nFinest",
                                  style: TextStyles.actionTitleWhite),
                              Text(
                                '124 Places',
                                style: TextStyles.highlighterOne,
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Center(
                      child: Container(
                        constraints: new BoxConstraints.expand(
                            height: 200.0, width: 165),
                        alignment: Alignment.bottomLeft,
                        padding: new EdgeInsets.only(left: 8.0, bottom: 4.0),
                        decoration: new BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          image: new DecorationImage(
                            image: new NetworkImage(
                                'https://cdn.pixabay.com/photo/2015/05/15/14/55/cafe-768771__480.jpg'),
                            fit: BoxFit.fitHeight,
                          ),
                        ),
                        child: Container(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.end,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              new Text('Newly Opened',
                                  style: TextStyles.actionTitleWhite),
                              Text(
                                '6 Places',
                                style: TextStyles.highlighterOne,
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Center(
                      child: Container(
                        constraints: new BoxConstraints.expand(
                            height: 200.0, width: 165),
                        alignment: Alignment.bottomLeft,
                        padding: new EdgeInsets.only(left: 8.0, bottom: 4.0),
                        decoration: new BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          image: new DecorationImage(
                            image: new NetworkImage(
                                'https://cdn.pixabay.com/photo/2019/03/31/07/48/food-4092617__480.jpg'),
                            fit: BoxFit.fitHeight,
                          ),
                        ),
                        child: Container(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.end,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              new Text('Just Delivery',
                                  style: TextStyles.actionTitleWhite),
                              Text(
                                '10 Places',
                                style: TextStyles.highlighterOne,
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Center(
                      child: Container(
                        constraints: new BoxConstraints.expand(
                            height: 200.0, width: 165),
                        alignment: Alignment.bottomLeft,
                        padding: new EdgeInsets.only(left: 8.0, bottom: 4.0),
                        decoration: new BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          image: new DecorationImage(
                            image: new NetworkImage(
                                'https://cdn.pixabay.com/photo/2015/03/26/09/42/breakfast-690128__480.jpg'),
                            fit: BoxFit.fitHeight,
                          ),
                        ),
                        child: Container(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.end,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              new Text('Legends of \nGold',
                                  style: TextStyles.actionTitleWhite),
                              Text(
                                '10 Places',
                                style: TextStyles.highlighterOne,
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          // Container(
          //   child: Card(
          //     elevation: 0,
          //     shape: RoundedRectangleBorder(
          //       side: BorderSide(
          //         color: AppColors.separatorGrey,
          //       ),
          //       borderRadius: BorderRadius.circular(5),
          //     ),
          //     color: AppColors.whiteColor,
          //     child: ListTile(
          //       trailing: Icon(Icons.arrow_forward),
          //       title: Text(
          //         'See Safe & hygenic restaurants',
          //         style: TextStyles.h1Heading,
          //       ),
          //       subtitle: Text('delivering to you right now'),
          //     ),
          //   ),
          // ),
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

class StillBanner extends StatelessWidget {
  const StillBanner({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        ClipRRect(
          borderRadius: BorderRadius.circular(10.0),
          child: InkWell(
            child: Container(
              height: 150.0,
              color: Color(0xFFF48635),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  Align(
                    alignment: Alignment.topLeft,
                    child: FractionallySizedBox(
                      widthFactor: 0.7,
                      child: Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text(
                              'Restaurants',
                              style: Theme.of(context)
                                  .textTheme
                                  .headlineMedium
                                  .copyWith(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold),
                            ),
                            UIHelper.verticalSpaceExtraSmall(),
                            Text(
                              'No-contact delivery available',
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyLarge
                                  .copyWith(color: Colors.white),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                  const Spacer(),
                  Container(
                    height: 45.0,
                    padding: const EdgeInsets.symmetric(horizontal: 10.0),
                    color: Color(0xFFF48635),
                    child: Row(
                      children: <Widget>[
                        Text(
                          'View all',
                          style: Theme.of(context).textTheme.bodyLarge.copyWith(
                                color: Colors.white,
                                fontSize: 18.0,
                                fontWeight: FontWeight.bold,
                              ),
                        ),
                        UIHelper.horizontalSpaceSmall(),
                        const Icon(
                          Icons.arrow_forward,
                          color: Colors.white,
                          size: 18.0,
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
            // onTap: isTabletDesktop
            //     ? () {}
            //     : () {
            // Navigator.push(
            //   context,
            //   MaterialPageRoute(
            //     builder: (context) => AllRestaurantsScreen(),
            //   ),
            // );
          ),
        ),
        Positioned(
          top: -10.0,
          right: -10.0,
          child: ClipOval(
            child: Image.asset(
              'images/food1.jpg',
              width: 130.0,
              height: 130.0,
              fit: BoxFit.cover,
            ),
          ),
        ),
      ],
    );
  }
}
