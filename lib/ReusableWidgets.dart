import 'package:flutter/material.dart';

Container reusableTextField(String reqText, Icon icon, var controller){
  return Container(
    width: 324,
    child: Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Row(
          children: [
            SizedBox(width: 21),
            Text(
              reqText,
              style: TextStyle(
                color: Color(0xff4A4A4A),
                fontWeight: FontWeight.bold,
                fontSize: 15,
              ),
            ),
          ],
        ),
        Container(
          height: 64,
          child: Padding(
            padding: const EdgeInsets.all(4.0),
            child: TextField(
              controller: controller,
              decoration: InputDecoration(
                hintText: "Type here...",
                prefixIcon: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    SizedBox(width: 10),
                    icon,
                    SizedBox(width: 10),
                    Text(
                      "|",
                      style: TextStyle(
                        fontSize: 40,
                        fontWeight: FontWeight.w100,
                      ),
                    ),
                    SizedBox(width: 10),
                  ],
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(5),
                ),
              ),
            ),
          ),
        ),
      ],
    ),
  );
}