import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart ' as http;

import 'restaurant_list_api.dart';

class Product {
  String name;
  String description;
  double price; // Change int to double
  String imageUrl;

  Product({this.name, this.description, this.price, this.imageUrl});
}

class MenuPage extends StatefulWidget {
  const MenuPage({Key key, this.proData}) : super(key: key);
  final RestData proData;

  @override
  _MenuPageState createState() => _MenuPageState();
}

class _MenuPageState extends State<MenuPage> {
  List<Product> menuItems = [];
  @override
  void initState() {
    super.initState();
    getRestData();
  }

  Future<void> getRestData() async {
    int page = 1;
    bool hasNextPage = true;
    while (hasNextPage) {
      final response = await http.get(
          Uri.parse('https://admin.fataakse.co.in/api/products?page=$page'));
      var data = jsonDecode(response.body.toString());
      for (var product in data['data']) {
        int vendorproid = product['vendor_id'];
        if (vendorproid == widget.proData.id) {
          int productId = product['id'];
          var productName = product['name'];
          num productPrice = product[
              'price']; // Use num data type to handle both int and double values
          print(productId);
          print(productName);
          print(productPrice);
          print(page);
          //TODO: data can print in console but processed stop between and show error, and after running nothing showing on screen
          menuItems.add(Product(
            name: productName,
            price: productPrice.toDouble(), // Convert num to double
            description: product['description'],
            imageUrl: product['imageUrl'],
          ));
        }
      }
      hasNextPage = data['next_page_url'] != null;
      page++;
    }
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: menuItems.isEmpty
          ? Center(child: CircularProgressIndicator())
          : ListView.builder(
              itemCount: menuItems.length,
              itemBuilder: (BuildContext context, int index) {
                final menuItem = menuItems[index];
                return Text(menuItem.name);
              },
            ),
    );
  }
}

class MenuItem {
  String name;
  List<Product> products;

  MenuItem({this.name, this.products});
}

class QuantitySelector extends StatefulWidget {
  @override
  _QuantitySelectorState createState() => _QuantitySelectorState();
}

class _QuantitySelectorState extends State<QuantitySelector>
    with TickerProviderStateMixin {
  AnimationController _controller;
  Animation<double> _animation;
  int _quantity = 0;

  @override
  void initState() {
    super.initState();
    _controller =
        AnimationController(vsync: this, duration: Duration(milliseconds: 300));
    _animation = CurvedAnimation(parent: _controller, curve: Curves.easeInOut);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _incrementQuantity() {
    setState(() {
      _quantity++;
    });
    _controller.forward(from: 0);
  }

  void _decrementQuantity() {
    if (_quantity > 0) {
      setState(() {
        _quantity--;
      });
      _controller.forward(from: 0);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        IconButton(
          onPressed: _decrementQuantity,
          icon: Icon(Icons.remove),
          color: Colors.grey[700],
        ),
        SizedBox(
          width: 30,
          height: 30,
          child: GestureDetector(
            onTap: _incrementQuantity,
            child: DecoratedBox(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(8),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey[300]?.withOpacity(_animation.value),
                    blurRadius: 3,
                    offset: Offset(0, 1),
                  ),
                ],
              ),
              child: Center(
                child: Text(
                  _quantity.toString(),
                  style: TextStyle(fontSize: 16),
                ),
              ),
            ),
          ),
        ),
        IconButton(
          onPressed: _incrementQuantity,
          icon: Icon(Icons.add),
          color: Colors.grey[700],
        ),
      ],
    );
  }
}
