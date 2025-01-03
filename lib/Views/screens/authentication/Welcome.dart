import 'package:flutter/material.dart';
import 'package:foodloop/views/utils/AppColor.dart';
import 'package:foodloop/views/screens/authentication/Login.dart';
import 'package:foodloop/views/screens/authentication/Register.dart';

class WelcomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
      child: Stack(
        children: [
          Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
          ),
          Positioned(
            bottom: 0,
            child: Container(
              padding: EdgeInsets.only(left: 16, right: 16, bottom: 32),
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height * 92 / 100,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    children: [
                      Padding(
                        padding: EdgeInsets.only(bottom: 16),
                        child: Image.asset(
                          'assets/images/LogoFL.png',
                          width: 340,
                          height: 340,
                        ),
                      ),
                      Text("Cut Waste, Save Cash, Join\nFoodLoop!",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontFamily: 'inter',
                              fontWeight: FontWeight.w700,
                              fontSize: 20,
                              color: AppColor.primary)),
                    ],
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      // Get Started Button
                      SizedBox(
                        width: MediaQuery.of(context).size.width,
                        height: 60,
                        child: ElevatedButton(
                          child: Text('Get Started',
                              style: TextStyle(
                                  color: AppColor.secondary,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w600,
                                  fontFamily: 'inter')),
                          onPressed: () {
                            showModalBottomSheet(
                              context: context,
                              backgroundColor: Colors.white,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(20),
                                      topRight: Radius.circular(20))),
                              isScrollControlled: true,
                              builder: (context) {
                                return RegisterModal();
                              },
                            );
                          },
                          style: ElevatedButton.styleFrom(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10)),
                            backgroundColor:
                                AppColor.primary, // Color de fondo del botón
                          ),
                        ),
                      ),
                      SizedBox(height: 16),
                      // Log in Button
                      SizedBox(
                        width: MediaQuery.of(context).size.width,
                        height: 60,
                        child: OutlinedButton(
                          child: Text('Log in',
                              style: TextStyle(
                                  color: AppColor.primary,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w600,
                                  fontFamily: 'inter')),
                          onPressed: () {
                            showModalBottomSheet(
                              context: context,
                              backgroundColor:
                                  const Color.fromRGBO(255, 255, 255, 1),
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(20),
                                      topRight: Radius.circular(20))),
                              isScrollControlled: true,
                              builder: (context) {
                                return LoginModal();
                              },
                            );
                          },
                          style: OutlinedButton.styleFrom(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10)),
                            side:
                                BorderSide(color: AppColor.primary, width: 2.5),
                            textStyle: TextStyle(color: Colors.white),
                          ),
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.symmetric(horizontal: 8),
                        margin: EdgeInsets.only(top: 32),
                        child: RichText(
                          textAlign: TextAlign.center,
                          text: TextSpan(
                            text: 'By joining foodloop, you agree to our ',
                            style: TextStyle(
                                color: AppColor.grey, height: 150 / 100),
                            children: [
                              TextSpan(
                                text: 'Terms of service ',
                                style: TextStyle(
                                    color: AppColor.grey,
                                    fontWeight: FontWeight.w700,
                                    height: 150 / 100),
                              ),
                              TextSpan(
                                text: 'and ',
                                style: TextStyle(
                                    color: AppColor.grey, height: 150 / 100),
                              ),
                              TextSpan(
                                text: 'Privacy policy.',
                                style: TextStyle(
                                    color: AppColor.grey,
                                    fontWeight: FontWeight.w700,
                                    height: 150 / 100),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    ));
  }
}
