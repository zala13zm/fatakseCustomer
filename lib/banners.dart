import 'dart:convert';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

main() {
  runApp(
    MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('banner'),
        ),
        body: BannerCarousel(),
      ),
    ),
  );
}

class BannerCarousel extends StatefulWidget {
  @override
  _BannerCarouselState createState() => _BannerCarouselState();
}

class _BannerCarouselState extends State<BannerCarousel> {
  List<String> bannerImages = [];

  @override
  void initState() {
    super.initState();
    fetchBanners();
  }

  Future<void> fetchBanners() async {
    final response =
        await http.get(Uri.parse('https://admin.fataakse.co.in/api/banners'));
    final decodedResponse = json.decode(response.body);
    final banners = decodedResponse['data'];
    for (var banner in banners) {
      bannerImages.add(banner['photo']);
    }
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return bannerImages.isEmpty
        ? SizedBox()
        : CarouselSlider(
            options: CarouselOptions(
              autoPlay: true,
              aspectRatio: 13 / 10,
              viewportFraction: 1.0,
            ),
            items: bannerImages
                .map((item) => Container(
                      child: Image.network(item, fit: BoxFit.cover),
                    ))
                .toList(),
          );
  }
}
