import 'package:online_shope_app/controller/home/categories_ctrl.dart';
import 'package:online_shope_app/core/constant/colors.dart';
import 'package:online_shope_app/model/categories_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ListCats extends StatelessWidget {
  const ListCats({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<CategoriesCtrl>(
      builder:
          (controller) => SizedBox(
            height: 50,
            child: ListView.separated(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              scrollDirection: Axis.horizontal,
              itemCount: controller.categories.length,
              separatorBuilder: (context, index) => const SizedBox(width: 20),
              itemBuilder: (context, index) {
                CategoryModel cat = CategoryModel.fromJson(controller.categories[index]);
                return InkWell(
                  onTap: () {
                    controller.changeCat(cat.id);
                  },
                  child: Text(
                    cat.name,
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: cat.id == controller.selectedcat ? AppColor.primryColor : Colors.black,
                    ),
                  ),
                );
              },
            ),
          ),
    );
  }
}
