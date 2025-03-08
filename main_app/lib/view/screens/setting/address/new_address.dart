import 'package:online_shope_app/controller/setting/address/new_address_ctrl.dart';
import 'package:online_shope_app/core/functions/validatore.dart';
import 'package:online_shope_app/view/widgets/auth/button.dart';
import 'package:online_shope_app/view/widgets/auth/custum_field.dart';
import 'package:online_shope_app/view/widgets/onboarding/app_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class NewAddress extends StatelessWidget {
  const NewAddress({super.key});

  @override
  Widget build(BuildContext context) {
    NewAddressCtrl controller = Get.put(NewAddressCtrl());
    return Scaffold(
      appBar: const CustumAppBar(title: 'Add New Address'),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Form(
          key: controller.formkey,
          child: ListView(
            children: [
              const SizedBox(height: 20),
              CustumTextField(
                hint: 'set a name to this address',
                label: 'Name',
                icon: null,
                type: TextInputType.name,
                control: controller.name,
                valid: (p0) => validate(p0!, ''),
              ),
              CustumTextField(
                hint: 'your city',
                label: 'City',
                icon: null,
                type: TextInputType.name,
                control: controller.city,
                valid: (p0) => validate(p0!, ''),
              ),
              CustumTextField(
                hint: 'the street',
                label: 'Street',
                icon: null,
                type: TextInputType.name,
                control: controller.street,
                valid: (p0) => validate(p0!, ''),
              ),
              const SizedBox(height: 20),
              CustumButton(
                  text: 'Save',
                  ontap: () {
                    controller.onSave();
                  })
            ],
          ),
        ),
      ),
    );
  }
}
