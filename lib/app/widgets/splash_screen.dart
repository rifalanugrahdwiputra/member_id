import 'package:flutter/material.dart';
import '../utils/app_colors.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: AppColors.primaryColor,
        body: SafeArea(
          child: Center(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                children: [
                  Expanded(
                    child: Image.asset(
                      "assets/images/bgsplash.png",
                      height: 86.0,
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.only(bottom: 90),
                    child:
                        CircularProgressIndicator(color: AppColors.whiteColor),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
