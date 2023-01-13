import 'package:flutter/material.dart';
import 'package:flutter_application_41/tools/colorlor.dart';
import 'package:flutter_application_41/tools/textter.dart';
import 'package:flutter_application_41/utils/my_button.dart';

class DialogBax extends StatelessWidget {
  final controller;
  VoidCallback onSave;
  VoidCallback onCancel;
  DialogBax({
    Key? key,
    required this.controller,
    required this.onCancel,
    required this.onSave,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: AppColor.bggCAl,
      content: Container(
        height: 120,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            // get user input
            TextField(
              controller: controller,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                hintText: AppTexts.task,
              ),
            ),

            //  buttons -> save + cancel
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                // save button
                MyButton(text: AppTexts.Save, onPressed: onSave),
                const SizedBox(width: 8),

                // cancel button
                MyButton(text: AppTexts.Cancel, onPressed: onCancel),
              ],
            )
          ],
        ),
      ),
    );
  }
}
