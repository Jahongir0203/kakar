import 'package:audioplayers/audioplayers.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:kakar/pages/log_in.dart';
import 'package:kakar/utilies/app_png.dart';

class onBoarding extends StatefulWidget {
  const onBoarding({Key? key}) : super(key: key);

  @override
  State<onBoarding> createState() => _onBoardingState();
}

class _onBoardingState extends State<onBoarding> {

  PageController controller=PageController();

  AudioPlayer player=AudioPlayer();
  String audio='mp3/onTap.wav';
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: controller,
        onPageChanged: (index){
         setState(() {
           currentIndex=index;


         });
        },
        scrollDirection: Axis.horizontal,
        physics: const BouncingScrollPhysics(),
        children: [
          buildPageViewItem(
            image: AppPng.firstPng,
            text1: 'Lorem Ipsum is simply dummy',
            text2:
            'Lorem Ipsum is simply dummy text of the printing and typesetting industry',
          ),
          buildPageViewItem(
            image: AppPng.secondPng,
            text1: "Lorem Ipsum is simply dummy",
            text2:
            'Lorem Ipsum is simply dummy text of the printing and typesetting industry.',
          ),
          buildPageViewItem(
            image: AppPng.thirdPng,
            text1: 'Lorem Ipsum is simply dummy',
            text2:
            "Lorem Ipsum is simply dummy text of the printing and typesetting industry.",
          ),
        ],
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 40),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            DotsIndicator(
              position:currentIndex.toDouble(),
              dotsCount:3,
              axis: Axis.horizontal,
              decorator: const DotsDecorator(
                activeColor: Colors.blue,
                activeSize: Size(12, 12),
              ),
            ),
            Row(
              children: [
                (currentIndex > 0)
                    ? TextButton(
                        onPressed: () {
                          player.play(AssetSource(audio));
                          setState(() {
                            currentIndex--;
                          });
                          controller.jumpToPage(currentIndex);

                        },
                        child: const Text(
                          "Back",
                          style: TextStyle(
                              fontWeight: FontWeight.w600,
                              fontSize: 16,
                              color: Colors.grey),
                        ))
                    : Container(
                        height: 5,
                        width: 5,
                      ),
                Container(
                  height: 50,
                  width: 132,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(6),
                    color: Colors.blue,
                  ),
                  child: TextButton(
                      onPressed: () {
                        player.play(AssetSource(audio));

                        setState(() {
                          if (currentIndex ==2) {
                            Navigator.pushReplacement(context,MaterialPageRoute(builder: (context)=>const LogIn(),),);
                          } else {
                            currentIndex++;
                          }
                        });
                        controller.jumpToPage(currentIndex);
                      },
                      child: (currentIndex ==2)
                          ? const Text(
                              'Get Started',
                              style: TextStyle(
                                  fontWeight: FontWeight.w600,
                                  fontSize: 16,
                                  color: Colors.white),
                            )
                          : const Text(
                              "Next",
                              style: TextStyle(
                                  fontWeight: FontWeight.w600,
                                  fontSize: 16,
                                  color: Colors.white),
                            )),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class buildPageViewItem extends StatelessWidget {
  buildPageViewItem({
    super.key,
    required this.image,
    required this.text1,
    required this.text2,
  });

  late String image;
  late String text1;
  late String text2;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Image.asset(image),
        Padding(
          padding: const EdgeInsets.only(top: 24, left: 24, right: 86),
          child: Text(
            text1,
            style: const TextStyle(
              color: Colors.black,
              fontSize: 24,
              fontWeight: FontWeight.w700,
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 24, right: 86),
          child: Text(text2,
              style: const TextStyle(
                color: Colors.black,
                fontSize: 16,
                fontWeight: FontWeight.w400,
              )),
        ),
      ],
    );
  }
}
