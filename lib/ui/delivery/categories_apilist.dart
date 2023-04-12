import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

void main() {
  runApp(MaterialApp(
    home: CategoryList(),
  ));
}

class Category {
  var color;
  var name;
  var photo;

  Category({this.color, this.name, this.photo});

  factory Category.fromJson(Map<String, dynamic> json) {
    return Category(
      color: json['color'],
      name: json['name'],
      photo: json['photo'],
    );
  }
}

class CategoryList extends StatefulWidget {
  @override
  _CategoryListState createState() => _CategoryListState();
}

class _CategoryListState extends State<CategoryList> {
  List<Category> _categories;
  List<Category> _visibleCategories;
  bool _showAllCategories = false;
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    fetchData();
  }

  Future<void> fetchData() async {
    try {
      final response = await http.get(
        Uri.parse(
          'https://admin.fataakse.co.in/api/categories',
        ),
      );
      final data = json.decode(response.body);
      if (response.statusCode == 200) {
        _categories = List<Category>.from(
          data['data'].map(
            (category) => Category.fromJson(category),
          ),
        );
        _visibleCategories = _categories.take(16).toList();
      }
    } catch (error) {
      print('Error: $error');
    } finally {
      setState(() {
        _isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return _isLoading
        ? Center(
            child: CircularProgressIndicator(),
          )
        : Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              GridView.count(
                physics: NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                crossAxisCount: 4, // set the number of columns to 3
                children: _visibleCategories.map((category) {
                  return Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        width: 50,
                        height: 50,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                        ),
                        child: CircleAvatar(
                          backgroundColor: Colors.white,
                          backgroundImage: NetworkImage(category.photo),
                          radius: 30,
                        ),
                      ),
                      SizedBox(height: 4),
                      Text(
                        category.name,
                        textAlign: TextAlign.center,
                        style: TextStyle(fontSize: 12),
                      ),
                    ],
                  );
                }).toList(),
              ),
              if (_showAllCategories)
                Center(
                  child: ElevatedButton(
                    onPressed: () {
                      setState(() {
                        _visibleCategories = _categories
                            .take(16)
                            .toList(); // show the first 6 categories
                        _showAllCategories = false;
                      });
                    },
                    child: Text('Close'),
                    style: ElevatedButton.styleFrom(
                      shape: StadiumBorder(),
                      backgroundColor: Colors.orange,
                    ),
                  ),
                ),
              if (!_showAllCategories)
                Center(
                  child: ElevatedButton(
                    onPressed: () {
                      setState(() {
                        _visibleCategories = _categories; // show all categories
                        _showAllCategories = true;
                      });
                    },
                    child: Text('More'),
                    style: ElevatedButton.styleFrom(
                      shape: StadiumBorder(),
                      backgroundColor: Colors.orange,
                    ),
                  ),
                ),
            ],
          );
  }
}
