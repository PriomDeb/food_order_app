// ignore_for_file: prefer_const_constructors_in_immutables, avoid_unnecessary_containers, prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:food_order_app/home/food_page_body.dart';
import 'package:food_order_app/utils/colors.dart';
import 'package:food_order_app/widgets/big_text.dart';
import 'package:food_order_app/widgets/small_text.dart';

class MainFoodPage extends StatefulWidget {
  MainFoodPage({super.key});

  @override
  State<MainFoodPage> createState() => _MainFoodPageState();
}

class _MainFoodPageState extends State<MainFoodPage> {
  @override
  Widget build(BuildContext context) {
    print(MediaQuery.of(context).size.height);
    print(MediaQuery.of(context).size.width);
    return Scaffold(
      body: Column(
        children: [
          Container(
            child: Container(
              margin: EdgeInsets.only(top: 45, bottom: 12),
              padding: EdgeInsets.only(left: 20, right: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    children: [
                      BigText(
                        text: "Bangladesh",
                        color: AppColors.mainColor,
                      ),
                      Row(
                        children: [
                          SmallText(
                            text: "Sreemangal",
                            color: Colors.black45,
                          ),
                          Icon(Icons.arrow_drop_down_rounded),
                        ],
                      ),
                    ],
                  ),
                  Center(
                    child: Container(
                      width: 45,
                      height: 45,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        color: AppColors.mainColor,
                      ),
                      child: Icon(
                        Icons.search,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          FoodPageBody(),
        ],
      ),
    );
  }
}
