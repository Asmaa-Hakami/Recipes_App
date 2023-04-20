import 'package:flutter/material.dart';
import 'package:recipes_app/core/constants/constants.dart';
import 'package:recipes_app/core/constants/theme_constants.dart';

class MyAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final bool isFirst;
  const MyAppBar({super.key, required this.title, required this.isFirst});

  @override
  Size get preferredSize => const Size.fromHeight(100);

  @override
  Widget build(BuildContext context) {
    return PreferredSize(
      preferredSize: preferredSize,
      child: AppBar(
          leading: BackButton(
            color: isFirst
                ? Constants.mossGreen.shade50.withOpacity(0.05)
                : Constants.mossGreen,
          ),
          backgroundColor: Constants.mossGreen.shade50.withOpacity(0.05),
          elevation: 0,
          title: Text(
            title,
            style: AppStyle.titleGreen16,
          )),
    );
  }
}
