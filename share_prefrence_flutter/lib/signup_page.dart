import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:share_prefrence_flutter/login_page.dart';
import 'package:share_prefrence_flutter/profile_page.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SignupPage extends StatefulWidget {
  const SignupPage({super.key});

  @override
  State<SignupPage> createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  var validationKey = GlobalKey<FormState>();
  bool _passordVisibal = true;
  var nameController = TextEditingController();
  var emailController = TextEditingController();
  var passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.blue,
        leading: InkWell(
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => LoginPage(),
                  ));
            },
            child: Icon(
              Icons.arrow_back,
              color: Colors.white,
            )),
        title: Text(
          "Register Page",
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
      ),
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
                      height: 50,
                    ),
                    Image.asset(
                      'assets/signup.png',
                      height: 100,
                    ),
                    SizedBox(
                      height: 40,
                    ),
                    TextFormField(
                      controller: nameController,
                      decoration: InputDecoration(
                          prefixIcon: Icon(
                            Icons.person,
                            size: 25,
                          ),
                          isDense: true,
                          hintText: "UserName",
                          label: Text("Name"),
                          border: OutlineInputBorder()),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "Please Fill UserName";
                        } else if (value!.isNotEmpty) {}
                      },
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    TextFormField(
                      controller: emailController,
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
                          return 'Enter a valid email!';
                        }
                        return null;
                      },
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    TextFormField(
                      obscureText: _passordVisibal,
                      controller: passwordController,
                      decoration: InputDecoration(
                          isDense: true,
                          prefixIcon: Icon(
                            Icons.password,
                            size: 25,
                          ),
                          hintText: "UserPassword",
                          label: Text("Password"),
                          suffixIcon: IconButton(
                              onPressed: () {
                                setState(() {
                                  _passordVisibal = !_passordVisibal;
                                });
                              },
                              icon: _passordVisibal
                                  ? Icon(
                                      CupertinoIcons.eye_solid,
                                      size: 25,
                                    )
                                  : Icon(
                                      CupertinoIcons.eye_slash_fill,
                                      size: 25,
                                    )),
                          border: OutlineInputBorder()),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "Please Fill Password";
                        } else if (value!.isNotEmpty) {}
                      },
                    ),
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
                              sharePrefrence.setString(
                                  "Name", nameController.text.toString());
                              sharePrefrence.setString(
                                  "Email", emailController.text.toString());
                              sharePrefrence.setString("Password",
                                  passwordController.text.toString());
                              Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => ProfilePage(),
                                  ));
                              ScaffoldMessenger.of(context)
                                  .showSnackBar(SnackBar(
                                content: Text('SignUp successful'),
                                showCloseIcon: true,
                              ));
                            }
                          },
                          child: Text(
                            "Register",
                            style: TextStyle(color: Colors.white),
                          )),
                    ),
                    SizedBox(
                      height: 20,
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
                        Text("Or Register with"),
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
                      height: 20,
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
                        Text("Already have an account?"),
                        TextButton(
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => LoginPage(),
                                  ));
                            },
                            child: Text(
                              "Login",
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
