import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hospital/HospitalHome.dart';
import 'package:hospital/components/components.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  var user = TextEditingController();
  var pass = TextEditingController();
  bool isvisible = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue.shade800,
      appBar: AppBar(
        backgroundColor: Colors.blue.shade800,
        elevation: 0,
      ),
      body: Stack(
        children: [
          Container(
            height: double.infinity,
            width: double.infinity,
            child: Padding(
              padding: const EdgeInsets.only(top: 18,left: 30),
              child: Text('Sign in',style: TextStyle(
                color: Colors.white,
                fontStyle: FontStyle.italic,
                fontSize: 45,
                fontWeight: FontWeight.bold
              ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 80.0),
            child: Container(
              decoration: BoxDecoration(
                borderRadius:BorderRadius.only(topLeft: Radius.circular(30),topRight: Radius.circular(30)),
                color: Colors.white,
              ),
              height: double.infinity,
              width: double.infinity,
              child: Padding(
                padding: const EdgeInsets.all(30.0),
                child: SingleChildScrollView(
                  child: Center(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Welcome back',style: TextStyle(
                            color: Colors.blue.shade800,
                            fontStyle: FontStyle.italic,
                            fontSize: 30,
                            fontWeight:FontWeight.w900
                        ),
                        ),

                        Text('Hello there, sign in to continue!',style: TextStyle(
                            color: Colors.grey,
                            fontSize: 13,
                            fontWeight: FontWeight.bold
                        ),
                        ),
                        SizedBox(height:40 ,),
                        Container(
                          height: 50,
                          child: form(
                            input_type: TextInputType.name,
                            text: 'User name',
                            controlled_text: user,
                            prefix_icon: Icons.person
                          ),

                        ),
                        SizedBox(height:20 ,),
                        Container(
                          height: 50,
                          child: form(
                              input_type: TextInputType.name,
                              text: 'Password',
                              controlled_text: pass,
                              prefix_icon: Icons.lock,
                               visible_function: (){
                                setState(() {
                                  isvisible = !isvisible;
                                });
                               },
                              suffix_icon: isvisible? Icons.visibility : Icons.visibility_off,
                              obscureText: isvisible,
                          ),
                        ),
                        SizedBox(height:15 ,),
                        Center(
                          child: Text('Forgot Password? Contact us',style: TextStyle(
                              color: Colors.blue.shade800,
                              fontSize: 17,
                              fontWeight: FontWeight.bold,
                            fontStyle: FontStyle.italic
                          ),
                          ),
                        ),
                        SizedBox(height:50 ,),
                        button(
                          isupper: true,
                            text: 'Sign in',
                            function: (){
                            Navigator.push(context, MaterialPageRoute(builder: (context)=>HospitalHome()));
                            }
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
