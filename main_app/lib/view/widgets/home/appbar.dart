import 'package:online_shope_app/controller/search_ctrl.dart';
import 'package:online_shope_app/core/constant/routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeAppBar extends StatelessWidget implements PreferredSizeWidget {
  const HomeAppBar({super.key});

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    SearchCtrl controller = Get.put(SearchCtrl());
    return SafeArea(
      child: Row(
        children: [
          Expanded(
            child: TextField(
              controller: controller.searchField,
              onChanged: (value) async {
                if (value.isEmpty) {
                  Get.back();
                } else {
                  await controller.searchProducts();
                }
              },
              onSubmitted: (value) async => await controller.goSearch(),
              decoration: InputDecoration(
                filled: true,
                fillColor: Colors.grey[300],
                prefixIcon: IconButton(
                  onPressed: () {
                    controller.goSearch();
                    FocusScope.of(Get.context!).unfocus();
                  },
                  icon: const Icon(Icons.search),
                ),
                hintText: 'Search',
                hintStyle: Theme.of(context).textTheme.bodyLarge,
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(30), borderSide: BorderSide.none),
              ),
            ),
          ),
          const SizedBox(width: 5),
          Container(
            decoration: BoxDecoration(shape: BoxShape.circle, color: Colors.grey[300]),
            height: 50,
            width: 50,
            child: const Icon(
              Icons.notifications_none,
              // size: 25,
            ),
          ),
          const SizedBox(width: 5),
          InkWell(
            onTap: () {
              Get.toNamed(AppRoutes.myFavorite);
            },
            child: Container(
              decoration: BoxDecoration(shape: BoxShape.circle, color: Colors.grey[300]),
              height: 50,
              width: 50,
              child: const Icon(
                Icons.favorite_border,
                // size: 25,
              ),
            ),
          ),
          const SizedBox(width: 5),
        ],
      ),
    );
  }
}
