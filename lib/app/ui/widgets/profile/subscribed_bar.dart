import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

import '../../../controller/main.dart';
import '../../theme/colors.dart';

class SubscriptionStatusBar extends StatelessWidget {
  SubscriptionStatusBar({super.key, this.status = false});

  final bool status;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        MainController.to.isSubscribed = !MainController.to.isSubscribed;
        print("SUBSCRIBED: ${MainController.to.isSubscribed}");
      },
      child: Obx(
        () => Container(
          height: 30,
          margin: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
          padding: EdgeInsets.symmetric(horizontal: 10),
          decoration: BoxDecoration(
            color: MainController.to.isSubscribed == true
                ? AppColors.black
                : AppColors.white,
            border: Border.all(color: AppColors.black),
            borderRadius: BorderRadius.circular(30),
          ),
          child: MainController.to.isSubscribed == true
              ? Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Icon(
                      FontAwesomeIcons.crown,
                      color: AppColors.amber,
                      size: 16,
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Text(
                      "Premium",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 12,
                        color: AppColors.white,
                      ),
                    ),
                  ],
                )
              : Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text(
                      "See plans",
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w500,
                        color: AppColors.black,
                      ),
                    ),
                  ],
                ),
        ),
      ),
    );
  }
}
