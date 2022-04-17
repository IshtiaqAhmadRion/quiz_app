import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:quiz_app/constants.dart';
import 'package:quiz_app/screens/quiz/quiz_screen.dart';
import 'package:websafe_svg/websafe_svg.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue,
      body: Stack(
        fit: StackFit.expand,
      
        children: [
          
          WebsafeSvg.asset("assets/icons/bg.svg", fit: BoxFit.fitWidth),
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: kDefaultPadding),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Spacer(flex: 2,),
                  Text(
                    "Let's Play Quiz",
                    style: Theme.of(context).textTheme.headline4!.copyWith(
                        color: Colors.white, fontWeight: FontWeight.bold),
                  ),
                  const Text(
                    "Enter Your Information Below",
                    style: TextStyle(color: Colors.white),
                  ),
                  const Spacer(),
                  const TextField(
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: Color(0xFF1C234F),
                      hintText: "Full Name",
                      hintStyle: TextStyle(color: Colors.white),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(12)),
                      ),
                    ),
                  ),
                  const Spacer(),
                  InkWell(
                    onTap: ()=>Get.to(const QuizScreen()),
                    child: Container(
                      width: double.infinity,
                      alignment: Alignment.center,
                      padding: const EdgeInsets.all(kDefaultPadding * .75),
                      decoration: const BoxDecoration(
                        gradient: kPrimaryGradient,
                        borderRadius: BorderRadius.all(Radius.circular(12)),
                      ),
                      child: const Text(
                        "Lets Start Quiz",
                        style: TextStyle(color: Colors.black,fontWeight:FontWeight.bold),
                        ),
                    ),
                  ),
                  const Spacer(flex: 2,),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
