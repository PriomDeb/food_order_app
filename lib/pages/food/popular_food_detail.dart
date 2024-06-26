// ignore_for_file: prefer_const_constructors, prefer_const_constructors_in_immutables, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:food_order_app/utils/dimensions.dart';
import 'package:food_order_app/widgets/app_column.dart';
import 'package:food_order_app/widgets/app_icon.dart';

import '../../utils/colors.dart';
import '../../widgets/big_text.dart';
import '../../widgets/icon_and_text_widget.dart';
import '../../widgets/small_text.dart';

class PopularFoodDetail extends StatelessWidget {
  PopularFoodDetail({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned(
            left: 0,
            right: 0,
            child: Container(
              width: double.maxFinite,
              height: Dimensions.responsiveHeight(350),
              decoration: BoxDecoration(
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: AssetImage("assets/image/food0.png"),
                ),
              ),
            ),
          ),
          Positioned(
            top: Dimensions.responsiveHeight(45),
            left: Dimensions.responsiveHeight(20),
            right: Dimensions.responsiveHeight(20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                AppIcon(icon: Icons.arrow_back_ios),
                AppIcon(icon: Icons.shopping_cart_outlined),
              ],
            ),
          ),
          Positioned(
            left: 0,
            right: 0,
            bottom: 0,
            top: Dimensions.responsiveHeight(350) -
                Dimensions.responsiveHeight(20),
            child: Container(
              padding: EdgeInsets.only(
                  left: Dimensions.responsiveHeight(20),
                  right: Dimensions.responsiveHeight(20),
                  top: Dimensions.responsiveHeight(20)),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                    topRight: Radius.circular(Dimensions.responsiveHeight(20)),
                    topLeft: Radius.circular(Dimensions.responsiveHeight(20))),
                color: Colors.white,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  AppColumn(text: "Chinese Side"),
                  SizedBox(
                    height: Dimensions.responsiveHeight(20),
                  ),
                  BigText(text: "Introduce"),
                ],
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: Container(
        height: Dimensions.responsiveHeight(120),
        padding: EdgeInsets.only(
            top: Dimensions.responsiveHeight(30),
            bottom: Dimensions.responsiveHeight(30),
            left: Dimensions.responsiveHeight(20),
            right: Dimensions.responsiveHeight(20)),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(Dimensions.responsiveHeight(40)),
              topRight: Radius.circular(Dimensions.responsiveHeight(40))),
          color: AppColors.buttonBackgroundColor,
          // color: Colors.amber,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              padding: EdgeInsets.only(
                  left: Dimensions.responsiveHeight(20),
                  right: Dimensions.responsiveHeight(20),
                  top: Dimensions.responsiveHeight(20),
                  bottom: Dimensions.responsiveHeight(20)),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.all(
                    Radius.circular(Dimensions.responsiveHeight(20))),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  // BigText(text: "-"),
                  Icon(
                    Icons.remove,
                    color: AppColors.signColor,
                  ),
                  SizedBox(width: Dimensions.responsiveHeight(6)),
                  BigText(text: "0"),
                  SizedBox(width: Dimensions.responsiveHeight(6)),
                  // BigText(text: "+"),
                  Icon(
                    Icons.add,
                    color: AppColors.signColor,
                  ),
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.only(
                  left: Dimensions.responsiveHeight(20),
                  right: Dimensions.responsiveHeight(20),
                  top: Dimensions.responsiveHeight(20),
                  bottom: Dimensions.responsiveHeight(20)),
              decoration: BoxDecoration(
                borderRadius:
                    BorderRadius.circular(Dimensions.responsiveHeight(20)),
                color: AppColors.mainColor,
              ),
              child: BigText(
                text: "\$0.08 Add to cart",
                color: Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
