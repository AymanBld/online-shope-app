import 'package:online_shope_app/controller/home/favorite_ctrl.dart';
import 'package:online_shope_app/controller/home/categories_ctrl.dart';
import 'package:online_shope_app/core/class/handling_states.dart';
import 'package:online_shope_app/core/constant/colors.dart';
import 'package:online_shope_app/model/products_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class GridProducts extends StatelessWidget {
  const GridProducts({super.key});

  @override
  Widget build(BuildContext context) {
    var favcontroller = Get.put(FavoriteCtrl());
    return GetBuilder<CategoriesCtrl>(
      builder:
          (controller) => HandlingStates(
            status: controller.statusrequest,
            widget: Expanded(
              child: GridView.builder(
                itemCount: controller.productsOfCat.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 20,
                  crossAxisSpacing: 20,
                  childAspectRatio: 0.8,
                ),
                itemBuilder: (context, index) {
                  ProductModel pr = ProductModel.fromJson(controller.productsOfCat[index]);
                  favcontroller.productsfav[pr.id] = pr.isFavorite;
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
                            child: Image.asset('assets/pngs/iphone.png', fit: BoxFit.contain),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Text(pr.name, style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                              GetBuilder<FavoriteCtrl>(
                                builder: (favcontroller) {
                                  return InkWell(
                                    onTap: () {
                                      if (favcontroller.productsfav[pr.id] == 0) {
                                        favcontroller.changFav(pr.id, 1);
                                        favcontroller.addFav(pr.id.toString());
                                      } else {
                                        favcontroller.changFav(pr.id, 0);
                                        favcontroller.removeFav(pr.id.toString());
                                      }
                                    },
                                    child: Icon(
                                      color: AppColor.primryColorDark,
                                      favcontroller.productsfav[pr.id] == 1 ? Icons.favorite : Icons.favorite_border,
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
                                '${pr.dicountedPrice} \$',
                                style: const TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
                              ),
                              pr.discount == '0'
                                  ? const Text('')
                                  : Text(
                                    '${pr.price} \$',
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
