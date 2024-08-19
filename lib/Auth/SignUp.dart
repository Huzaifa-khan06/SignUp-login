// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, implicit_call_tearoffs, sort_child_properties_last

import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:get/get.dart';
import 'package:network_one/Controller/AuthController.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final _formKey = GlobalKey<FormState>();
  bool isPasswordObscure = false;
  var nameController = TextEditingController();
  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  var authController = Get.put(AuthController());

  @override
  Widget build(BuildContext context) {
    // Get screen width and height
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      body: GetBuilder<AuthController>(builder: (controller) {
        return Form(
          autovalidateMode: AutovalidateMode.onUserInteraction,
          key: _formKey,
          child: Container(
            width: double.infinity,
            decoration: BoxDecoration(
                gradient: LinearGradient(begin: Alignment.topCenter, colors: [
              Colors.green.shade800,
              Colors.green.shade400,
              Colors.green.shade500
            ])),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Spacer(flex: 1), // Top spacing with flexible height
                Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal: screenWidth *
                          0.05), // 5% of screen width for horizontal padding
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      FadeInUp(
                        duration: Duration(milliseconds: 1000),
                        child: Text("Sign Up",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: screenWidth *
                                    0.1)), // Font size is 10% of screen width
                      ),
                      SizedBox(
                          height: screenHeight * 0.01), // 1% of screen height
                      FadeInUp(
                        duration: Duration(milliseconds: 1300),
                        child: Text("Welcome to My Zong",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: screenWidth *
                                    0.045)), // Font size is 4.5% of screen width
                      ),
                    ],
                  ),
                ),
                // SizedBox(height: 10,),
                Spacer(flex: 1),
                // Flexible spacing
                Expanded(
                  flex: 11,
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(60),
                          topRight: Radius.circular(60)),
                    ),
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                        vertical: screenHeight *
                            0.05, // 5% of screen height for vertical padding
                        horizontal: screenWidth *
                            0.08, // 8% of screen width for horizontal padding
                      ),
                      child: Column(
                        children: <Widget>[
                          // Spacer(flex: 1), // Top flexible spacing
                          FadeInUp(
                              duration: Duration(milliseconds: 1400),
                              child: Container(
                                padding: EdgeInsets.only(left: 10),
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(10),
                                    boxShadow: [
                                      BoxShadow(
                                          color:
                                              Color.fromRGBO(225, 95, 27, .3),
                                          blurRadius: 20,
                                          offset: Offset(0, 10))
                                    ]),
                                child: Column(
                                  children: <Widget>[
                                    Container(
                                      padding: EdgeInsets.symmetric(
                                        vertical: screenHeight *
                                            0.010, // 1.5% of screen height for vertical padding
                                      ),
                                      decoration: BoxDecoration(
                                          border: Border(
                                              bottom: BorderSide(
                                                  color:
                                                      Colors.grey.shade200))),
                                      child: TextFormField(
                                        controller: nameController,
                                        validator: RequiredValidator(
                                            errorText: 'Required *'),
                                        decoration: InputDecoration(
                                            prefixIcon: Icon(
                                              Icons.person,
                                              color: Colors.pinkAccent,
                                              size: 20,
                                            ),
                                            hintText: "Name",
                                            hintStyle:
                                                TextStyle(color: Colors.grey),
                                            border: InputBorder.none),
                                        style: TextStyle(fontSize: 15),
                                      ),
                                    ),
                                    Container(
                                      padding: EdgeInsets.symmetric(
                                        vertical: screenHeight *
                                            0.010, // 1.5% of screen height for vertical padding
                                      ),
                                      decoration: BoxDecoration(
                                          border: Border(
                                              bottom: BorderSide(
                                                  color:
                                                      Colors.grey.shade200))),
                                      child: TextFormField(
                                        controller: emailController,
                                        validator: MultiValidator([
                                          RequiredValidator(
                                              errorText: 'Required *'),
                                          EmailValidator(
                                              errorText:
                                                  'Enter a valid Email Address'),
                                        ]),
                                        decoration: InputDecoration(
                                            prefixIcon: Icon(
                                              Icons.email_sharp,
                                              color: Colors.pinkAccent,
                                              size: 20,
                                            ),
                                            hintText: "Email",
                                            hintStyle:
                                                TextStyle(color: Colors.grey),
                                            border: InputBorder.none),
                                        style: TextStyle(fontSize: 15),
                                      ),
                                    ),
                                    Container(
                                      padding: EdgeInsets.symmetric(
                                        vertical: screenHeight * 0.007 // 1.5% of screen height for vertical padding
                                      ),
                                      decoration: BoxDecoration(
                                          border: Border(
                                              bottom: BorderSide(
                                                  color:
                                                      Colors.grey.shade200))),
                                      child: TextFormField(
                                        controller: passwordController,
                                        obscureText: isPasswordObscure,
                                        validator: MultiValidator([
                                          RequiredValidator(
                                              errorText: 'Required *'),
                                          MinLengthValidator(
                                            6,
                                            errorText:
                                                'Shoud be at least 6 Charater',
                                          ),
                                        ]),
                                        decoration: InputDecoration(
                                            prefixIcon: Icon(
                                              Icons.lock,
                                              color: Colors.pinkAccent,
                                              size: 20,
                                            ),
                                            suffixIcon: IconButton(
                                              onPressed: () {
                                                setState(() {
                                                  isPasswordObscure =
                                                      !isPasswordObscure;
                                                });
                                              },
                                              icon: Icon(
                                                isPasswordObscure
                                                    ? Icons.visibility
                                                    : Icons.visibility_off,
                                                color: Colors.pinkAccent,
                                                size: 20,
                                              ),
                                            ),
                                            hintText: "Password",
                                            hintStyle:
                                                TextStyle(color: Colors.grey),
                                            border: InputBorder.none),
                                        style: TextStyle(fontSize: 15),
                                      ),
                                    ),
                                  ],
                                ),
                              )),
                          Spacer(flex: 1), // Flexible spacing
                          FadeInUp(
                              duration: Duration(milliseconds: 1500),
                              child: Text("Already have an Account? Login",
                                  style: TextStyle(color: Colors.grey))),
                          Spacer(flex: 1), // Flexible spacing
                          FadeInUp(
                              duration: Duration(milliseconds: 1600),
                              child: controller.isLoading
                                  ? CircularProgressIndicator()
                                  : Container(
                                      height: screenHeight *
                                          0.07, // 7% of screen height
                                      width: screenWidth *
                                          0.5, // Button takes full width
                                      decoration: BoxDecoration(
                                        gradient: LinearGradient(
                                          colors: [
                                            Colors.green,
                                            Color.fromARGB(255, 153, 201, 98)
                                          ],
                                          begin: Alignment.centerLeft,
                                          end: Alignment.centerRight,
                                        ),
                                        borderRadius: BorderRadius.circular(30),
                                      ),

                                      child: MaterialButton(
                                        onPressed: () {
                                          if (_formKey.currentState!
                                              .validate()) {
                                            authController.signUpUser(
                                                emailController.text,
                                                passwordController.text,
                                                nameController.text);
                                          }
                                        },
                                        child: Text(
                                          "Sign Up",
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontWeight: FontWeight.bold,
                                              fontSize: 20),
                                        ),
                                        elevation:
                                            10, // To remove the default elevation of the button
                                        textColor: Colors.white,
                                        highlightColor: Colors.transparent,
                                        splashColor: Colors.transparent,
                                      ),
                                    )),
                          Spacer(flex: 1), // Flexible spacing
                          FadeInUp(
                              duration: Duration(milliseconds: 1700),
                              child: Text("Continue with social media",
                                  style: TextStyle(color: Colors.grey))),
                          Spacer(flex: 1), // Flexible spacing
                          Row(
                            children: <Widget>[
                              Expanded(
                                child: FadeInUp(
                                  duration: Duration(milliseconds: 1800),
                                  child: Icon(
                                    Icons.facebook_outlined,
                                    size: 53,
                                    color:
                                        const Color.fromARGB(255, 9, 91, 158),
                                  ),
                                ),
                              ),
                              SizedBox(width: screenWidth * 0.02),
                              Expanded(
                                child: FadeInUp(
                                    duration: Duration(milliseconds: 1800),
                                    child: CircleAvatar(
                                      radius: 23,
                                      backgroundImage: NetworkImage(
                                          'https://53.fs1.hubspotusercontent-na1.net/hub/53/hubfs/image8-2.jpg?width=595&height=400&name=image8-2.jpg'),
                                    )),
                              ),
                              SizedBox(width: screenWidth * 0.02),
                              Expanded(
                                child: FadeInUp(
                                  duration: Duration(milliseconds: 1800),
                                  child: Icon(
                                    Icons.apple_sharp,
                                    size: 57,
                                    color: Colors.black,
                                  ),
                                ),
                              ),
                              SizedBox(width: screenWidth * 0.02),
                            ],
                          ),
                          Spacer(flex: 1), // Bottom flexible spacing
                        ],
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        );
      }),
    );
  }
}
