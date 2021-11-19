import 'package:flutter/material.dart';
import 'package:xyx_vendor/common/app_colors.dart';

class AppScaffold extends StatelessWidget {
  final Widget child;
  final PreferredSizeWidget? appBar;
  final Color color;
  final bool progress;

  const AppScaffold(
      {Key? key,
      required this.child,
      this.appBar,
      this.color = Colors.white,
      this.progress = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: color,
        appBar: appBar,
        body: Stack(
          children: [
            child,
            Visibility(
              visible: progress,
              maintainState: true,
              child: Container(
                width: double.infinity,
                height: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.black.withOpacity(.6),
                ),
                child: Center(
                  child: Container(
                    width: 30,
                    height: 30,
                    child: CircularProgressIndicator(
                      color: AppColors.white,
                      strokeWidth: 3,
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
