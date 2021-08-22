import 'package:carousel_slider/carousel_slider.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:wowsell/const/appcolor.dart';
import 'package:provider/provider.dart';
import 'package:wowsell/model/E_commerce_Provider_Data.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomePageCarouselSlider extends StatelessWidget {
  final List<String> carouselImages;

  HomePageCarouselSlider({this.carouselImages});

  @override
  Widget build(BuildContext context) {
    return Consumer<EcommerceProvider>(
      builder: (_,provider,___){
       return Column(
          children: [
            AspectRatio(
              aspectRatio: 19 / 9,
              child: CarouselSlider(
                items: carouselImages
                    .map(
                      (item) => Padding(
                    padding: EdgeInsets.all(5),
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        image: DecorationImage(
                          image: NetworkImage(item),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                )
                    .toList(),
                options: CarouselOptions(
                    autoPlayCurve: Curves.fastOutSlowIn,
                    autoPlay: true,
                    enlargeCenterPage: true,
                    viewportFraction: 1,
                    enlargeStrategy: CenterPageEnlargeStrategy.scale,
                    onPageChanged: (val, carouselPageChangedReason) {
                      provider.dotPosition=val;
                    }),
              ),
            ),
            SizedBox(
              height: 10.h,
            ),
            DotsIndicator(
              dotsCount:
              carouselImages.length == 0 ? 1 : carouselImages.length,
              position: provider.dotPosition.toDouble(),
              decorator: DotsDecorator(
                activeColor: AppColors.black,
                color: AppColors.grey,
                spacing: EdgeInsets.all(2),
                activeSize: Size(8, 8),
                size: Size(6, 6),
              ),
            ),
          ],
        );
      }
    );
  }
}

