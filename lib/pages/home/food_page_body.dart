// ignore_for_file: prefer_const_constructors, prefer_const_constructors_in_immutables, prefer_const_literals_to_create_immutables

import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:food_order_app/utils/colors.dart';
import 'package:food_order_app/utils/dimensions.dart';
import 'package:food_order_app/widgets/app_column.dart';
import 'package:food_order_app/widgets/big_text.dart';
import 'package:food_order_app/widgets/icon_and_text_widget.dart';
import 'package:food_order_app/widgets/small_text.dart';

class FoodPageBody extends StatefulWidget {
  FoodPageBody({super.key});

  @override
  State<FoodPageBody> createState() => _FoodPageBodyState();
}

class _FoodPageBodyState extends State<FoodPageBody> {
  // Use this to see next page and previous page a little bit
  PageController pageController = PageController(viewportFraction: 0.85);
  var _currPageValue = 0.0;

  double _scaleFactor = 0.8;
  double _height = Dimensions.responsiveHeight(220);

  @override
  void initState() {
    super.initState();

    pageController.addListener(() {
      setState(() {
        _currPageValue = pageController.page!;
      });
    });
  }

  @override
  void dispose() {
    // Free the memory
    pageController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          // color: Colors.redAccent,
          height: Dimensions.responsiveHeight(320),
          child: PageView.builder(
              controller: pageController,
              itemCount: 5,
              itemBuilder: (context, position) {
                return _buildPageItem(
                    position); // Calling from a custom function
              }),
        ),
        DotsIndicator(
          dotsCount: 5,
          position: _currPageValue,
          decorator: DotsDecorator(
            activeColor: AppColors.mainColor,
            size: const Size.square(9.0),
            activeSize: const Size(18.0, 9.0),
            activeShape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(5.0)),
          ),
        ),
        SizedBox(height: Dimensions.responsiveHeight(30)),
        Container(
          margin: EdgeInsets.only(left: Dimensions.responsiveHeight(30)),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              BigText(text: "Popular"),
              SizedBox(width: Dimensions.responsiveHeight(10)),
              Container(
                margin: const EdgeInsets.only(bottom: 3),
                child: BigText(text: ".", color: Colors.black26),
              ),
              SizedBox(width: Dimensions.responsiveHeight(10)),
              Container(
                margin: const EdgeInsets.only(bottom: 2),
                child: SmallText(text: "Food pairing"),
              ),
            ],
          ),
        ),

        // ListView builder has no height and width
        // We need to wrap this inside a Container()
        // Removed the Container() after completing the design
        // Because of that Container() the all items inside the ListView builder was not drawn
        ListView.builder(
            shrinkWrap: true,

            // We are setting it to NeverScrollableScrollPhysics() because we already made whole widget
            // as SingleChildScrollView() in main_food_page.dart
            physics: NeverScrollableScrollPhysics(),
            itemCount: 10,
            itemBuilder: (context, index) {
              return Container(
                margin: EdgeInsets.only(
                    left: Dimensions.responsiveHeight(20),
                    right: Dimensions.responsiveHeight(20),
                    bottom: Dimensions.responsiveHeight(10)),
                child: Row(
                  children: [
                    Container(
                      // Image
                      width: Dimensions.responsiveHeight(120),
                      height: Dimensions.responsiveHeight(120),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(
                            Dimensions.responsiveHeight(20)),
                        color: Colors.white38,
                        image: DecorationImage(
                          fit: BoxFit.cover,
                          image: AssetImage("assets/image/food0.png"),
                        ),
                      ),
                    ),
                    Expanded(
                      // Using Expanded() to stretch the Container() to the left
                      child: Container(
                        height: Dimensions.responsiveHeight(100),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.only(
                              topRight: Radius.circular(
                                  Dimensions.responsiveHeight(20)),
                              bottomRight: Radius.circular(
                                Dimensions.responsiveHeight(20),
                              )),
                          color: Colors.white,
                        ),
                        child: Padding(
                          padding: EdgeInsets.only(
                              left: Dimensions.responsiveHeight(10),
                              right: Dimensions.responsiveHeight(10)),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              BigText(text: "Nutritious fruit meal in China"),
                              SizedBox(height: Dimensions.responsiveHeight(10)),
                              SmallText(text: "With chinese characteristics"),
                              SizedBox(height: Dimensions.responsiveHeight(10)),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  IconAndTextWidget(
                                    icon: Icons.circle_sharp,
                                    text: "Normal",
                                    iconColor: AppColors.iconColor1,
                                  ),
                                  IconAndTextWidget(
                                    icon: Icons.location_on,
                                    text: "1.7km",
                                    iconColor: AppColors.mainColor,
                                  ),
                                  IconAndTextWidget(
                                    icon: Icons.access_time_rounded,
                                    text: "32min",
                                    iconColor: AppColors.iconColor2,
                                  ),
                                ],
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              );
            }),
      ],
    );
  }

  // Created a custom function for PageView.builer()
  // Child Container() takes all the properties of parent Container()
  // We can use Stack() if we want our child Container() to have their own property
  Widget _buildPageItem(int index) {
    Matrix4 matrix = new Matrix4.identity();

    // Handling current card
    if (index == _currPageValue.floor()) {
      var currScale = 1 - (_currPageValue - index) * (1 - _scaleFactor);
      var currTrans = _height * (1 - currScale) / 2;

      matrix = Matrix4.diagonal3Values(1, currScale, 1)
        ..setTranslationRaw(0, currTrans, 0);
    }
    // Handling right card
    else if (index == _currPageValue.floor() + 1) {
      var currScale =
          _scaleFactor + (_currPageValue - index + 1) * (1 - _scaleFactor);

      var currTrans = _height * (1 - currScale) / 2;

      matrix = Matrix4.diagonal3Values(1, currScale, 1)
        ..setTranslationRaw(0, currTrans, 0);
    }
    // Handling left card
    else if (index == _currPageValue.floor() - 1) {
      var currScale = 1 - (_currPageValue - index) * (1 - _scaleFactor);

      var currTrans = _height * (1 - currScale) / 2;

      matrix = Matrix4.diagonal3Values(1, currScale, 1)
        ..setTranslationRaw(0, currTrans, 0);
    } else {
      var currScale = 0.8;
      matrix = Matrix4.diagonal3Values(1, currScale, 1)
        ..setTranslationRaw(0, _height * (1 - _scaleFactor) / 2, 1);
    }

    return Transform(
      transform: matrix,
      child: Stack(
        children: [
          Container(
            height: Dimensions.responsiveHeight(220),
            margin: EdgeInsets.only(
                left: Dimensions.responsiveHeight(10),
                right: Dimensions.responsiveHeight(10)),
            decoration: BoxDecoration(
              borderRadius:
                  BorderRadius.circular(Dimensions.responsiveHeight(30)),
              color: index.isEven ? Color(0xFF69c5df) : Color(0xFF9294cc),
              image: DecorationImage(
                fit: BoxFit.cover,
                image: AssetImage("assets/image/food0.png"),
              ),
            ),
          ),
          Align(
            // By default Align() and its any child Container() will align it to the center of the parent Container()

            // We want the Container() to be in the bottom
            alignment: Alignment.bottomCenter,
            child: Container(
              // height: Dimensions.pageViewTextContainer,
              height: Dimensions.responsiveHeight(120),
              margin: EdgeInsets.only(
                  left: Dimensions.responsiveHeight(30),
                  right: Dimensions.responsiveHeight(30),
                  bottom: Dimensions.responsiveHeight(30)),
              decoration: BoxDecoration(
                  borderRadius:
                      BorderRadius.circular(Dimensions.responsiveHeight(20)),
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      color: Color(0xFFe8e8e8),
                      blurRadius: 5.0,
                      offset: Offset(0, 5),
                    ),
                    BoxShadow(
                      color: Colors.white,
                      offset: Offset(-5, 0),
                    ),
                    BoxShadow(
                      color: Colors.white,
                      offset: Offset(5, 0),
                    ),
                  ]),
              child: Container(
                padding: EdgeInsets.only(
                    top: Dimensions.responsiveHeight(15),
                    left: Dimensions.responsiveHeight(15),
                    right: Dimensions.responsiveHeight(15)),
                child: AppColumn(
                  text: "Chinese Side",
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
