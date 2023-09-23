// ignore_for_file: prefer_typing_uninitialized_variables

import 'package:flutter/material.dart';

class SettingList extends StatelessWidget {
  final dynamic iconasset;
  final String settingsTitle;
  final bool? isSuffixIcon;
  final Function()? onTap;
  final iconButton;

  const SettingList(
      {super.key,
      this.iconasset,
      required this.settingsTitle,
      this.isSuffixIcon,
      this.onTap,
      this.iconButton});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 20),
      child: SizedBox(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 18, right: 18),
              child: InkWell(
                onTap: onTap,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        const SizedBox(
                          width: 10.5,
                        ),
                        Text(
                          settingsTitle,
                        )
                      ],
                    ),
                    isSuffixIcon == null
                        ? const Icon(
                            Icons.arrow_forward_ios,
                          )
                        : isSuffixIcon == true
                            ? iconButton
                            : const SizedBox.shrink()
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 8,
            ),
            const Divider(
              thickness: 1.5,
              color: Color(0xffC6C6C6),
            )
          ],
        ),
      ),
    );
  }
}
