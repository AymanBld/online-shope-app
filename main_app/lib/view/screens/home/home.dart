import 'package:online_shope_app/controller/home/home_ctrl.dart';
import 'package:online_shope_app/core/class/handling_states.dart';
import 'package:online_shope_app/view/widgets/home/appbar.dart';
import 'package:online_shope_app/view/widgets/home/list_categories.dart';
import 'package:online_shope_app/view/widgets/home/event_card.dart';
import 'package:online_shope_app/view/widgets/home/products_for_you.dart';
import 'package:online_shope_app/view/widgets/home/titles.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeCtrl>(
      init: HomeCtrl(),
      builder: (controller) => HandlingStates(
        status: controller.categotyStatusReq,
        widget: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: ListView(children: const [
            HomeAppBar(),
            SizedBox(height: 10),
            EventsCard(),
            ListCategories(),
            TitleInHome(title: 'Product for you'),
            ProductsForYou(),
          ]),
        ),
      ),
    );
  }
}
