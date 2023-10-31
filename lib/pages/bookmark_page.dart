import 'package:flutter/material.dart';
import 'package:kakar/utils/widget.dart';

import '../utilies/app_png.dart';

class BookMarkPage extends StatefulWidget {
  const BookMarkPage({Key? key}) : super(key: key);

  @override
  State<BookMarkPage> createState() => _BookMarkPageState();
}

class _BookMarkPageState extends State<BookMarkPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            const SizedBox(
              height: 24,
            ),
            const Padding(
              padding: EdgeInsets.only(top: 24),
              child: Text(
                'Bookmark',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 32,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 16),
              child: Container(
                height: 48,
                child: TextField(
                  decoration: InputDecoration(
                    hintText: 'Search',
                    hintStyle: const TextStyle(
                      color: Colors.grey,
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                    ),
                    prefixIcon: const Icon(
                      Icons.search,
                      size: 24,
                    ),
                    suffixIcon: IconButton(
                      onPressed: () {},
                      icon: Image.asset(
                        AppPng.settingIcon,
                        height: 20,
                        width: 20,
                      ),
                    ),
                    border: OutlineInputBorder(
                      borderSide: const BorderSide(color: Colors.black),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: const BorderSide(color: Colors.black),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: const BorderSide(color: Colors.black),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    disabledBorder: OutlineInputBorder(
                      borderSide: const BorderSide(color: Colors.black),
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),
              ),
            ),
            buildNewsContainer(
                image: AppPng.uKrPng,
                text1: 'Europe',
                text2:
                    "Ukraine's President Zelensky to\nBBC: Blood money being paid..."),
            buildNewsContainer(
              image: AppPng.boatPng,
                text1: 'Travel',
                text2:
                    "Her train broke down. Her phone\ndied. And then she met her..."),

                buildNewsContainer(
                    image: AppPng.boatPng,
                    text1: 'Travel',
                    text2:
                    "Her train broke down. Her phone\ndied. And then she met her..."),
          ]),
        ),
      ),
    );
  }
}
