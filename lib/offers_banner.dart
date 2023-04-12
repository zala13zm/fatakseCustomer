import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';

class OfferBannerView extends StatelessWidget {
  final List<String> images = [
    'images/banners/banner1.jpg',
    'images/banners/banner2.jpg',
    'images/banners/banner3.jpg',
    'images/banners/banner4.jpg',
  ];

  OfferBannerView({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final isTabletDesktop = Responsive.isTabletDesktop(context);

    return InkWell(
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 15.0),
        height: isTabletDesktop ? 260.0 : 180.0,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(isTabletDesktop ? 13.0 : 10.0),
        ),
        child: Swiper(
          itemHeight: 100,
          duration: 500,
          itemWidth: double.infinity,
          pagination: const SwiperPagination(),
          itemCount: images.length,
          itemBuilder: (BuildContext context, int index) => Image.asset(
            images[index],
            fit: BoxFit.cover,
          ),
          autoplay: true,
          viewportFraction: 1.0,
          scale: 0.9,
        ),
      ),
      onTap: () {},
    );
  }
}

class Responsive extends StatelessWidget {
  const Responsive({
    Key key,
    this.mobile,
    this.tablet,
    this.desktop,
  }) : super(key: key);

  final Widget mobile;
  final Widget tablet;
  final Widget desktop;

  static bool isMobile(BuildContext context) {
    return MediaQuery.of(context).size.width < 650;
  }

  static bool isTablet(BuildContext context) {
    return MediaQuery.of(context).size.width >= 650 &&
        MediaQuery.of(context).size.width < 1100;
  }

  static bool isDesktop(BuildContext context) {
    return MediaQuery.of(context).size.width >= 1100;
  }

  static bool isTabletDesktop(BuildContext context) {
    return MediaQuery.of(context).size.width >= 650;
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        if (constraints.maxWidth >= 1100) {
          return desktop;
        } else if (constraints.maxWidth >= 650) {
          return tablet;
        } else {
          return mobile;
        }
      },
    );
  }
}
