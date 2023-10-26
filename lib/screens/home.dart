// ignore_for_file: unnecessary_const

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:resumebuilder/constants/colors.dart';
import 'package:resumebuilder/constants/routes.dart';
import 'package:resumebuilder/constants/textstyle.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "ResumeHub",
          style: AppText.title,
        ),
      ),
      body: Column(
        children: [
          SizedBox(
            height: 20.h,
          ),
          Text(
            "Your No 1 career boost ",
            style: AppText.greySubtitle,
          ),
          SizedBox(
            height: 12.h,
          ),
          Expanded(
            child: GridView(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2),
              children: [
                InkWell(
                  onTap: () {
                    Navigator.of(context).pushNamed(Routes.chooseProfile);
                  },
                  child: Card(
                    color: AppColors.primary,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.create,
                          size: 48,
                          color: AppColors.secondary,
                        ),
                        Text(
                          "Create",
                          style: AppText.subtitle,
                        ),
                      ],
                    ),
                  ),
                ),
                InkWell(
                  onTap: () {
                    Navigator.of(context).pushNamed(Routes.downloadedCv);
                  },
                  child: Card(
                    color: AppColors.primary,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.download,
                          size: 48,
                          color: AppColors.secondary,
                        ),
                        Text(
                          "Downloads",
                          style: AppText.subtitle,
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
