import 'package:flutter/material.dart';

class AuthPage extends StatefulWidget {
  const AuthPage({super.key});

  @override
  State<AuthPage> createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/images/back2.png'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Center(
            child: SizedBox(
              
              width: MediaQuery.of(context).size.width - 100,
              child: ElevatedButton(
                onPressed: () {},
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "LOGIN",
                      style: TextStyle(
                        color: Colors.white,
                        fontFamily: 'mytwo',
                        fontSize: 20,
                      ),
                    ),
                    Icon(Icons.login, color: Colors.white),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
