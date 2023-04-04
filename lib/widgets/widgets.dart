import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:zomatoui/ui_helper.dart';

class SearchBar extends StatelessWidget {
  String hintText;
  SearchBar(this.hintText);

  TextEditingController controller = new TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Card(
        elevation: 0,
        shape: RoundedRectangleBorder(
          side: BorderSide(
            color: Colors.grey,
          ),
          borderRadius: BorderRadius.circular(5),
        ),
        color: Colors.white,
        child: ListTile(
          dense: true,
          leading: Icon(Ionicons.ios_search, color: Colors.black),
          title: Text(hintText),
        ),
      ),
    );
  }
}

class SearchScreen extends StatefulWidget {
  const SearchScreen({Key key}) : super(key: key);

  @override
  _SearchScreenState createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen>
    with SingleTickerProviderStateMixin {
  TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    super.dispose();
    _tabController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Container(
                padding:
                    const EdgeInsets.only(left: 15.0, top: 2.0, bottom: 2.0),
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey[400]),
                  borderRadius: BorderRadius.circular(2.0),
                ),
                child: Row(
                  children: <Widget>[
                    Expanded(
                      child: TextField(
                        decoration: InputDecoration(
                          hintText: 'Search for restaurants and food',
                          hintStyle:
                              Theme.of(context).textTheme.titleSmall.copyWith(
                                    color: Colors.grey,
                                    fontSize: 17.0,
                                    fontWeight: FontWeight.w600,
                                  ),
                          border: InputBorder.none,
                        ),
                      ),
                    ),
                    UIHelper.horizontalSpaceMedium(),
                    IconButton(
                      icon: const Icon(Icons.search),
                      onPressed: () {},
                    )
                  ],
                ),
              ),
              UIHelper.verticalSpaceExtraSmall(),
              TabBar(
                unselectedLabelColor: Colors.grey,
                labelColor: Colors.black,
                controller: _tabController,
                indicatorColor: Color(0xFFF48635),
                labelStyle: Theme.of(context)
                    .textTheme
                    .titleSmall
                    .copyWith(fontSize: 18.0, color: Color(0xFFF48635)),
                unselectedLabelStyle:
                    Theme.of(context).textTheme.titleSmall.copyWith(
                          fontSize: 18.0,
                          color: Colors.grey[200],
                        ),
                indicatorSize: TabBarIndicatorSize.tab,
                tabs: const [
                  Tab(child: Text('Restaurant')),
                  Tab(child: Text('Dishes')),
                ],
              ),
              UIHelper.verticalSpaceSmall(),
              Divider(
                height: 8.0,
              ),
              Expanded(
                child: TabBarView(
                  controller: _tabController,
                  children: [
                    _SearchListView(),
                    _SearchListView(),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _SearchListView extends StatelessWidget {
  final List<SpotlightBestTopFood> foods = [
    ...SpotlightBestTopFood.getPopularAllRestaurants(),
    ...SpotlightBestTopFood.getPopularAllRestaurants()
  ];

  @override
  Widget build(BuildContext context) {
    foods.shuffle();

    return ListView.builder(
      shrinkWrap: true,
      itemCount: foods.length,
      itemBuilder: (context, index) => SearchFoodListItemView(
        food: foods[index],
      ),
    );
  }
}

class SpotlightBestTopFood {
  const SpotlightBestTopFood({
    this.image,
    this.name,
    this.desc,
    this.coupon,
    this.ratingTimePrice,
  });

  final String image;
  final String name;
  final String desc;
  final String coupon;
  final String ratingTimePrice;

  static List<List<SpotlightBestTopFood>> getSpotlightRestaurants() {
    return const [
      [
        SpotlightBestTopFood(
          image: 'images/food1.jpg',
          name: 'Breakfast Expresss',
          desc: 'Continental North Indian, South Indian',
          coupon: '20 \$ off | Use JUMBO',
          ratingTimePrice: '4.1 45 mins - Rs 200 for two',
        ),
        SpotlightBestTopFood(
          image: 'images/food1.jpg',
          name: 'Namma Veedu Bhavan',
          desc: 'South Indian',
          coupon: '20 \$ off | Use SWIGGYIT',
          ratingTimePrice: '4.1 35 mins - Rs 150 for two',
        ),
      ],
      [
        SpotlightBestTopFood(
          image: 'images/food1.jpg',
          name: 'A2B Chennai',
          desc: 'South Indian',
          coupon: '30 \$ off | Use A2BSUPER',
          ratingTimePrice: '4.2 32 mins - Rs 130 for two',
        ),
        SpotlightBestTopFood(
          image: 'images/food1.jpg',
          name: 'Dinner Expresss',
          desc: 'North Indian',
          coupon: '20 \$ off | Use JUMBO',
          ratingTimePrice: '3.8 25 mins - Rs 200 for two',
        ),
      ],
      [
        SpotlightBestTopFood(
          image: 'images/food1.jpg',
          name: 'Parota King',
          desc: 'South Indian',
          coupon: '20 \$ off | Use SWIGGYIT',
          ratingTimePrice: '4.1 55 mins - Rs 100 for two',
        ),
        SpotlightBestTopFood(
          image: 'images/food1.jpg',
          name: 'Mass Hotel',
          desc: 'South Indian',
          coupon: '30 \$ off | Use JUMBO',
          ratingTimePrice: '4.3 22 mins - Rs 150 for two',
        ),
      ],
      [
        SpotlightBestTopFood(
          image: 'images/food1.jpg',
          name: 'Mumbai Mirchi',
          desc: 'South Indian',
          coupon: '20 \$ off | Use JUMBO',
          ratingTimePrice: '4.1 25 mins - Rs 120 for two',
        ),
        SpotlightBestTopFood(
          image: 'images/food1.jpg',
          name: 'BBQ Nation',
          desc: 'South Indian',
          coupon: '30 \$ off | Use JUMBO',
          ratingTimePrice: '4.3 42 mins - Rs 350 for two',
        ),
      ]
    ];
  }

  static List<List<SpotlightBestTopFood>> getBestRestaurants() {
    return const [
      [
        SpotlightBestTopFood(
          image: 'images/food1.jpg',
          name: 'Mirchi Hotel',
          desc: 'South Indian',
          coupon: '30 \$ off | Use JUMBO',
          ratingTimePrice: '4.3 22 mins - Rs 150 for two',
        ),
        SpotlightBestTopFood(
          image: 'images/food1.jpg',
          name: 'BBQ Expresss',
          desc: 'Continental North Indian, South Indian',
          coupon: '20 \$ off | Use JUMBO',
          ratingTimePrice: '4.1 15 mins - Rs 200 for two',
        ),
      ],
      [
        SpotlightBestTopFood(
          image: 'images/food1.jpg',
          name: 'Lunch Expresss',
          desc: 'North Indian',
          coupon: '20 \$ off | Use JUMBO',
          ratingTimePrice: '3.8 35 mins - Rs 200 for two',
        ),
        SpotlightBestTopFood(
          image: 'images/food1.jpg',
          name: 'A2B Chennai',
          desc: 'South Indian',
          coupon: '30 \$ off | Use A2BSUPER',
          ratingTimePrice: '4.2 42 mins - Rs 130 for two',
        ),
      ],
      [
        SpotlightBestTopFood(
          image: 'images/food1.jpg',
          name: 'Mirchi Hotel',
          desc: 'South Indian',
          coupon: '30 \$ off | Use JUMBO',
          ratingTimePrice: '4.3 22 mins - Rs 150 for two',
        ),
        SpotlightBestTopFood(
          image: 'images/food1.jpg',
          name: 'Parota World',
          desc: 'South Indian',
          coupon: '20 \$ off | Use SWIGGYIT',
          ratingTimePrice: '4.1 25 mins - Rs 100 for two',
        ),
      ],
      [
        SpotlightBestTopFood(
          image: 'images/food1.jpg',
          name: 'Chennai Mirchi',
          desc: 'South Indian',
          coupon: '20 \$ off | Use JUMBO',
          ratingTimePrice: '4.1 25 mins - Rs 120 for two',
        ),
        SpotlightBestTopFood(
          image: 'images/food1.jpg',
          name: 'BBQ Nation',
          desc: 'South Indian',
          coupon: '30 \$ off | Use JUMBO',
          ratingTimePrice: '4.3 45 mins - Rs 350 for two',
        ),
      ]
    ];
  }

  static List<List<SpotlightBestTopFood>> getTopRestaurants() {
    return const [
      [
        SpotlightBestTopFood(
          image: 'images/food1.jpg',
          name: 'A2B Chennai',
          desc: 'South Indian',
          coupon: '30 \$ off | Use A2BSUPER',
          ratingTimePrice: '4.2 32 mins - Rs 130 for two',
        ),
        SpotlightBestTopFood(
          image: 'images/food1.jpg',
          name: 'Biryani Expresss',
          desc: 'North Indian',
          coupon: '20 \$ off | Use JUMBO',
          ratingTimePrice: '3.8 15 mins - Rs 200 for two',
        ),
      ],
      [
        SpotlightBestTopFood(
          image: 'images/food1.jpg',
          name: 'Chai Truck',
          desc: 'Continental North Indian, South Indian',
          coupon: '20 \$ off | Use JUMBO',
          ratingTimePrice: '4.1 25 mins - Rs 200 for two',
        ),
        SpotlightBestTopFood(
          image: 'images/food1.jpg',
          name: 'Shiva Bhavan',
          desc: 'South Indian',
          coupon: '20 \$ off | Use SWIGGYIT',
          ratingTimePrice: '4.1 35 mins - Rs 150 for two',
        ),
      ],
      [
        SpotlightBestTopFood(
          image: 'images/food1.jpg',
          name: 'BBQ King',
          desc: 'South Indian',
          coupon: '20 \$ off | Use JUMBO',
          ratingTimePrice: '4.1 25 mins - Rs 120 for two',
        ),
        SpotlightBestTopFood(
          image: 'images/food1.jpg',
          name: 'Pizza Corner',
          desc: 'South Indian',
          coupon: '30 \$ off | Use JUMBO',
          ratingTimePrice: '4.3 47 mins - Rs 350 for two',
        ),
      ],
      [
        SpotlightBestTopFood(
          image: 'images/food1.jpg',
          name: 'Veg King',
          desc: 'South Indian',
          coupon: '20 \$ off | Use SWIGGYIT',
          ratingTimePrice: '4.1 25 mins - Rs 100 for two',
        ),
        SpotlightBestTopFood(
          image: 'images/food1.jpg',
          name: 'Adyar Hotel',
          desc: 'South Indian',
          coupon: '30 \$ off | Use JUMBO',
          ratingTimePrice: '4.3 21 mins - Rs 150 for two',
        ),
      ],
    ];
  }

  static List<SpotlightBestTopFood> getPopularAllRestaurants() {
    return const [
      SpotlightBestTopFood(
        image: 'images/food1.jpg',
        name: 'Veg King',
        desc: 'South Indian',
        coupon: '20 \$ off | Use SWIGGYIT',
        ratingTimePrice: '4.1 25 mins - Rs 100 for two',
      ),
      SpotlightBestTopFood(
        image: 'images/food1.jpg',
        name: 'Adyar Hotel',
        desc: 'South Indian',
        coupon: '30 \$ off | Use JUMBO',
        ratingTimePrice: '4.3 21 mins - Rs 150 for two',
      ),
      SpotlightBestTopFood(
        image: 'images/food1.jpg',
        name: 'Chennai Mirchi',
        desc: 'South Indian',
        coupon: '20 \$ off | Use JUMBO',
        ratingTimePrice: '4.1 25 mins - Rs 120 for two',
      ),
      SpotlightBestTopFood(
        image: 'images/food1.jpg',
        name: 'BBQ Nation',
        desc: 'South Indian',
        coupon: '30 \$ off | Use JUMBO',
        ratingTimePrice: '4.3 45 mins - Rs 350 for two',
      ),
      SpotlightBestTopFood(
        image: 'images/food1.jpg',
        name: 'A2B Chennai',
        desc: 'South Indian',
        coupon: '30 \$ off | Use A2BSUPER',
        ratingTimePrice: '4.2 32 mins - Rs 130 for two',
      ),
      SpotlightBestTopFood(
        image: 'images/food1.jpg',
        name: 'Dinner Expresss',
        desc: 'North Indian',
        coupon: '20 \$ off | Use JUMBO',
        ratingTimePrice: '3.8 25 mins - Rs 200 for two',
      ),
    ];
  }

  static List<SpotlightBestTopFood> getTopGroceryRestaurants() {
    return const [
      SpotlightBestTopFood(
        image: 'images/food1.jpg',
        name: 'A2B Chennai',
        desc: 'South Indian',
        coupon: '30 \$ off | Use A2BSUPER',
        ratingTimePrice: '4.2 32 mins - Rs 130 for two',
      ),
      SpotlightBestTopFood(
        image: 'images/food1.jpg',
        name: 'Biryani Expresss',
        desc: 'North Indian',
        coupon: '20 \$ off | Use JUMBO',
        ratingTimePrice: '3.8 15 mins - Rs 200 for two',
      ),
      SpotlightBestTopFood(
        image: 'images/food1.jpg',
        name: 'Chai Truck',
        desc: 'Continental North Indian, South Indian',
        coupon: '20 \$ off | Use JUMBO',
        ratingTimePrice: '4.1 25 mins - Rs 200 for two',
      ),
      SpotlightBestTopFood(
        image: 'images/food1.jpg',
        name: 'Shiva Bhavan',
        desc: 'South Indian',
        coupon: '20 \$ off | Use SWIGGYIT',
        ratingTimePrice: '4.1 35 mins - Rs 150 for two',
      ),
      SpotlightBestTopFood(
        image: 'images/food1.jpg',
        name: 'BBQ King',
        desc: 'South Indian',
        coupon: '20 \$ off | Use JUMBO',
        ratingTimePrice: '4.1 25 mins - Rs 120 for two',
      ),
      SpotlightBestTopFood(
        image: 'images/food1.jpg',
        name: 'Pizza Corner',
        desc: 'South Indian',
        coupon: '30 \$ off | Use JUMBO',
        ratingTimePrice: '4.3 47 mins - Rs 350 for two',
      ),
      SpotlightBestTopFood(
        image: 'images/food1.jpg',
        name: 'Veg King',
        desc: 'South Indian',
        coupon: '20 \$ off | Use SWIGGYIT',
        ratingTimePrice: '4.1 25 mins - Rs 100 for two',
      ),
      SpotlightBestTopFood(
        image: 'images/food1.jpg',
        name: 'Adyar Hotel',
        desc: 'South Indian',
        coupon: '30 \$ off | Use JUMBO',
        ratingTimePrice: '4.3 21 mins - Rs 150 for two',
      ),
    ];
  }
}

class SearchFoodListItemView extends StatelessWidget {
  const SearchFoodListItemView({
    Key key,
    this.food,
  }) : super(key: key);

  final SpotlightBestTopFood food;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(10.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10.0),
              color: Colors.white,
              boxShadow: const <BoxShadow>[
                BoxShadow(
                  color: Colors.grey,
                  blurRadius: 2.0,
                )
              ],
            ),
            child: Image.asset(
              food.image,
              height: 80.0,
              width: 80.0,
              fit: BoxFit.fill,
            ),
          ),
          UIHelper.horizontalSpaceSmall(),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  food.name,
                  style: Theme.of(context)
                      .textTheme
                      .titleSmall
                      .copyWith(fontSize: 15.0),
                ),
                Text(food.desc,
                    style: Theme.of(context)
                        .textTheme
                        .bodyLarge
                        .copyWith(color: Colors.grey[600], fontSize: 13.5)),
                UIHelper.verticalSpaceSmall(),
                Row(
                  children: <Widget>[
                    Icon(
                      Icons.star,
                      size: 14.0,
                      color: Colors.grey[600],
                    ),
                    Text(food.ratingTimePrice)
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
