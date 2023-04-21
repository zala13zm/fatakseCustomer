import 'package:flutter/material.dart';

main() {
  runApp(
    MaterialApp(
      home: CheckOut(),
    ),
  );
}

class CheckOut extends StatefulWidget {
  const CheckOut({Key key}) : super(key: key);

  @override
  State<CheckOut> createState() => _CheckOutState();
}
class _CheckOutState extends State<CheckOut> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
        child: ListView(
         shrinkWrap: true,
        children: <Widget>[
          Row(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Padding(
                  padding:
                      const EdgeInsets.only(left: 10.0, right: 10, top: 60.0),
                  child: InkWell(
                    child: Icon(
                      Icons.arrow_back,
                      color: Colors.black54,
                      size: 32,
                    ),
                    onTap: () {
                      Navigator.of(context).pop();
                    },
                  )),
              Expanded(
                child: new Padding(
                  padding: const EdgeInsets.only(left: 3.0, top: 60.0),
                  child: Text(
                    'Title',
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 20,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.only(left: 10.0, right: 10, top: 60.0),
                child: InkWell(
                  child: Icon(
                    Icons.local_offer,
                    color: Colors.orange,
                    size: 24,
                  ),
                  // onTap: () => Navigator.push(
                  //   context,
                  //   MaterialPageRoute(
                  //     builder: (_) => Offers(),
                  //   ),
                  // ),
                ),
              ),
            ],
          ),
          Padding(
            padding: EdgeInsets.only(top: 10, bottom: 10),
            child: Divider(
              height: 1,
              indent: 6,
              endIndent: 6,
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: EdgeInsets.only(bottom: 5, left: 16, right: 2, top: 2),
                child: InkWell(
                  child: Icon(
                    Icons.location_on_rounded,
                    color: Colors.red,
                  ),
                  onTap: () {},
                ),
              ),
              Padding(
                padding: EdgeInsets.only(bottom: 5, left: 6, right: 2, top: 2),
                child: Text(
                  'Delivery at ',
                  textAlign: TextAlign.start,
                  style: TextStyle(
                    fontSize: 14.0,
                    color: Colors.black54,
                    fontWeight: FontWeight.normal,
                  ),
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              Flexible(
                  child: Padding(
                padding:
                    EdgeInsets.only(bottom: 5, left: 14, right: 10, top: 2),
                child: Text(
                  'Jamnagar',
                  textAlign: TextAlign.start,
                  style: TextStyle(
                    fontSize: 14.0,
                    color: Colors.black,
                    fontWeight: FontWeight.normal,
                  ),
                  overflow: TextOverflow.ellipsis,
                  maxLines: 3,
                ),
              )),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: EdgeInsets.only(bottom: 5, left: 16, right: 2, top: 2),
                child: InkWell(
                  child: Icon(
                    Icons.timer,
                    color: Colors.green,
                  ),
                  onTap: () {},
                ),
              ),
              Padding(
                padding: EdgeInsets.only(bottom: 5, left: 7, right: 16, top: 2),
                child: Text(
                  'Delivery in ',
                  textAlign: TextAlign.start,
                  style: TextStyle(
                    fontSize: 14.0,
                    color: Colors.black54,
                    fontWeight: FontWeight.normal,
                  ),
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              Text(
                '26 mins',
                textAlign: TextAlign.start,
                style: TextStyle(
                  fontSize: 14.0,
                  color: Colors.black,
                  fontWeight: FontWeight.normal,
                ),
              ),
            ],
          ),
          Divider(
            indent: 10,
            endIndent: 10,
            color: Colors.grey,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding:
                    EdgeInsets.only(bottom: 5, left: 16, right: 2, top: 20),
                child: InkWell(
                  child: Icon(
                    Icons.fastfood,
                    color: Colors.green,
                  ),
                  onTap: () {},
                ),
              ),
              Padding(
                padding:
                    EdgeInsets.only(bottom: 5, left: 7, right: 16, top: 20),
                child: Text(
                  'Your Order',
                  textAlign: TextAlign.start,
                  style: TextStyle(
                    fontSize: 18.0,
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
          Container(
            height: 200,
            child: ListView(
              physics: ScrollPhysics(),
              shrinkWrap: true,
              padding: EdgeInsets.only(top: 6),
              children: [
                Container(
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Container(
                                margin: EdgeInsets.only(top: 12, left: 16),
                                padding: EdgeInsets.all(2),
                                decoration: BoxDecoration(
                                    shape: BoxShape.rectangle,
                                    borderRadius: BorderRadius.circular(3),
                                    border: Border.all(
                                        width: 2, color: Colors.green)),
                                child: Icon(
                                  Icons.circle,
                                  color: Colors.green,
                                  size: 8,
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.only(
                                    bottom: 5, left: 16, right: 16, top: 20),
                                child: Text(
                                  'Paneer Tikka Masala',
                                  textAlign: TextAlign.start,
                                  style: TextStyle(
                                    fontSize: 16.0,
                                    color: Colors.black,
                                    fontWeight: FontWeight.normal,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Padding(
                            padding: EdgeInsets.only(
                                bottom: 5, left: 16, right: 20, top: 20),
                            child: Text(
                              '2',
                              textAlign: TextAlign.start,
                              style: TextStyle(
                                fontSize: 14.0,
                                color: Colors.black,
                                fontWeight: FontWeight.normal,
                              ),
                            ),
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Padding(
                            padding: EdgeInsets.only(
                                bottom: 5, left: 48, right: 16, top: 0),
                            child: Text(
                              '₹100',
                              textAlign: TextAlign.start,
                              style: TextStyle(
                                fontSize: 14.0,
                                color: Colors.black,
                                fontWeight: FontWeight.normal,
                              ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(
                                bottom: 5, left: 16, right: 20, top: 0),
                            child: Text(
                              '₹100',
                              textAlign: TextAlign.start,
                              style: TextStyle(
                                fontSize: 14.0,
                                color: Colors.black87,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                Container(
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Container(
                                margin: EdgeInsets.only(top: 12, left: 16),
                                padding: EdgeInsets.all(2),
                                decoration: BoxDecoration(
                                    shape: BoxShape.rectangle,
                                    borderRadius: BorderRadius.circular(3),
                                    border: Border.all(
                                        width: 2, color: Colors.green)),
                                child: Icon(
                                  Icons.circle,
                                  color: Colors.green,
                                  size: 8,
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.only(
                                    bottom: 5, left: 16, right: 16, top: 20),
                                child: Text(
                                  'Paneer Kadai',
                                  textAlign: TextAlign.start,
                                  style: TextStyle(
                                    fontSize: 16.0,
                                    color: Colors.black,
                                    fontWeight: FontWeight.normal,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Padding(
                            padding: EdgeInsets.only(
                                bottom: 5, left: 16, right: 20, top: 20),
                            child: Text(
                              '3',
                              textAlign: TextAlign.start,
                              style: TextStyle(
                                fontSize: 14.0,
                                color: Colors.black,
                                fontWeight: FontWeight.normal,
                              ),
                            ),
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Padding(
                            padding: EdgeInsets.only(
                                bottom: 5, left: 48, right: 16, top: 0),
                            child: Text(
                              '₹300',
                              textAlign: TextAlign.start,
                              style: TextStyle(
                                fontSize: 14.0,
                                color: Colors.black,
                                fontWeight: FontWeight.normal,
                              ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(
                                bottom: 5, left: 16, right: 20, top: 0),
                            child: Text(
                              '₹100',
                              textAlign: TextAlign.start,
                              style: TextStyle(
                                fontSize: 14.0,
                                color: Colors.black87,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Divider(
            thickness: 1,
            indent: 16,
            endIndent: 16,
          ),
          Container(
            height: 200,
            child: Card(
              margin: EdgeInsets.only(
                bottom: 10,
                top: 0,
                left: 10,
                right: 10,
              ),
              elevation: 2,
              child: InkWell(
                onTap: () => {},
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      mainAxisSize: MainAxisSize.max,
                      children: <Widget>[
                        Expanded(
                          flex: 2,
                          child: Padding(
                            padding: EdgeInsets.only(
                                left: 10, right: 25, top: 20, bottom: 10),
                            child: CircleAvatar(
                              backgroundColor: Colors.blue,
                              child: Text(
                                '50%',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                        ),
                        Expanded(
                            flex: 6,
                            child: Padding(
                              padding: EdgeInsets.only(
                                  left: 0, right: 0, top: 10, bottom: 10),
                              child: SelectableText(
                                'FUCKYOU',
                                textAlign: TextAlign.start,
                                style: TextStyle(
                                  fontSize: 18.0,
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                ),
                                maxLines: 1,
                              ),
                            )),
                        Expanded(
                          flex: 2,
                          child: TextButton(
                            child: const Text(
                              'APPLY',
                              style: TextStyle(
                                fontSize: 15.0,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            style: TextButton.styleFrom(
                                foregroundColor: Colors.redAccent),
                            onPressed: () {
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  backgroundColor: Colors.green,
                                  content: Text(
                                    "Yay! Offer applied",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.normal),
                                  ),
                                ),
                              );
                            },
                          ),
                        ),
                      ],
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                          left: 10, right: 10, top: 5, bottom: 10),
                      child: Text(
                        'Enjoy Last Bit Of Pleasure',
                        textAlign: TextAlign.start,
                        style: TextStyle(
                          fontSize: 16.0,
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                        ),
                        overflow: TextOverflow.ellipsis,
                        maxLines: 2,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                          left: 10, right: 10, top: 0, bottom: 0),
                      child: Text(
                        'Get 50% On This Order',
                        textAlign: TextAlign.start,
                        style: TextStyle(
                          fontSize: 14.0,
                          color: Colors.black,
                          fontWeight: FontWeight.normal,
                        ),
                        overflow: TextOverflow.ellipsis,
                        maxLines: 3,
                      ),
                    ),
                    Padding(
                      padding:
                          EdgeInsets.only(left: 5, right: 0, top: 0, bottom: 5),
                      child: TextButton(
                        child: const Text(
                          'View details',
                          style: TextStyle(
                            fontSize: 14.0,
                            color: Colors.blueGrey,
                            fontWeight: FontWeight.normal,
                          ),
                        ),
                        // onPressed: () => launchURL(context, 'https://www.google.com'),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding:
                    EdgeInsets.only(bottom: 5, left: 48, right: 16, top: 0),
                child: Text(
                  'Delivery Fee',
                  textAlign: TextAlign.start,
                  style: TextStyle(
                    fontSize: 14.0,
                    color: Colors.black,
                    fontWeight: FontWeight.normal,
                  ),
                ),
              ),
              Padding(
                padding:
                    EdgeInsets.only(bottom: 5, left: 16, right: 20, top: 14),
                child: Text(
                  '₹100',
                  textAlign: TextAlign.start,
                  style: TextStyle(
                    fontSize: 14.0,
                    color: Colors.black54,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding:
                    EdgeInsets.only(bottom: 5, left: 48, right: 16, top: 0),
                child: Text(
                  'Taxes & Charges',
                  textAlign: TextAlign.start,
                  style: TextStyle(
                    fontSize: 14.0,
                    color: Colors.black,
                    fontWeight: FontWeight.normal,
                  ),
                ),
              ),
              Padding(
                padding:
                    EdgeInsets.only(bottom: 5, left: 16, right: 20, top: 14),
                child: Text(
                  '₹50',
                  textAlign: TextAlign.start,
                  style: TextStyle(
                    fontSize: 14.0,
                    color: Colors.black54,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
          Divider(
            thickness: 1,
            indent: 16,
            endIndent: 16,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding:
                    EdgeInsets.only(bottom: 5, left: 48, right: 16, top: 0),
                child: Text(
                  'To Pay',
                  textAlign: TextAlign.start,
                  style: TextStyle(
                    fontSize: 16.0,
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Padding(
                padding:
                    EdgeInsets.only(bottom: 5, left: 16, right: 20, top: 14),
                child: Text(
                  '₹100',
                  textAlign: TextAlign.start,
                  style: TextStyle(
                    fontSize: 16.0,
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
          Divider(
            thickness: 5,
            indent: 16,
            endIndent: 16,
          ),
          Expanded(
            child: Align(
              alignment: FractionalOffset.bottomCenter,
              child: Padding(
                padding: EdgeInsets.only(bottom: 10.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(
                          bottom: 5, left: 48, right: 8, top: 0),
                      child: Text(
                        '₹100',
                        textAlign: TextAlign.start,
                        style: TextStyle(
                          fontSize: 18.0,
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                          bottom: 15, left: 8, right: 20, top: 14),
                      child: ElevatedButton.icon(
                        onPressed: () {
                          // Respond to button press
                        },
                        label: Padding(
                          padding: EdgeInsets.only(
                              top: 12, bottom: 12, left: 10, right: 10),
                          child: Text(
                            "MAKE PAYMENT",
                            style: TextStyle(
                              fontSize: 16.0,
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        icon: Icon(
                          Icons.done,
                          size: 18,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    ),
    );
  }
}
