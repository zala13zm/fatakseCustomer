import 'dart:convert';


import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:zomatoui/ui/home.dart';

import 'package:http/http.dart' as http;


void main() {
  runApp(
    MaterialApp(
      home: LoginPage(),
    ),
  );
}

class LoginPage extends StatelessWidget {
  final TextEditingController _phoneNumberController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  Future<String> getLoginAPICall(BuildContext context) async {

    Map<String, String> headers = {
      'Content-Type': 'application/json; charset=UTF-8',
    };
    Map<String, dynamic> requestJsonMap;

requestJsonMap = {
  'email': _emailController.text,
  'password':_passwordController.text
};


    final response = await http.post(Uri.parse("http://phplaravel-726599-3418885.cloudwaysapps.com/api/v1/login"),
          headers: headers,
          body:
          (requestJsonMap == null) ? null : json.encode(requestJsonMap))
          .timeout(const Duration(seconds: 60));
      var data = jsonDecode(response.body.toString());
//final datarespose = responseJson["Data"];
      if (response.statusCode == 200) {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => HomePage(
            ),
          ),
        );
      }




  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: Image.network(
              'https://admin.fataakse.co.in/storage/website/eWwrU10NsnC7HTaYFM7DsUqHUB61Bu6pfpuLoqUY.png',
              width: 500,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(32.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                TextFormField(
                  controller: _emailController,
                  keyboardType: TextInputType.emailAddress,
                  // set maximum length to 10
                  decoration: InputDecoration(
                    labelText: 'Email',
                    hintText: 'Enter email'
                  ),
                ),
                TextFormField(
                  controller: _passwordController,
                  keyboardType: TextInputType.visiblePassword,
                  // set maximum length to 10
                  decoration: InputDecoration(
                    labelText: 'Password',
                    hintText: 'Enter Password' // add prefix text
                  ),
                ),

                SizedBox(height: 16.0),
                ElevatedButton(
                  onPressed: () async {
                    // Navigate to OTP verification screen
                  await  getLoginAPICall(context);

                  },
                  child: Text('Login'),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color(0xFFF48635),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(100),
                    ),
                    minimumSize: Size(double.infinity, 64),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }




}

class VerifyPage extends StatefulWidget {
  final String phoneNumber;

  VerifyPage({this.phoneNumber});

  @override
  _VerifyPageState createState() => _VerifyPageState();
}

class _VerifyPageState extends State<VerifyPage> {
  final TextEditingController _otpController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: Image.network(
              'https://admin.fataakse.co.in/storage/website/eWwrU10NsnC7HTaYFM7DsUqHUB61Bu6pfpuLoqUY.png',
              width: 500,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(32.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text(
                  'Verification code has been sent to',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 16.0),
                Text(
                  '${widget.phoneNumber}',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 32.0),
                TextFormField(
                  controller: _otpController,
                  keyboardType: TextInputType.number,
                  maxLength: 6,
                  decoration: InputDecoration(
                    labelText: 'OTP',
                  ),
                ),
                SizedBox(height: 16.0),
                ElevatedButton(
                  onPressed: () {
                    // Perform OTP verification
                    // TODO: Add OTP verification logic here
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => UserDetailsPage(
                          phoneNumber: widget.phoneNumber,
                        ),
                      ),
                    );
                  },
                  child: Text('Verify'),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color(0xFFF48635),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(100),
                    ),
                    minimumSize: Size(double.infinity, 64),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class UserDetailsPage extends StatefulWidget {
  final String phoneNumber; // Define phoneNumber property here

  UserDetailsPage({this.phoneNumber});

  @override
  _UserDetailsPageState createState() => _UserDetailsPageState();
}

class _UserDetailsPageState extends State<UserDetailsPage> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  bool _agreeToTerms = false;

  @override
  void initState() {
    super.initState();

    // Automatically fill in phone number from Verify OTP page
    _phoneController.text = widget.phoneNumber;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Image.network(
                'https://admin.fataakse.co.in/storage/website/eWwrU10NsnC7HTaYFM7DsUqHUB61Bu6pfpuLoqUY.png',
              ),
              TextFormField(
                controller: _nameController,
                decoration: InputDecoration(
                  labelText: 'Name',
                ),
              ),
              SizedBox(height: 16.0),
              TextFormField(
                controller: _emailController,
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(
                  labelText: 'Email',
                ),
              ),
              SizedBox(height: 16.0),
              TextFormField(
                controller: _phoneController,
                keyboardType: TextInputType.phone,
                maxLength: 10, // set maximum length to 10
                decoration: InputDecoration(
                  labelText: 'Phone number',
                  prefixText: '+91', // add prefix text
                ),
              ),
              SizedBox(height: 16.0),
              CheckboxListTile(
                value: _agreeToTerms,
                onChanged: (newValue) {
                  setState(() {
                    _agreeToTerms = newValue ?? false;
                  });
                },
                title: Text('I agree to the terms and conditions'),
                controlAffinity: ListTileControlAffinity.leading,
              ),
              SizedBox(height: 16.0),
              ElevatedButton(
                onPressed: _agreeToTerms
                    ? () {
                        // Navigator.push(
                        //   context,
                        //   MaterialPageRoute(
                        //     builder: (context) => AddAddressPage(),
                        //   ),
                        // );
                        // TODO: Save user details and navigate to next screen
                      }
                    : null,
                child: Text('Apply'),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color(0xFFF48635),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(100),
                  ),
                  minimumSize: Size(double.infinity, 64),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// class AddAddressPage extends StatefulWidget {
//   @override
//   _AddAddressPageState createState() => _AddAddressPageState();
// }

// class _AddAddressPageState extends State<AddAddressPage> {
//   final _addressController = TextEditingController();
//   String _latitude;
//   String _longitude;
//   String _address;
//   LatLng _currentPosition;
//
//   GoogleMapController _mapController;
//
//   Future<void> _getLocation() async {
//     // Check if location permission is granted
//     LocationPermission permission = await Geolocator.checkPermission();
//     if (permission == LocationPermission.denied ||
//         permission == LocationPermission.deniedForever) {
//       // Request permission
//       permission = await Geolocator.requestPermission();
//       if (permission != LocationPermission.whileInUse &&
//           permission != LocationPermission.always) {
//         // Permission not granted, show error dialog
//         showDialog(
//           context: context,
//           builder: (context) => AlertDialog(
//             title: Text('Location permission denied'),
//             content:
//                 Text('Please grant location permission to use this feature.'),
//             actions: [
//               ElevatedButton(
//                 onPressed: () {
//                   Navigator.of(context).pop();
//                 },
//                 child: Text('OK'),
//               ),
//             ],
//           ),
//         );
//         return;
//       }
//     }
//
//     // Get location
//     Position position = await Geolocator.getCurrentPosition(
//       desiredAccuracy: LocationAccuracy.high,
//     );
//
//     // Update state with latitude and longitude
//     setState(() {
//       _latitude = '${position.latitude}';
//       _longitude = '${position.longitude}';
//       _currentPosition = LatLng(position.latitude, position.longitude);
//     });
//
//     // Reverse geocode to get address
//     List<Placemark> placemarks =
//         await placemarkFromCoordinates(position.latitude, position.longitude);
//     Placemark placemark = placemarks.first;
//     String address = '${placemark.street}, ${placemark.locality}';
//     if (placemark.subLocality != null && placemark.subLocality.isNotEmpty) {
//       address += ', ${placemark.subLocality}';
//     }
//     if (placemark.administrativeArea != null &&
//         placemark.administrativeArea.isNotEmpty) {
//       address += ', ${placemark.administrativeArea}';
//     }
//     if (placemark.postalCode != null && placemark.postalCode.isNotEmpty) {
//       address += ', ${placemark.postalCode}';
//     }
//
//     // Update state with address
//     setState(() {
//       _address = address;
//       _addressController.text = _address;
//     });
//   }
//
//   void _onMapCreated(GoogleMapController controller) {
//     _mapController = controller;
//     if (_currentPosition != null) {
//       _mapController.animateCamera(CameraUpdate.newCameraPosition(
//         CameraPosition(
//           target: _currentPosition,
//           zoom: 16.0,
//         ),
//       ));
//     }
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Padding(
//         padding: EdgeInsets.all(16.0),
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             ElevatedButton(
//               onPressed: _getLocation,
//               child: Text('Use Current Location'),
//               style: ElevatedButton.styleFrom(
//                 backgroundColor: Color(0xFFF48635),
//                 shape: RoundedRectangleBorder(
//                   borderRadius: BorderRadius.circular(100),
//                 ),
//                 minimumSize: Size(double.infinity, 64),
//               ),
//             ),
//             SizedBox(height: 16.0),
//             TextFormField(
//               controller: _addressController,
//               decoration: InputDecoration(
//                 labelText: 'Address',
//               ),
//               onChanged: (value) {
//                 _address = value;
//               },
//             ),
//             SizedBox(height: 16.0),
//             ElevatedButton(
//               onPressed: () {
// // TODO: Save address to database
//                 Navigator.push(
//                   context,
//                   MaterialPageRoute(
//                       builder: (context) => HomePage()),
//                 );
//                 //currently transferring the page to home screen on save address button
//                 // Navigator.pop(context);
//               },
//               child: Text('Add Address'),
//               style: ElevatedButton.styleFrom(
//                 backgroundColor: Color(0xFFF48635),
//                 shape: RoundedRectangleBorder(
//                   borderRadius: BorderRadius.circular(100),
//                 ),
//                 minimumSize: Size(double.infinity, 64),
//               ),
//             ),
//             SizedBox(height: 16.0),
//             Expanded(
//               child: _latitude == null || _longitude == null
//                   ? Container()
//                   : Stack(
//                       children: [
//                         GoogleMap(
//                           initialCameraPosition: CameraPosition(
//                             target: LatLng(double.parse(_latitude),
//                                 double.parse(_longitude)),
//                             zoom: 15.0,
//                           ),
//                           markers: Set<Marker>.of([
//                             Marker(
//                               markerId: MarkerId('current_location'),
//                               position: LatLng(double.parse(_latitude),
//                                   double.parse(_longitude)),
//                             ),
//                           ]),
//                           onMapCreated: _onMapCreated,
//                           myLocationEnabled: true,
//                           myLocationButtonEnabled: true,
//                         ),
//                         Align(
//                           alignment: Alignment.center,
//                           child: Icon(
//                             Icons.location_pin,
//                             color: Colors.red,
//                             size: 48.0,
//                           ),
//                         ),
//                       ],
//                     ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
