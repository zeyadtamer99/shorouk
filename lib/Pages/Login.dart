import 'package:flutter/material.dart';
import 'package:shorouk/Pages/MainMenu.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          height: screenHeight,
          width: screenWidth,
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/images/background.jpg'), // replace with your background image asset
              fit: BoxFit.fill,
              opacity: 0.2,
            ),
          ),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset('assets/images/logo.png',
                    height: screenHeight * 0.25), // replace with your logo asset
                 Text(
                  'AL-Shorouk',
                  style: TextStyle(
                    letterSpacing: 2,
                      fontSize: screenWidth*0.1,
                      fontWeight: FontWeight.bold,
                      color: Colors.blue),
                ),
                Card(
                  elevation: 20,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15.0),
                  ),
                  color: Colors.blue.shade100,
                  margin: EdgeInsets.all(screenWidth * 0.05),
                  child: Padding(
                    padding: EdgeInsets.all(screenWidth * 0.05),
                    child: Form(
                      key: _formKey,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Padding(
                            padding: const EdgeInsets.fromLTRB(0, 0, 0, 16),
                            child: Text(
                              "Welcome Back",
                              style: TextStyle(
                                fontSize: screenWidth*0.07, // adjust the size as needed
                                fontWeight: FontWeight.bold, // make the text bold
                                color: Colors.blue, // change the text color to blue
                              ),
                              textAlign: TextAlign.center, // align the text to the center
                            ),
                          ),
                          TextFormField(
                            controller: _emailController,
                            decoration: const InputDecoration(
                              labelText: 'Email',
                              filled: true,
                              fillColor: Colors.white,
                              border: OutlineInputBorder(),
                            ),
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please enter your email';
                              }
                              return null;
                            },
                          ),
                          SizedBox(height: screenHeight * 0.03),
                          TextFormField(
                            controller: _passwordController,
                            decoration: const InputDecoration(
                              labelText: 'Password',
                              filled: true,
                              fillColor: Colors.white,
                              border: OutlineInputBorder(),
                            ),
                            obscureText: true,
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please enter your password';
                              }
                              return null;
                            },
                          ),
                          SizedBox(height: screenHeight * 0.03),
                          Center(
                            child: SizedBox(
                              width: screenWidth * 0.3,
                              height: screenHeight * 0.06,
                              child: ElevatedButton.icon(
                                onPressed: () {
                                  if (_formKey.currentState!.validate()) {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(builder: (context) => MainMenu()),
                                    );                                  }
                                },
                                icon: const Icon(Icons.login),
                                label: const Text('Login'),
                                style: ElevatedButton.styleFrom(
                                  primary: Colors.blue,
                                ),
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
        ),
      ),
    );
  }
}
