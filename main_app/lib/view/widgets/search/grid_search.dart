import 'package:online_shope_app/controller/home/favorite_ctrl.dart';
import 'package:online_shope_app/controller/search_ctrl.dart';
import 'package:online_shope_app/core/class/handling_states.dart';
import 'package:online_shope_app/core/constant/colors.dart';
import 'package:online_shope_app/model/products_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class GridSearch extends StatelessWidget {
  const GridSearch({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    FavoriteCtrl favcontroller = Get.put(FavoriteCtrl());
    return GetBuilder<SearchCtrl>(
      builder: (controller) => HandlingStates(
        status: controller.statusrequest,
        widget: Expanded(
          child: GridView.builder(
            itemCount: controller.productsFound.length,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              mainAxisSpacing: 20,
              crossAxisSpacing: 20,
              childAspectRatio: 0.8,
            ),
            itemBuilder: (context, index) {
              ProductModel pr = ProductModel.fromJson(controller.productsFound[index]);
              favcontroller.productsfav[pr.productId] = pr.isfavorite;
              return InkWell(
                onTap: () {
                  controller.onTapCard(pr);
                },
                child: Card(
                  clipBehavior: Clip.hardEdge,
                  color: Colors.white,
                  elevation: 10,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Container(
                        color: AppColor.primryColorLight,
                        width: double.infinity,
                        height: 140,
                        padding: const EdgeInsets.all(10),
                        child: Image.asset(
                          'assets/pngs/iphone.png',
                          fit: BoxFit.contain,
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Text(
                            pr.productName!,
                            style: const TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          GetBuilder<FavoriteCtrl>(
                            builder: (favcontroller) {
                              return InkWell(
                                onTap: () {
                                  if (favcontroller.productsfav[pr.productId] == 0) {
                                    favcontroller.changFav(pr.productId, 1);
                                    favcontroller.addFav(pr.productId.toString());
                                  } else {
                                    favcontroller.changFav(pr.productId, 0);
                                    favcontroller.removeFav(pr.productId.toString());
                                  }
                                },
                                child: Icon(
                                  color: AppColor.primryColorDark,
                                  favcontroller.productsfav[pr.productId] == 1
                                      ? Icons.favorite
                                      : Icons.favorite_border,
                                ),
                              );
                            },
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Text(
                            '${pr.productDiscountPrice} \$',
                            style: const TextStyle(
                              fontSize: 17,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          pr.productDiscount == 0
                              ? const Text('')
                              : Text(
                                  '${pr.productPrice} \$',
                                  style: const TextStyle(
                                    decoration: TextDecoration.lineThrough,
                                    decorationColor: Colors.red,
                                    fontSize: 13,
                                    color: Colors.red,
                                  ),
                                ),
                        ],
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
