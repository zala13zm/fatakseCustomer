import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';

class ColorConstants {
  static const primaryColor = Color(0xffF79352);
  static const kPrimaryColor = Color(0xFF26b78b);
  static const kCategoryBackColor = Color(0xFFECFCF6);
  static const kCategorypinkColor = Color(0xFFFF9494);
  static const kBackGroundColor = Color(0xFFF5FAF8);

//Frequently Used Colors

  static const kWhiteColor = Colors.white;
  static const kBlackColor = Colors.black;
  static const kRedColor = Colors.red;
  static const kGreyColor = Colors.grey;
  static const kGreenColor = Colors.green;
}

main() {
  runApp(
    MaterialApp(
      home: HomePageScreen(),
    ),
  );
}

/*
Title: HomePageScreen,
Purpose:HomePageScreen,
Required Widget:CategoryWidget,IngredientsWidget,AddToCartWidget
Created Date:20 Feb July 2020,
Created By:Kalpesh Khandla
*/

class HomePageScreen extends StatefulWidget {
  @override
  _HomePageScreenState createState() => _HomePageScreenState();
}

class _HomePageScreenState extends State<HomePageScreen> {
  final itemArray = [
    "images/beer.png",
    "images/beer.png",
    "images/beer.png",
    "images/beer.png",
    "images/beer.png",
    "images/beer.png",
    "images/beer.png",
  ];
  final recommendedImgArray = [
    "images/beer.png",
    "images/beer.png",
    "images/beer.png",
  ];
  final recommendedNameArray = [
    "Watermelon Mojitto",
    "Pink Negroni",
    "Sex on the Beach",
  ];
  final recommendedAmountArray = [
    "8,55",
    "10,95",
    "10,75",
  ];
  final recommendedDescriptionArray = [
    "White rum,sparkling water...",
    "Very Delicious",
    "Very Yummy",
  ];
  var selectCategory = 1;
  @override
  Widget build(BuildContext context) {
    double width, height;
    width = MediaQuery.of(context).size.width;
    height = MediaQuery.of(context).size.height;
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: ColorConstants.kBackGroundColor,
    ));

    return Scaffold(
      backgroundColor: ColorConstants.kBackGroundColor,
      body: SafeArea(
        child: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              stops: [
                .1,
                1,
              ],
              colors: [
                ColorConstants.kBackGroundColor,
                ColorConstants.kBackGroundColor,
              ],
            ),
          ),
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.only(
                left: 15,
                right: 15,
                top: 15,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  RichText(
                    text: TextSpan(
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 22,
                      ),
                      children: <TextSpan>[
                        TextSpan(
                          text: "What would you\n",
                          style: GoogleFonts.faustina(
                            color: ColorConstants.kBlackColor,
                            fontSize: 26,
                          ),
                        ),
                        TextSpan(
                          text: "like ",
                          style: GoogleFonts.faustina(
                            color: ColorConstants.kBlackColor,
                            fontSize: 26,
                          ),
                        ),
                        TextSpan(
                          text: 'to order?',
                          style: GoogleFonts.faustina(
                            color: ColorConstants.kBlackColor,
                            fontSize: 26,
                            fontWeight: FontWeight.bold,
                          ),
                        )
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Container(
                    height: 60,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      shrinkWrap: false,
                      itemCount: itemArray.length,
                      itemBuilder: (BuildContext context, int index) {
                        return Padding(
                          padding: const EdgeInsets.only(
                            left: 5,
                          ),
                          child: GestureDetector(
                            onTap: () {
                              setState(() {
                                selectCategory = index;
                              });
                            },
                            child: CategoryWidget(
                              catImg: itemArray[index],
                              backColor: selectCategory == index
                                  ? ColorConstants.kCategorypinkColor
                                  : ColorConstants.kCategoryBackColor,
                              imgColor: selectCategory == index
                                  ? ColorConstants.kWhiteColor
                                  : ColorConstants.kBlackColor,
                              height: 50,
                              width: 50,
                              iconHeight: 20,
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          GestureDetector(
                            onTap: () {},
                            child: RotatedBox(
                              quarterTurns: 3,
                              child: Text(
                                "Sour",
                                style: GoogleFonts.faustina(
                                  fontSize: 14,
                                  color: Colors.grey,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          Row(
                            mainAxisSize: MainAxisSize.min,
                            children: <Widget>[
                              GestureDetector(
                                onTap: () {},
                                child: RotatedBox(
                                  quarterTurns: 3,
                                  child: Text(
                                    "Fresh",
                                    style: GoogleFonts.faustina(
                                      fontSize: 15,
                                      color: ColorConstants.kBlackColor,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(
                                width: 2,
                              ),
                              Container(
                                height: 5,
                                width: 5,
                                decoration: BoxDecoration(
                                  color: Colors.green,
                                  borderRadius: BorderRadius.circular(5 / 2),
                                ),
                              )
                            ],
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          GestureDetector(
                            onTap: () {},
                            child: RotatedBox(
                              quarterTurns: 3,
                              child: Text(
                                "Sweet",
                                style: GoogleFonts.faustina(
                                  fontSize: 14,
                                  color: Colors.grey,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        width: 15,
                      ),
                      Expanded(
                        child: GestureDetector(
                          onTap: () {
                            // Navigator.of(context).push(
                            //   MaterialPageRoute(
                            //     builder: (context) => ItemDetailScreen(),
                            //   ),
                            // );
                          },
                          child: Container(
                            height: height * 0.5,
                            child: ListView.builder(
                              addRepaintBoundaries: false,
                              padding: const EdgeInsets.only(top: 50),
                              scrollDirection: Axis.horizontal,
                              shrinkWrap: true,
                              itemCount: recommendedImgArray.length,
                              itemBuilder: (context, index) {
                                return Padding(
                                  padding: const EdgeInsets.only(left: 10),
                                  child: ItemWidget(
                                    itemImg: recommendedImgArray[index],
                                    itemName: recommendedNameArray[index],
                                    itemDescription:
                                        recommendedDescriptionArray[index],
                                    itemAmount: recommendedAmountArray[index],
                                  ),
                                );
                              },
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Text(
                    "Recommended",
                    style: GoogleFonts.faustina(
                      color: ColorConstants.kBlackColor,
                      fontSize: 22,
                    ),
                  ),
                  Container(
                    height: height * 0.15,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      shrinkWrap: false,
                      itemCount: recommendedNameArray.length,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.only(
                            left: 10,
                          ),
                          child: Container(
                            width: width * 0.7,
                            height: height * 0.7,
                            child: RecommandedItemWidget(
                              itemName: recommendedNameArray[index],
                              itemImg: recommendedImgArray[index],
                              itemAmount: recommendedAmountArray[index],
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class CategoryWidget extends StatelessWidget {
  final String catImg;
  final Color backColor;
  final Color imgColor;
  final double height;
  final double width;
  final double iconHeight;

  CategoryWidget({
    Key key,
    @required this.catImg,
    @required this.backColor,
    this.imgColor,
    this.height,
    this.width,
    this.iconHeight,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8.0),
      ),
      color: backColor,
      child: Container(
        height: height,
        width: width,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8.0),
        ),
        child: Center(
          child: Image.asset(
            catImg,
            height: iconHeight,
            color: imgColor,
          ),
        ),
      ),
    );
  }
}

class ItemWidget extends StatelessWidget {
  final String itemImg;
  final String itemName;
  final String itemDescription;
  final String itemAmount;

  ItemWidget({
    Key key,
    @required this.itemImg,
    @required this.itemName,
    @required this.itemDescription,
    @required this.itemAmount,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double height, width;
    width = MediaQuery.of(context).size.width;
    height = MediaQuery.of(context).size.height;

    return Stack(
      children: <Widget>[
        Card(
          elevation: 5,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16.0),
          ),
          child: Container(
            height: height * .5,
            width: width * .7,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16.0),
            ),
          ),
        ),
        Positioned(
          bottom: 10,
          child: Padding(
            padding: const EdgeInsets.only(
              left: 25,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  itemName,
                  style: GoogleFonts.roboto(
                    fontSize: 14,
                    color: ColorConstants.kBlackColor,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                SizedBox(
                  height: 5,
                ),
                Text(
                  itemDescription,
                  style: GoogleFonts.roboto(
                    fontSize: 12,
                    color: Colors.grey,
                  ),
                ),
                SizedBox(
                  height: 5,
                ),
                Row(
                  children: <Widget>[
                    Text(
                      "\$",
                      style: GoogleFonts.faustina(
                        fontSize: 10,
                        fontWeight: FontWeight.w600,
                        color: Colors.black,
                      ),
                    ),
                    Text(
                      itemAmount,
                      style: GoogleFonts.faustina(
                        fontSize: 16,
                        color: Colors.black,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
        Positioned(
          top: -50,
          child: Padding(
            padding: const EdgeInsets.only(left: 27),
            child: Container(
              height: height * .38,
              width: width * .65,
              decoration: BoxDecoration(
                image: DecorationImage(
                  fit: BoxFit.fill,
                  image: AssetImage(itemImg),
                ),
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(15.0),
                  topLeft: Radius.circular(15.0),
                  topRight: Radius.circular(15.0),
                ),
              ),
            ),
          ),
        ),
        Positioned(
          bottom: 4,
          right: 4,
          child: AddButtonWidget(),
        )
      ],
    );
  }
}

/*
Title: RecommandedItemWidget,
Purpose:RecommandedItemWidget,
Required Widget:CategoryWidget,IngredientsWidget,AddToCartWidget
Created Date:20 Feb 2021
Created By:Kalpesh Khandla
*/

class RecommandedItemWidget extends StatelessWidget {
  final String itemName;
  final String itemAmount;
  final String itemImg;

  RecommandedItemWidget({
    Key key,
    this.itemName,
    this.itemAmount,
    this.itemImg,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double height, width;

    width = MediaQuery.of(context).size.width;
    height = MediaQuery.of(context).size.height;

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        Card(
          elevation: 5,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15.0),
          ),
          child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(15.0),
              ),
              child: Stack(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            Row(
                              children: <Widget>[
                                Container(
                                    height: 50,
                                    width: 50,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(8.0),
                                      image: DecorationImage(
                                        fit: BoxFit.fill,
                                        image: AssetImage(
                                          itemImg,
                                        ),
                                      ),
                                    )),
                                SizedBox(
                                  width: 15,
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    Text(
                                      itemName,
                                      style: GoogleFonts.roboto(
                                        fontSize: 12,
                                        color: Colors.black,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                    Row(
                                      children: <Widget>[
                                        Text(
                                          "\$",
                                          style: GoogleFonts.faustina(
                                            fontSize: 10,
                                            color: Colors.black,
                                            fontWeight: FontWeight.w600,
                                          ),
                                        ),
                                        Text(
                                          itemAmount,
                                          style: GoogleFonts.faustina(
                                            fontSize: 20,
                                            color: Colors.black,
                                            fontWeight: FontWeight.w600,
                                          ),
                                        ),
                                      ],
                                    )
                                  ],
                                ),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  Positioned(
                    bottom: 0,
                    right: 0,
                    child: AddButtonWidget(),
                  )
                ],
              )),
        ),
      ],
    );
  }
}

class AddButtonWidget extends StatelessWidget {
  AddButtonWidget({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      width: 50,
      decoration: BoxDecoration(
        color: Color(0xFF76D1B2),
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(15.0),
          bottomRight: Radius.circular(15.0),
        ),
      ),
      child: Icon(
        Icons.add,
        color: ColorConstants.kWhiteColor,
        size: 20,
      ),
    );
  }
}
