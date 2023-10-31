import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:kakar/utilies/app_png.dart';
import 'package:kakar/utilies/app_svg.dart';

import '../utils/widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int currentIndex = 0;
  List<String> list = [
    'All',
    'Sports',
    'Politics',
    'Business',
    'Health',
    'Travel',
    'Science'
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        titleSpacing: 0,
        elevation: 0,
        backgroundColor: Colors.white,
        title: Padding(
          padding: const EdgeInsets.only(left: 24),
          child: SvgPicture.asset(
            AppSvg.svgSplash,
            height: 30,
            width: 100,
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 7),
            child: Container(
              height: 32,
              width: 32,
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(6),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.1),
                      blurRadius: 10,
                    ),
                  ]),
              child: Image.asset(AppPng.noteIcon),
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 24,
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
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
              Column(
                children: [
                  buildSeeAll('Trending'),
                  buildTrendingContainer(),
                  buildSeeAll('Latest'),
                  SizedBox(
                    height: 50,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: list.length,
                      itemBuilder: (BuildContext context, int index) {
                        return TextButton(
                          onPressed: () {
                            setState(() {
                              currentIndex = index;
                            });
                          },
                          child: Text(
                            list[index],
                            style: TextStyle(
                              color: currentIndex == index
                                  ? Colors.black
                                  : Colors.grey,
                              fontSize: 16,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                  buildNewsContainer(
                    image: AppPng.uKrPng,
                    text1: 'Europe',
                    text2:
                        "Ukraine's President Zelensky to\nBBC: Blood money being paid...",
                  ),
                  buildNewsContainer(
                      image: AppPng.uKrPng,
                      text1: 'Travel',
                      text2:
                          "Her train broke down. Her phone\ndied. And then she met her...,"),
                  buildNewsContainer(
                    image: AppPng.uKrPng,
                    text1: 'Europe',
                    text2:
                        "Ukraine's President Zelensky to\nBBC: Blood money being paid...",
                  ),
                  buildNewsContainer(
                      image: AppPng.uKrPng,
                      text1: 'Travel',
                      text2:
                          "Her train broke down. Her phone\ndied. And then she met her...,"),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Row buildSeeAll(String text1) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          text1,
          style: const TextStyle(
            color: Colors.black,
            fontSize: 16,
            fontWeight: FontWeight.w600,
          ),
        ),
        TextButton(
          onPressed: () {},
          child: const Text(
            'See All',
            style: TextStyle(
              color: Colors.grey,
              fontSize: 14,
              fontWeight: FontWeight.w400,
            ),
          ),
        ),
      ],
    );
  }

  Padding buildTrendingContainer() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 183,
            decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.1),
                  offset: const Offset(8, 0),
                  blurRadius: 10,
                ),
              ],
              borderRadius: BorderRadius.circular(6),
              image: const DecorationImage(
                fit: BoxFit.fill,
                image: AssetImage(
                  AppPng.boatPng,
                ),
              ),
            ),
          ),
          const Padding(
            padding: EdgeInsets.only(top: 8),
            child: Text(
              'Europe',
              style: TextStyle(
                color: Colors.grey,
                fontSize: 14,
                fontWeight: FontWeight.w400,
              ),
            ),
          ),
          const Padding(
            padding: EdgeInsets.symmetric(vertical: 4),
            child: Text(
              'Russian warship: Moskva sinks in Black Sea',
              style: TextStyle(
                color: Colors.black,
                fontSize: 16,
                fontWeight: FontWeight.w400,
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Image.asset(
                      AppPng.bBcPng,
                      height: 20,
                      width: 20,
                    ),
                    const Text(
                      'BBC News',
                      style: TextStyle(
                        color: Colors.grey,
                        fontSize: 13,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const Icon(
                      Icons.timer,
                      color: Colors.grey,
                      size: 12,
                    ),
                    const Text(
                      '4h ago',
                      style: TextStyle(
                        color: Colors.grey,
                        fontSize: 13,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ],
                ),
              ),
              const Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(
                      '...',
                      style: TextStyle(
                        color: Colors.grey,
                        fontSize: 14,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

