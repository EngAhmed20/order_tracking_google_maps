import 'package:flutter/material.dart';


void customSnackBar({
  required BuildContext context,
  required String msg,
  IconData? iconMsg,
  Color? iconColor
}) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Flexible(
            child: Text(
              msg,
              style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
              textAlign: TextAlign.center,
              overflow: TextOverflow.ellipsis, //
              maxLines: 2, //
            ),
          ),
          const SizedBox(width: 10),
          Icon(
            iconMsg ?? Icons.error_outlined,
            color: iconColor ?? Colors.red,
            size: 25,
          ),
        ],
      ),
      margin: const EdgeInsets.all(2),
      behavior: SnackBarBehavior.floating,
      duration: const Duration(seconds: 2),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(5),
      ),
      elevation: 10,
      backgroundColor: Colors.black,
    ),
  );
}
