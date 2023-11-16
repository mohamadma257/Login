import 'package:flutter/material.dart';
import 'package:line_icons/line_icons.dart';
import 'package:login_app/colors.dart';
import 'package:login_app/home_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  AutovalidateMode autovalidateMode = AutovalidateMode.always;
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  bool isPass = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      backgroundColor: Colors.white,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Login",
                  style: TextStyle(fontSize: 48),
                ),
                SizedBox(
                  height: 20,
                ),
                Text(
                  "sign in to learn with nabil",
                  style: TextStyle(fontSize: 20),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Expanded(
            flex: 3,
            child: Row(
              children: [
                Container(
                  width: 20,
                  decoration: BoxDecoration(
                    color: Colors.black,
                    borderRadius: BorderRadius.only(
                      bottomRight: Radius.circular(12),
                      topRight: Radius.circular(12),
                    ),
                  ),
                ),
                SizedBox(
                  width: 20,
                ),
                Expanded(
                  child: Container(
                    decoration: BoxDecoration(
                      color: greenColor,
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(12),
                        topLeft: Radius.circular(12),
                      ),
                    ),
                    padding: EdgeInsets.all(20),
                    child: Form(
                      autovalidateMode: autovalidateMode,
                      key: _formKey,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          TextFormField(
                            validator: (value) {
                              if (value!.isEmpty) {
                                return "Email can't be empty";
                              } else {
                                return null;
                              }
                            },
                            controller: emailController,
                            // onSubmitted: (value) => setState(() {
                            //   emailController.text = value;
                            // }),
                            onChanged: (value) => setState(() {
                              emailController.text = value;
                            }),
                            decoration: InputDecoration(
                              focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(color: blackColor),
                                  borderRadius: BorderRadius.circular(12)),
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(12)),
                              suffixIcon: Icon(LineIcons.user),
                              labelStyle: TextStyle(color: blackColor),
                              suffixIconColor: blackColor,
                              label: Text("Email"),
                            ),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          TextFormField(
                            validator: (value) {
                              if (value!.length < 6) {
                                return "Password must be 6 char";
                              } else {
                                return null;
                              }
                            },
                            obscureText: isPass,
                            controller: passwordController,
                            decoration: InputDecoration(
                              focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(color: blackColor),
                                  borderRadius: BorderRadius.circular(12)),
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(12)),
                              suffixIconColor: blackColor,
                              labelStyle: TextStyle(color: blackColor),
                              suffixIcon: GestureDetector(
                                child: Icon(Icons.remove_red_eye),
                                onTap: () {
                                  setState(() {
                                    isPass = !isPass;
                                  });
                                },
                              ),
                              label: Text("Password"),
                            ),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Row(
                            children: [
                              Expanded(
                                  child: ElevatedButton(
                                      style: ElevatedButton.styleFrom(
                                          padding: EdgeInsets.all(20),
                                          shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(12)),
                                          backgroundColor: blackColor),
                                      onPressed: () {
                                        if (_formKey.currentState!.validate()) {
                                          Navigator.pushAndRemoveUntil(
                                              context,
                                              MaterialPageRoute(
                                                builder: (context) =>
                                                    HomeScreen(),
                                              ),
                                              (route) => false);
                                        }
                                      },
                                      child: Text("Login"))),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              TextButton(
                                onPressed: () {},
                                child: Text("Forget Password?"),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Column(
            children: [
              Center(
                child: Text("OR Login With"),
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
                    padding: EdgeInsets.all(6),
                    decoration: BoxDecoration(
                        border: Border.all(width: 2),
                        borderRadius: BorderRadius.circular(999)),
                    child: IconButton(
                      onPressed: () {},
                      icon: Icon(LineIcons.facebookF),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.all(6),
                    decoration: BoxDecoration(
                        border: Border.all(width: 2),
                        borderRadius: BorderRadius.circular(999)),
                    child: IconButton(
                      onPressed: () {},
                      icon: Icon(LineIcons.googlePlus),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.all(6),
                    decoration: BoxDecoration(
                        border: Border.all(width: 2),
                        borderRadius: BorderRadius.circular(999)),
                    child: IconButton(
                      onPressed: () {},
                      icon: Icon(LineIcons.twitter),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 20,
              ),
              Center(child: Text("Don't have an account ? Create new account")),
            ],
          ),
          Spacer(),
        ],
      ),
    );
  }
}
