import 'package:flutter/material.dart';

class Product {
  String name;
  String description;
  double price;
  String imageUrl;
  List<Product> products;

  Product(
      {this.name, this.description, this.price, this.imageUrl, this.products});
}

class MenuPage extends StatefulWidget {
  @override
  _MenuPageState createState() => _MenuPageState();
}

class _MenuPageState extends State<MenuPage> {
  final menuItems = [
    MenuItem(
      name: 'Burgers',
      products: [
        Product(
          name: 'Cheeseburger',
          description: 'Chicken patty with cheese',
          imageUrl: 'https://via.placeholder.com/150',
        ),
        Product(
          name: 'Veggie burger',
          description: 'Vegetarian burger with lettuce and tomato',
          imageUrl: 'https://via.placeholder.com/150',
        ),
        Product(
          name: 'Orange juice',
          description: 'Fresh squeezed orange juice',
          imageUrl: 'https://via.placeholder.com/150',
        ),
        Product(
          name: 'Orange juice',
          description: 'Fresh squeezed orange juice',
          imageUrl: 'https://via.placeholder.com/150',
        ),
        Product(
          name: 'Orange juice',
          description: 'Fresh squeezed orange juice',
          imageUrl: 'https://via.placeholder.com/150',
        ),
        Product(
          name: 'Orange juice',
          description: 'Fresh squeezed orange juice',
          imageUrl: 'https://via.placeholder.com/150',
        ),
        Product(
          name: 'Orange juice',
          description: 'Fresh squeezed orange juice',
          imageUrl: 'https://via.placeholder.com/150',
        ),
        Product(
          name: 'Orange juice',
          description: 'Fresh squeezed orange juice',
          imageUrl: 'https://via.placeholder.com/150',
        ),
        Product(
          name: 'Orange juice',
          description: 'Fresh squeezed orange juice',
          imageUrl: 'https://via.placeholder.com/150',
        ),
        Product(
          name: 'Orange juice',
          description: 'Fresh squeezed orange juice',
          imageUrl: 'https://via.placeholder.com/150',
        ),
        Product(
          name: 'Orange juice',
          description: 'Fresh squeezed orange juice',
          imageUrl: 'https://via.placeholder.com/150',
        ),
        Product(
          name: 'Orange juice',
          description: 'Fresh squeezed orange juice',
          imageUrl: 'https://via.placeholder.com/150',
        ),
        Product(
          name: 'Orange juice',
          description: 'Fresh squeezed orange juice',
          imageUrl: 'https://via.placeholder.com/150',
        ),
      ],
    ),
    MenuItem(
      name: 'Drinks',
      products: [
        Product(
          name: 'Cola',
          description: 'Classic Coca Cola',
          imageUrl: 'https://via.placeholder.com/150',
        ),
        Product(
          name: 'Orange juice',
          description: 'Fresh squeezed orange juice',
          imageUrl: 'https://via.placeholder.com/150',
        ),
      ],
    ),
    MenuItem(
      name: 'Drinks',
      products: [
        Product(
          name: 'Cola',
          description: 'Classic Coca Cola',
          imageUrl: 'https://via.placeholder.com/150',
        ),
        Product(
          name: 'Orange juice',
          description: 'Fresh squeezed orange juice',
          imageUrl: 'https://via.placeholder.com/150',
        ),
      ],
    ),
    MenuItem(
      name: 'Drinks',
      products: [
        Product(
          name: 'Cola',
          description: 'Classic Coca Cola',
          imageUrl: 'https://via.placeholder.com/150',
        ),
        Product(
          name: 'Orange juice',
          description: 'Fresh squeezed orange juice',
          imageUrl: 'https://via.placeholder.com/150',
        ),
      ],
    ),
    MenuItem(
      name: 'Drinks',
      products: [
        Product(
          name: 'Cola',
          description: 'Classic Coca Cola',
          imageUrl: 'https://via.placeholder.com/150',
        ),
        Product(
          name: 'Orange juice',
          description: 'Fresh squeezed orange juice',
          imageUrl: 'https://via.placeholder.com/150',
        ),
      ],
    ),
    MenuItem(
      name: 'Drinks',
      products: [
        Product(
          name: 'Cola',
          description: 'Classic Coca Cola',
          imageUrl: 'https://via.placeholder.com/150',
        ),
        Product(
          name: 'Orange juice',
          description: 'Fresh squeezed orange juice',
          imageUrl: 'https://via.placeholder.com/150',
        ),
      ],
    ),
    MenuItem(
      name: 'Drinks',
      products: [
        Product(
          name: 'Cola',
          description: 'Classic Coca Cola',
          imageUrl: 'https://via.placeholder.com/150',
        ),
        Product(
          name: 'Orange juice',
          description: 'Fresh squeezed orange juice',
          imageUrl: 'https://via.placeholder.com/150',
        ),
      ],
    ),
    MenuItem(
      name: 'Drinks',
      products: [
        Product(
          name: 'Cola',
          description: 'Classic Coca Cola',
          imageUrl: 'https://via.placeholder.com/150',
        ),
        Product(
          name: 'Orange juice',
          description: 'Fresh squeezed orange juice',
          imageUrl: 'https://via.placeholder.com/150',
        ),
      ],
    ),
    MenuItem(
      name: 'Drinks',
      products: [
        Product(
          name: 'Cola',
          description: 'Classic Coca Cola',
          imageUrl: 'https://via.placeholder.com/150',
        ),
        Product(
          name: 'Orange juice',
          description: 'Fresh squeezed orange juice',
          imageUrl: 'https://via.placeholder.com/150',
        ),
      ],
    ),
  ];

  ScrollController _scrollController = ScrollController();

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Scrollbar(
        controller: _scrollController,
        thumbVisibility: true,
        radius: Radius.circular(30),
        thickness: 10,
        child: ListView.builder(
          controller: _scrollController,
          itemCount: menuItems.length,
          itemBuilder: (BuildContext context, int index) {
            final menuItem = menuItems[index];
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
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(vertical: 13.0),
                              child: ListTile(
                                leading: Image.network(
                                  product.imageUrl,
                                  width: 50,
                                  height: 50,
                                  fit: BoxFit.cover,
                                ),
                                title: Text(product.name),
                                subtitle: Text(product.description),
                                trailing: Column(
                                  children: [
                                    Text(
                                      "₹250",
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold),
                                    ),
                                    SizedBox(height: 5),
                                    QuantitySelector(),
                                  ],
                                ),
                              ),
                            ),
                            Divider(height: 5),
                          ],
                        ),
                      )
                      .toList(),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}

Widget _buildQuantitySelector() {
  return Row(
    mainAxisSize: MainAxisSize.min,
    children: [
      IconButton(
        onPressed: () {},
        icon: Icon(Icons.remove),
      ),
      Text('0'),
      IconButton(
        onPressed: () {},
        icon: Icon(Icons.add),
      ),
    ],
  );
}

class QuantitySelector extends StatefulWidget {
  @override
  _QuantitySelectorState createState() => _QuantitySelectorState();
}

bool itemAddedToCart;

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
      showModalBottomSheet(
          context: context,
          builder: (BuildContext context) {
            return MyBottomSheet(addQuantity: _quantity++);
          });
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
    return AnimatedSize(
      duration: Duration(milliseconds: 300),
      child: SizedBox(
        width: _quantity == 0 ? 70 : 120,
        height: 30,
        child: _quantity == 0
            ? GestureDetector(
                onTap: _incrementQuantity,
                child: DecoratedBox(
                  decoration: BoxDecoration(
                    color: Colors.orange,
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(color: Colors.grey[700]),
                  ),
                  child: Center(
                    child: Text(
                      "ADD",
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 16),
                    ),
                  ),
                ),
              )
            : Row(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  IconButton(
                    onPressed: _decrementQuantity,
                    icon: Icon(Icons.remove),
                    color: Colors.grey[700],
                  ),
                  SizedBox(
                    width: 20,
                    height: 20,
                    child: DecoratedBox(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(8),
                        boxShadow: [
                          BoxShadow(
                            color:
                                Colors.grey[300]?.withOpacity(_animation.value),
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
                  IconButton(
                    onPressed: _incrementQuantity,
                    icon: Icon(Icons.add),
                    color: Colors.grey[700],
                  ),
                ],
              ),
      ),
    );
  }
}

class MenuItem {
  final String name;
  final List<Product> products;

  MenuItem({this.name, this.products});
}

List<Map<String, dynamic>> _options = [
  {
    'name': 'Jain',
    'price': 10.0,
  },
  {
    'name': 'Regular',
    'price': 20.0,
  },
  {
    'name': 'Maja Aawe E',
    'price': 30.0,
  },
];
List<bool> _selected = [false, false, false];
bool _multiple = false;
double _calculateTotal() {
  double total = 0.0;
  for (int i = 0; i < _selected.length; i++) {
    if (_selected[i]) {
      total += _options[i]['price'];
    }
  }
  return total;
}

class MyBottomSheet extends StatefulWidget {
  MyBottomSheet({Key key, this.addQuantity}) : super(key: key);
  var addQuantity;
  @override
  _MyBottomSheetState createState() => _MyBottomSheetState();
}

class _MyBottomSheetState extends State<MyBottomSheet> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 1,
      child: Column(
        children: [
          Container(
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: Text(
              'Select options',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 18,
              ),
            ),
          ),
          Divider(),
          Expanded(
            child: ListView.builder(
              itemCount: _options.length,
              itemBuilder: (BuildContext context, int index) {
                return ListTile(
                  leading: Checkbox(
                    value: _selected[index],
                    onChanged: (value) {
                      setState(() {
                        if (_multiple) {
                          _selected[index] = value;
                        } else {
                          for (int i = 0; i < _selected.length; i++) {
                            if (i == index) {
                              _selected[i] = value;
                            } else {
                              _selected[i] = false;
                            }
                          }
                        }
                      });
                    },
                  ),
                  title: Text(
                    _options[index]['name'],
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                  subtitle: Text(
                    '\₹${_options[index]['price'].toString()}',
                    style: TextStyle(
                      fontSize: 14,
                    ),
                  ),
                );
              },
            ),
          ),
          Divider(),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Total:',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                  ),
                ),
                Text(
                  '\₹${_calculateTotal().toString()}',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                  ),
                ),
              ],
            ),
          ),
          ElevatedButton(
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.resolveWith<Color>(
                (Set<MaterialState> states) {
                  if (states.contains(MaterialState.pressed)) {
                    return Colors.orange;
                  }
                  return Colors.orange;
                },
              ),
            ),
            onPressed: () {
              itemAddedToCart = true;
              Navigator.of(context).pop(widget.addQuantity);
            },
            child: Text(
              'Select',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
        ],
      ),
    );
  }
}
