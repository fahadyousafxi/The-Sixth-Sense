/*
 * File name: home2_view.dart
 * Last modified: 2022.02.17 at 09:53:26
 * Author: SmarterVision - https://codecanyon.net/user/smartervision
 * Copyright (c) 2022
 */

import 'dart:math';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../common/ui.dart';
import '../../../models/category_model.dart';
import '../../../models/slide_model.dart';
import '../../../providers/laravel_provider.dart';
import '../../../routes/app_routes.dart';
import '../../../services/settings_service.dart';
import '../../category/widgets/category_grid_item_widget.dart';
import '../../global_widgets/address_widget.dart';
import '../../global_widgets/home_search_bar_widget.dart';
import '../../global_widgets/notifications_button_widget.dart';
import '../controllers/home_controller.dart';
import '../widgets/categories_carousel_widget.dart';
import '../widgets/featured_categories_widget.dart';
import '../widgets/recommended_carousel_widget.dart';
import '../widgets/slide_item_widget.dart';

class Home2View extends GetView<HomeController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: RefreshIndicator(
          onRefresh: () async {
            Get.find<LaravelApiClient>().forceRefresh();
            await controller.refreshHome(showMessage: true);
            Get.find<LaravelApiClient>().unForceRefresh();
          },
          child: CustomScrollView(
            primary: true,
            shrinkWrap: false,
            slivers: <Widget>[
              SliverAppBar(
                backgroundColor: Theme.of(context).scaffoldBackgroundColor,
                expandedHeight: 170, /// editted
                elevation: 0.5,
                floating: true,
                iconTheme: IconThemeData(color: Theme.of(context).primaryColor),
                title: Text(
                  Get.find<SettingsService>().setting.value.appName,
                  style: Get.textTheme.headline6,
                ),
                centerTitle: true,
                automaticallyImplyLeading: false,
                leading: new IconButton(
                  icon: new Icon(Icons.menu, color: Colors.black87),
                  onPressed: () => {Scaffold.of(context).openDrawer()},
                ),
                actions: [NotificationsButtonWidget()],
                bottom: HomeSearchBarWidget(),

                flexibleSpace: Center(child: Column(          /// new work starts
                mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(height: 50),
                    Row(
                      children: [
                        SizedBox(width: 25,),
                        Text('Hi, what service do you need?', style: TextStyle(fontSize: 16),),

                      ],
                    ),
                  ],
                )),
                /// new work end
                // FlexibleSpaceBar(
                //   title: Text('Hi, what service do you need?'),
                //   collapseMode: CollapseMode.parallax,
                //   background: Center( child: Column(mainAxisAlignment: MainAxisAlignment.center,
                //     children: [
                //       SizedBox(height: 30),
                //       Text('Hi, what service do you need?'),
                //     ],
                //   ))
                  // Obx(() {
                    // return Stack(
                    //   alignment: controller.slider.isEmpty
                    //       ? AlignmentDirectional.center
                    //       : Ui.getAlignmentDirectional(controller.slider.elementAt(controller.currentSlide.value).textPosition),
                    //   children: <Widget>[
                    //     CarouselSlider(
                    //       options: CarouselOptions(
                    //         autoPlay: true,
                    //         autoPlayInterval: Duration(seconds: 7),
                    //         height: 360,
                    //         viewportFraction: 1.0,
                    //         onPageChanged: (index, reason) {
                    //           controller.currentSlide.value = index;
                    //         },
                    //       ),
                    //       items: controller.slider.map((Slide slide) {
                    //         return SlideItemWidget(slide: slide);
                    //       }).toList(),
                    //     ),
                    //     Container(
                    //       margin: EdgeInsets.symmetric(vertical: 70, horizontal: 20),
                    //       child: Row(
                    //         mainAxisSize: MainAxisSize.min,
                    //         children: controller.slider.map((Slide slide) {
                    //           return Container(
                    //             width: 20.0,
                    //             height: 5.0,
                    //             margin: EdgeInsets.symmetric(vertical: 20.0, horizontal: 2.0),
                    //             decoration: BoxDecoration(
                    //                 borderRadius: BorderRadius.all(
                    //                   Radius.circular(10),
                    //                 ),
                    //                 color: controller.currentSlide.value == controller.slider.indexOf(slide) ? slide.indicatorColor : slide.indicatorColor.withOpacity(0.4)),
                    //           );
                    //         }).toList(),
                    //       ),
                    //     ),
                    //   ],
                    // );
                  // }
                  // ),
                // ).marginOnly(bottom: 42),
              ),
              SliverToBoxAdapter(
                child: Wrap(
                  children: [
                    AddressWidget(),
                    /// new work starts
                    Container(
                      margin: EdgeInsets.symmetric(horizontal: 25),
                      child: Obx(() {
                        return Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 0),
                          child: Stack(
                            alignment: controller.slider.isEmpty
                                ? AlignmentDirectional.center
                                : Ui.getAlignmentDirectional(controller.slider.elementAt(controller.currentSlide.value).textPosition),
                            children: <Widget>[
                              CarouselSlider(
                                options: CarouselOptions(
                                  autoPlay: true,
                                  autoPlayInterval: Duration(seconds: 7),
                                  height: 230,
                                  viewportFraction: 1.0,
                                  onPageChanged: (index, reason) {
                                    controller.currentSlide.value = index;
                                  },
                                ),
                                items: controller.slider.map((Slide slide) {
                                  return SlideItemWidget(slide: slide);
                                }).toList(),
                              ),
                              Container(
                                margin: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                                child: Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: controller.slider.map((Slide slide) {
                                    return Container(
                                      width: 20.0,
                                      height: 5.0,
                                      margin: EdgeInsets.symmetric(vertical: 20.0, horizontal: 2.0),
                                      decoration: BoxDecoration(
                                          borderRadius: BorderRadius.all(
                                            Radius.circular(10),
                                          ),
                                          color: controller.currentSlide.value == controller.slider.indexOf(slide) ? slide.indicatorColor : slide.indicatorColor.withOpacity(0.4)),
                                    );
                                  }).toList(),
                                ),
                                alignment: Alignment.bottomRight,
                              ),
                            ],
                          ),
                        );}),
                    ),
                    /// new work ends

                    /// new work starts
                    Container(
                      color: Get.theme.primaryColor,
                      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                      child: Row(
                        children: [
                          Expanded(child: Text("Categories".tr, style: Get.textTheme.headline5)),
                          MaterialButton(
                            onPressed: () {
                              Get.toNamed(Routes.CATEGORIES);
                            },
                            shape: StadiumBorder(),
                            color: Get.theme.colorScheme.secondary.withOpacity(0.1),
                            child: Text("View All".tr, style: Get.textTheme.subtitle1),
                            elevation: 0,
                          ),
                        ],
                      ),
                    ),
                    CategoriesCarouselWidget(),

                    /// new work ends
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                      child: Row(
                        children: [

                          Expanded(child: Text("Recommended for you".tr, style: Get.textTheme.headline5)),
                          MaterialButton(
                            onPressed: () {
                              Get.toNamed(Routes.MAPS);
                            },
                            shape: StadiumBorder(),
                            color: Get.theme.colorScheme.secondary.withOpacity(0.1),
                            child: Text("View All".tr, style: Get.textTheme.subtitle1),
                            elevation: 0,
                          ),
                        ],
                      ),
                    ),
                    RecommendedCarouselWidget(),
                    // Container(
                    //   color: Get.theme.primaryColor,
                    //   padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                    //   child: Row(
                    //     children: [
                    //       Expanded(child: Text("Categories".tr, style: Get.textTheme.headline5)),
                    //       MaterialButton(
                    //         onPressed: () {
                    //           Get.toNamed(Routes.CATEGORIES);
                    //         },
                    //         shape: StadiumBorder(),
                    //         color: Get.theme.colorScheme.secondary.withOpacity(0.1),
                    //         child: Text("View All".tr, style: Get.textTheme.subtitle1),
                    //         elevation: 0,
                    //       ),
                    //     ],
                    //   ),
                    // ),
                    // CategoriesCarouselWidget(),
                    FeaturedCategoriesWidget(),
                  ],
                ),
              ),
            ],
          )),
    );
  }
}
