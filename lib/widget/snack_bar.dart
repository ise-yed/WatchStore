import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:watch_store/component/text_style.dart';

class CustomSnackBar extends StatelessWidget {
  final String message;
  final String status;

  const CustomSnackBar({Key? key, required this.message, required this.status})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10.0),
            color:
                status == "error" ? Colors.red.shade100 : Colors.green.shade100,
            border: Border.all(
                color: status == "error" ? Colors.red : Colors.green)),
        child: Row(
          children: [
            Icon(
              status == "error"
                  ? CupertinoIcons.exclamationmark_circle
                  : CupertinoIcons.checkmark_alt_circle,
              color: status == "error" ? Colors.red : Colors.green,
              size: 28,
            ),
            Expanded(
                child: Text(message,
                    textAlign: TextAlign.right,
                    textDirection: TextDirection.rtl,
                    style: AppTextStyles.appBarText)),
          ],
        ),
      ),
    );
  }
}

void showCustomSnackBar(
    BuildContext context, String message, int duration, String status) {
  ScaffoldMessenger.of(context)
    ..clearSnackBars()
    ..showSnackBar(
      SnackBar(
        content: CustomSnackBar(message: message, status: status),
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        duration: Duration(seconds: duration),
        behavior: SnackBarBehavior.floating,
      ),
    );
}
