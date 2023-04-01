import 'package:flutter/material.dart';
import 'package:zomatoui/ui/delivery/restaurant/restaurant_list_api.dart';

class RestaurantDetailPage extends StatefulWidget {
  final RestData restData;

  RestaurantDetailPage({Key key, this.restData}) : super(key: key);

  @override
  _RestaurantDetailPageState createState() => _RestaurantDetailPageState();
}

class _RestaurantDetailPageState extends State<RestaurantDetailPage> {
  String _name;
  bool _isNameVisible = false;
  bool _isChatVisible = false;
  bool _isChineseSelected = false;
  bool _isPunjabiSelected = false;
  bool _isSouthIndianSelected = false;

  @override
  void initState() {
    super.initState();
    _name = widget.restData.name;
    Future.delayed(Duration(milliseconds: 500), () {
      setState(() {
        _isNameVisible = true;
      });
    });
    Future.delayed(Duration(milliseconds: 1000), () {
      setState(() {
        _isChatVisible = true;
        Future.delayed(Duration(seconds: 5), () {
          setState(() {
            _isChatVisible = false;
          });
        });
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(children: [
          Column(
            children: [
              Container(
                height: 80,
                decoration: BoxDecoration(
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.2),
                      blurRadius: 10,
                      spreadRadius: 5,
                    ),
                  ],
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      IconButton(
                        icon: Icon(Icons.arrow_back, color: Colors.black),
                        onPressed: () => Navigator.of(context).pop(),
                      ),
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 16),
                          child: Container(
                            height: 40,
                            decoration: BoxDecoration(
                              color: Colors.grey[200],
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: TextField(
                              decoration: InputDecoration(
                                hintText: 'Search',
                                border: InputBorder.none,
                                prefixIcon: Icon(Icons.search),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                alignment: Alignment.center,
                height: 80,
                margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                decoration: BoxDecoration(
                  color: Colors.grey[200],
                  borderRadius: BorderRadius.circular(25),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    AnimatedDefaultTextStyle(
                      duration: Duration(milliseconds: 500),
                      style: TextStyle(
                        fontSize: _isNameVisible ? 20 : 0,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                      child: Text(
                        _name.length <= 20
                            ? _name
                            : '${_name.substring(0, 20)}...',
                        style: TextStyle(
                            fontSize: 27, fontWeight: FontWeight.bold),
                      ),
                    ),
                    SizedBox(height: 5),
                    AnimatedDefaultTextStyle(
                      duration: Duration(milliseconds: 500),
                      style: TextStyle(
                        fontSize: _isNameVisible ? 15 : 0,
                        color: Colors.grey[600],
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 30.0),
                        child: Text(
                          widget.restData.description,
                          style: TextStyle(fontSize: 12),
                          overflow: TextOverflow.ellipsis,
                          maxLines: 1,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              FilterList(),
              Expanded(
                child: Container(
                  margin: EdgeInsets.symmetric(horizontal: 10),
                  child: ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: MenuPage()),
                ),
              )
            ],
          ),
          AnimatedPositioned(
            duration: Duration(milliseconds: 500),
            top: _isChatVisible ? 175 : -80,
            right: 16,
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              decoration: BoxDecoration(
                color: Colors.blue,
                borderRadius: BorderRadius.circular(25),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.2),
                    blurRadius: 10,
                    spreadRadius: 5,
                  ),
                ],
              ),
              child: Text(
                'What You Want To Eat Today?',
                style: TextStyle(fontSize: 16, color: Colors.white),
              ),
            ),
          ),
        ]),
      ),
    );
  }
}

class FilterList extends StatefulWidget {
  @override
  _FilterListState createState() => _FilterListState();
}

class _FilterListState extends State<FilterList> {
  List<String> _filterNames = [
    'Chinese',
    'Punjabi',
    'South Indian',
    'Mexican',
    'Italian',
    'Japanese',
    'Thai',
  ];
  List<bool> _isFilterSelected = List.filled(7, false);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: _filterNames.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: FilterChip(
              label: Text(
                _filterNames[index],
                style: TextStyle(
                  color: _isFilterSelected[index] ? Colors.white : Colors.black,
                  fontWeight: FontWeight.bold,
                ),
              ),
              selected: _isFilterSelected[index],
              onSelected: (isSelected) {
                setState(() {
                  _isFilterSelected[index] = isSelected;
                });
              },
              backgroundColor:
                  _isFilterSelected[index] ? Colors.orange : Colors.grey[300],
              checkmarkColor:
                  _isFilterSelected[index] ? Colors.white : Colors.grey[400],
              selectedColor: Colors.orange,
              padding: _filterNames[index].length > 10
                  ? const EdgeInsets.symmetric(horizontal: 24, vertical: 8)
                  : const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
            ),
          );
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

class Product {
  String name;
  String description;
  double price;
  String imageUrl;

  Product({this.name, this.description, this.price, this.imageUrl});
}

class MenuPage extends StatefulWidget {
  const MenuPage({Key key}) : super(key: key);

  @override
  _MenuPageState createState() => _MenuPageState();
}

class _MenuPageState extends State<MenuPage> {
  List<MenuItem> _menuItems = [
    MenuItem(
      name: 'Burgers',
      products: [
        Product(
          name: 'Classic Burger',
          description: 'Our signature burger with 100% patty',
          price: 8.99,
          imageUrl:
              'https://w7.pngwing.com/pngs/201/77/png-transparent-hamburger-veggie-burger-take-out-fast-food-kebab-delicious-beef-burger-burger-with-lettuce-tomato-and-cheese-food-beef-recipe.png',
        ),
        Product(
          name: 'Veggie Burger',
          description: 'A delicious veggie burger with fresh veggies',
          price: 7.99,
          imageUrl:
              'https://w7.pngwing.com/pngs/201/77/png-transparent-hamburger-veggie-burger-take-out-fast-food-kebab-delicious-beef-burger-burger-with-lettuce-tomato-and-cheese-food-beef-recipe.png',
        ),
      ],
    ),
    MenuItem(
      name: 'Pizzas',
      products: [
        Product(
          name: 'Pepperoni Pizza',
          description: 'Our classic pizza with pepperoni and mozzarella',
          price: 12.99,
          imageUrl:
              'https://w7.pngwing.com/pngs/201/77/png-transparent-hamburger-veggie-burger-take-out-fast-food-kebab-delicious-beef-burger-burger-with-lettuce-tomato-and-cheese-food-beef-recipe.png',
        ),
        Product(
          name: 'Margherita Pizza',
          description: 'A classic pizza with tomato sauce and mozzarella',
          price: 11.99,
          imageUrl:
              'https://w7.pngwing.com/pngs/201/77/png-transparent-hamburger-veggie-burger-take-out-fast-food-kebab-delicious-beef-burger-burger-with-lettuce-tomato-and-cheese-food-beef-recipe.png',
        ),
      ],
    ),
    MenuItem(
      name: 'Drinks',
      products: [
        Product(
          name: 'Coke',
          description: 'A refreshing Coca-Cola drink',
          price: 2.99,
          imageUrl:
              'https://w7.pngwing.com/pngs/201/77/png-transparent-hamburger-veggie-burger-take-out-fast-food-kebab-delicious-beef-burger-burger-with-lettuce-tomato-and-cheese-food-beef-recipe.png',
        ),
        Product(
          name: 'Orange Juice',
          description: 'Freshly squeezed orange juice',
          price: 3.99,
          imageUrl:
              'https://w7.pngwing.com/pngs/201/77/png-transparent-hamburger-veggie-burger-take-out-fast-food-kebab-delicious-beef-burger-burger-with-lettuce-tomato-and-cheese-food-beef-recipe.png',
        ),
      ],
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        itemCount: _menuItems.length,
        itemBuilder: (BuildContext context, int index) {
          final menuItem = _menuItems[index];
          return ClipRRect(
            borderRadius: BorderRadius.circular(50),
            child: Card(
              child: ExpansionTile(
                initiallyExpanded: true,
                title: Center(
                  child: Text(
                    menuItem.name,
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
                children: menuItem.products
                    .map(
                      (product) => Column(
                        children: [
                          ListTile(
                            leading: Image.network(
                              product.imageUrl,
                              width: 50,
                              height: 50,
                              fit: BoxFit.cover,
                            ),
                            title: Text(product.name),
                            subtitle: Text(product.description),
                            trailing: QuantitySelector(),
                          ),
                          Divider(height: 1),
                        ],
                      ),
                    )
                    .toList(),
              ),
            ),
          );
        },
      ),
    );
  }
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
