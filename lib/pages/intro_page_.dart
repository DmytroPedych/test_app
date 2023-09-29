// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:animate_do/animate_do.dart';
import 'package:shoes_test_app/components/language_constants_.dart';
import 'package:shoes_test_app/pages/home_page_.dart';
import 'package:shoes_test_app/theme/theme.dart';

class IntroPage_ extends StatefulWidget {
  const IntroPage_({super.key});

  @override
  State<IntroPage_> createState() => _IntroPage_State();
}

class _IntroPage_State extends State<IntroPage_> {
  @override
  Widget build(BuildContext context) {
    TextTheme textTheme_ = Theme.of(context).textTheme;
    return Scaffold(
      backgroundColor: introPageBgColor,
      appBar: AppBar(
        elevation: 1,
        backgroundColor: introPageBgColor,
        title: FadeInLeft(
          duration: const Duration(milliseconds: 700),
          child: Text(
            translation(context).shoesShop,
            style: textTheme_.headline3,
          ),
        ),
      ),
      body: SizedBox(
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const SizedBox(height: 20),
            Container(
              margin: const EdgeInsets.only(left: 10, right: 10),
              child: BounceInDown(
                duration: const Duration(milliseconds: 1800),
                delay: const Duration(milliseconds: 500),
                child: const Image(
                  image: AssetImage('assets/png/jordans_color.png'),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            FadeInUp(
              duration: const Duration(milliseconds: 1000),
              delay: const Duration(milliseconds: 500),
              child: Container(
                padding: const EdgeInsets.only(
                    bottom: 30, left: 40, top: 40, right: 20),
                margin:
                    const EdgeInsets.only(bottom: 0, top: 0, left: 2, right: 0),
                width: double.infinity,
                decoration: BoxDecoration(
                    color: Colors.pink.shade50,
                    borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(80),
                        topRight: Radius.circular(120),
                        bottomLeft: Radius.circular(180),
                        bottomRight: Radius.circular(0))),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    FadeInUp(
                      duration: const Duration(milliseconds: 1000),
                      delay: const Duration(milliseconds: 1000),
                      child: FadeInUp(
                        duration: const Duration(milliseconds: 1000),
                        delay: const Duration(milliseconds: 1000),
                        child: Text(
                          translation(context).discover_the,
                          style: const TextStyle(
                              fontFamily: 'Times New Roman',
                              fontSize: 35,
                              fontWeight: FontWeight.bold,
                              color: Colors.black54),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    FadeInLeft(
                      duration: const Duration(milliseconds: 1000),
                      delay: const Duration(milliseconds: 1500),
                      child: Text(
                        translation(context).stright_from,
                        style: const TextStyle(
                            fontFamily: 'Times New Roman',
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Colors.black54),
                      ),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    ElasticInRight(
                      duration: const Duration(milliseconds: 1000),
                      delay: const Duration(milliseconds: 1800),
                      child: Container(
                        margin: const EdgeInsets.only(left: 70),
                        padding: const EdgeInsets.only(
                            top: 20, bottom: 20, left: 10, right: 20),
                        decoration: BoxDecoration(
                            color: Colors.purple.shade200,
                            borderRadius: const BorderRadius.only(
                                topLeft: Radius.circular(10),
                                topRight: Radius.circular(120),
                                bottomLeft: Radius.circular(160),
                                bottomRight: Radius.circular(50))),
                        child: FadeInUp(
                          duration: const Duration(milliseconds: 1000),
                          delay: const Duration(milliseconds: 1000),
                          child: Align(
                            alignment: Alignment.bottomRight,
                            child: TextButton(
                                onPressed: () {
                                  Navigator.of(context).pushReplacement(
                                    MaterialPageRoute(
                                      settings:
                                          const RouteSettings(name: 'HomePage'),
                                      builder: (context) => HomePage(),
                                    ),
                                  );
                                },
                                child: ElasticInRight(
                                  duration: const Duration(milliseconds: 1000),
                                  delay: const Duration(milliseconds: 2000),
                                  child: Text(
                                    translation(context).explore_now,
                                    style: const TextStyle(
                                        color: Colors.black,
                                        fontSize: 27,
                                        fontFamily: 'Courier new',
                                        fontWeight: FontWeight.w900),
                                  ),
                                )),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
