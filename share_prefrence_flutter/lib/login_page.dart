import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:share_prefrence_flutter/profile_page.dart';
import 'package:share_prefrence_flutter/signup_page.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  var validationKey = GlobalKey<FormState>();
  bool _passwordVisible = true;
  var emailController = TextEditingController();
  var passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Form(
                key: validationKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: 80,
                    ),
                    Image.asset(
                      'assets/login.webp',
                      height: 200,
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    TextFormField(
                      controller: emailController,
                      keyboardType: TextInputType.emailAddress,
                      decoration: InputDecoration(
                          isDense: true,
                          prefixIcon: Icon(
                            Icons.email,
                            size: 25,
                          ),
                          hintText: "UserEmail",
                          label: Text("Email"),
                          border: OutlineInputBorder()),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "Email is required*";
                        } else if (!value.contains('@gmail.com')) {
                          return 'Enter a valid email';
                        }
                        return null;
                      },
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    TextFormField(
                      obscureText: _passwordVisible,
                      controller: passwordController,
                      keyboardType: TextInputType.visiblePassword,
                      decoration: InputDecoration(
                          prefixIcon: Icon(
                            Icons.password,
                            size: 25,
                          ),
                          isDense: true,
                          hintText: "UserPassword",
                          label: Text("Password"),
                          suffixIcon: IconButton(
                              onPressed: () {
                                setState(() {
                                  _passwordVisible = !_passwordVisible;
                                });
                              },
                              icon: _passwordVisible
                                  ? Icon(
                                      CupertinoIcons.eye_solid,
                                      size: 22,
                                    )
                                  : Icon(
                                      CupertinoIcons.eye_slash_fill,
                                      size: 25,
                                    )),
                          border: OutlineInputBorder()),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "Password is required*";
                        }
                        return null;
                      },
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Align(
                        alignment: Alignment.topRight,
                        child: Text(
                          "Forget Password?",
                          style: TextStyle(color: Colors.black),
                        )),
                    SizedBox(
                      height: 20,
                    ),
                    SizedBox(
                      height: 45,
                      width: double.infinity,
                      child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.blue,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(5))),
                          onPressed: () async {
                            if (validationKey.currentState!.validate()) {
                              var sharePrefrence =
                                  await SharedPreferences.getInstance();
                              var signupEmailGet =
                                  sharePrefrence.getString("Email");
                              var signupPasswordGet =
                                  sharePrefrence.getString("Password");

                              if (emailController.text.toString()!=signupEmailGet) {
                                ScaffoldMessenger.of(context)
                                    .showSnackBar(SnackBar(
                                  content: Text('Wrong email!'),
                                  showCloseIcon: true,
                                ));
                              } else if (passwordController.text.toString() !=signupPasswordGet) {
                                ScaffoldMessenger.of(context)
                                    .showSnackBar(SnackBar(
                                  content: Text('Wrong password!'),
                                  showCloseIcon: true,
                                ));
                              } else {
                                Navigator.pushReplacement(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => ProfilePage(),
                                    ));
                                ScaffoldMessenger.of(context)
                                    .showSnackBar(SnackBar(
                                  content: Text('Login successful!'),
                                  showCloseIcon: true,
                                ));
                              }
                            }
                          },
                          child: Text(
                            "Login",
                            style: TextStyle(color: Colors.white),
                          )),
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Expanded(
                          child: SizedBox(
                              width: 100,
                              child: Divider(
                                height: 1,
                                color: Colors.grey.shade400,
                              )),
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        Text("Or Login with"),
                        SizedBox(
                          width: 5,
                        ),
                        Expanded(
                          child: SizedBox(
                              width: 100,
                              child: Divider(
                                height: 1,
                                color: Colors.grey.shade400,
                              )),
                        )
                      ],
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          height: 60,
                          width: 60,
                          child: Card(
                            color: Colors.white,
                            elevation: 2.0,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(50)),
                            child: Image.asset('assets/facebook.png'),
                          ),
                        ),
                        Container(
                          height: 60,
                          width: 60,
                          child: Card(
                            color: Colors.white,
                            elevation: 2.0,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(50)),
                            child: Image.asset('assets/google.png'),
                          ),
                        ),
                        Container(
                          height: 60,
                          width: 60,
                          child: Card(
                            color: Colors.white,
                            elevation: 2.0,
                            child: Image.asset('assets/twitter.png'),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(50)),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 50,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("Have't any account?"),
                        TextButton(
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => SignupPage(),
                                  ));
                            },
                            child: Text(
                              "Register",
                              style: TextStyle(
                                  color: Colors.blue,
                                  fontWeight: FontWeight.bold),
                            )),
                      ],
                    )
                  ],
                )),
          ),
        ),
      ),
    );
  }
}
