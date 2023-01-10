/*
 * File name: categories_carousel_widget.dart
 * Last modified: 2022.12.12
 * Author: Ditlou tsa Molongoana
 * App Name: The sixth sense
 * Copyright (c) 2022
 */

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../global_widgets/circular_loading_widget.dart';
import '../controllers/home_controller.dart';
import 'category_grid_item_widget.dart';

class CategoriesCarouselWidget extends GetWidget<HomeController> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Get.theme.primaryColor,
      padding: EdgeInsets.only(bottom: 15),
      child: Obx(() {
        if (controller.categories.isEmpty)
          return CircularLoadingWidget(height: 300);
        else
          return
            GridView.count(
            controller: new ScrollController(keepScrollOffset: false),
            shrinkWrap: true,
            scrollDirection: Axis.vertical,
            addAutomaticKeepAlives: false,
            crossAxisSpacing: 10,
            mainAxisSpacing: 10,
            childAspectRatio: 0.75,
            primary: false,
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            crossAxisCount: MediaQuery.of(context).orientation == Orientation.portrait ? 4 : 6,
            children: controller.categories.map((element) => CategoryGridItemWidget(category: element, heroTag: "heroTag")).toList(),
          );
      }),
    );
  }
}
