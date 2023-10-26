import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:resumebuilder/constants/colors.dart';
import 'package:resumebuilder/constants/textstyle.dart';

class ChooseProfile extends StatelessWidget {
  const ChooseProfile({super.key});

  @override
  Widget build(BuildContext context) {
    // List items=[];
    return Scaffold(
        appBar: AppBar(
          title: Text(
            "Profiles",
            style: AppText.title,
          ),
        ),
        body: Column(
          children: [
            Expanded(
              child: ListView.builder(
                itemCount: 2,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ListTile(
                        onTap: () {},
                        splashColor: AppColors.secondary,
                        shape: Border.all(
                          color: AppColors.secondary,
                        ),
                        tileColor: AppColors.primary,
                        leading: CircleAvatar(
                          backgroundImage: CachedNetworkImageProvider(
                            "",
                          ),
                          backgroundColor: AppColors.secondary,
                        ),
                        title: Text(
                          "Name Name",
                          style: AppText.subtitle,
                        ),
                        trailing: InkWell(
                          customBorder: const CircleBorder(),
                          onTap: () {},
                          child: Icon(
                            Icons.more_vert_outlined,
                            color: AppColors.textColor,
                          ),
                        )),
                  );
                },
              ),
            ),
          ],
        ),
        floatingActionButton: FloatingActionButton.extended(
            backgroundColor: AppColors.primary,
            splashColor: AppColors.secondary,
            shape: RoundedRectangleBorder(
                side: BorderSide(color: AppColors.secondary, width: 4),
                borderRadius: BorderRadius.all(Radius.circular(10.r))),
            onPressed: () {},
            label: Text(
              "Create a Resume Profile",
              style: AppText.subtitle,
            )));
  }
}
