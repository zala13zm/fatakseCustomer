import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      home: LoginPage(),
    ),
  );
}

class LoginPage extends StatelessWidget {
  final TextEditingController _phoneNumberController = TextEditingController();

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
                  controller: _phoneNumberController,
                  keyboardType: TextInputType.phone,
                  maxLength: 10, // set maximum length to 10
                  decoration: InputDecoration(
                    labelText: 'Phone number',
                    prefixText: '+91', // add prefix text
                  ),
                ),
                SizedBox(height: 16.0),
                ElevatedButton(
                  onPressed: () {
                    // Navigate to OTP verification screen
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => VerifyPage(
                          phoneNumber: _phoneNumberController.text,
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
                    Navigator.popUntil(context, ModalRoute.withName('/'));
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
