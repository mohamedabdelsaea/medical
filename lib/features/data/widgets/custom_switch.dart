import 'package:flutter/material.dart';
import 'package:medical/core/theme/app_color.dart';

class CustomSwitch extends StatefulWidget {
  const CustomSwitch({
    super.key,
    required this.title,
  });

  final String title;

  @override
  State<CustomSwitch> createState() => _CustomSwitchState();
}

class _CustomSwitchState extends State<CustomSwitch> {
  bool isOn = false;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            widget.title,
            style: const TextStyle(fontSize: 20,fontWeight: FontWeight.w500),
          ),
          GestureDetector(
            onTap: () {
              setState(() {
                isOn = !isOn;
              });
            },
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 200),
              width: 52,
              height: 28,
              padding: const EdgeInsets.all(3),
              decoration: BoxDecoration(
                color: isOn ? AppColor.primary : Colors.grey,
                borderRadius: BorderRadius.circular(20),
              ),
              child: AnimatedAlign(
                duration: const Duration(milliseconds: 200),
                alignment:
                isOn ? Alignment.centerRight : Alignment.centerLeft,
                child: Container(
                  width: 22,
                  height: 22,
                  decoration: const BoxDecoration(
                    color: AppColor.white,
                    shape: BoxShape.circle,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}