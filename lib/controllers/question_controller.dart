import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import 'package:quiz_app/models/questions.dart';
import 'package:quiz_app/screens/score/score_screen.dart';

class QuestionController extends GetxController
    with GetSingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation _animation;
  Animation get animation => _animation;

  late PageController _pageController;
  PageController get pageController => _pageController;

  final List<Question> _questions = sampleData
      .map(
        (question) => Question(
          id: question['id'],
          question: question['question'],
          options: question['options'],
          answer: question['answer_index'],
        ),
      )
      .toList();
  List<Question> get questions => _questions;

  bool _isAnswerd = false;
  bool get isAnswerd => _isAnswerd;

  late int _currectAns;
  int get currectAns => _currectAns;

  late int _selectAns;
  int get selectAns => _selectAns;

  RxInt _questionNumber = 1.obs;
  RxInt get questionNumber => _questionNumber;

  late int _numberOfCurrectAns = 0;
  int get numberOfCurrectAns => _numberOfCurrectAns;

  @override
  void onInit() {
    _animationController =
        AnimationController(duration: const Duration(seconds: 60), vsync: this);
    _animation = Tween(begin: 0.0, end: 1.0).animate(_animationController)
      ..addListener(
        () {
          update();
        },
      );

    _animationController.forward().whenComplete(nextQuestion);
    _pageController = PageController();
    super.onInit();
  }

  @override
  void onClose() {
    super.onClose();
    _animationController.dispose();
    pageController.dispose();
  }

  void checkAns(Question question, int SelectedIndex) {
    _isAnswerd = true;
    _currectAns = question.answer;
    _selectAns = SelectedIndex;

    if (_currectAns == _selectAns) _numberOfCurrectAns++;

    _animationController.stop();
    update();

    Future.delayed(const Duration(seconds: 3), () {
      nextQuestion();
    });
  }

  void nextQuestion() {
    if (_questionNumber.value != _questions.length) {
      _isAnswerd = false;
      _pageController.nextPage(
          duration: const Duration(seconds: 3), curve: Curves.ease);

      _animationController.reset();
      _animationController.forward().whenComplete(nextQuestion);
    }
    Get.to(const ScroeScreen());
  }

  void updateTheQnNum(int index) {
    _questionNumber.value = index + 1;
  }
}
