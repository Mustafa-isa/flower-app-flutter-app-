import 'package:flowerapp/Components/TextFieldWidget.dart';
import 'package:flowerapp/Page/Home.dart';
import 'package:flowerapp/Page/Login.dart';
import 'package:flutter/material.dart';

class Register extends StatelessWidget {
  const Register({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          height: double.infinity,
          width: double.infinity,
          child: Center(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    FieldInput(
                        inputType: "pass",
                        hintType: "Please Enter User Name :",
                        inputShow: false),
                    SizedBox(
                      height: 30,
                    ),
                    FieldInput(
                        inputType: "email",
                        hintType: "Please Enter Email :",
                        inputShow: false),
                    SizedBox(
                      height: 30,
                    ),
                    FieldInput(
                        inputType: "pass ",
                        hintType: "Please Enter pass :",
                        inputShow: true),
                    SizedBox(
                      height: 30,
                    ),
                    ElevatedButton(
                      onPressed: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) => Login()));
                      },
                      child: Text(
                        "Sign up",
                        style: TextStyle(color: Colors.white, fontSize: 20),
                      ),
                      style: ButtonStyle(
                          backgroundColor:
                              MaterialStateProperty.all(Colors.green),
                          padding:
                              MaterialStateProperty.all(EdgeInsets.all(12)),
                          shape: MaterialStateProperty.all(
                              RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(8)))),
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          'Do You Have An Account',
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.w500),
                        ),
                        TextButton(
                            onPressed: () {
                              Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => Login()));
                            },
                            child: Text("Sign in",
                                style: TextStyle(
                                    fontSize: 20, fontWeight: FontWeight.bold)))
                      ],
                    )
                  ]),
            ),
          ),
        ),
      ),
    );
  }
}
