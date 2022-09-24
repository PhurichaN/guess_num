import 'dart:math';

enum Result {
  tooHigh,
  tooLow,
  correct
}

class random_num {
  static const defaultMaxRandom = 100;
  int? answer;
  int _guessCount = 0;
  static final List<int> guessCountList = [];

  random_num({int maxRandom = defaultMaxRandom}) {
    var r = Random();
    answer = r.nextInt(maxRandom) + 1;
    print('The answer is $answer');
  }
  int? reAns(){
    return answer;
  }
  int get guessCount {
    return _guessCount;
  }

  void addCountList() {
    guessCountList.add(_guessCount);
  }

  Result doGuess(int num) {
    _guessCount++;
    if (num > answer!) {
      return Result.tooHigh;
    } else if (num < answer!) {
      return Result.tooLow;
    } else {
      return Result.correct;
    }
  }
}