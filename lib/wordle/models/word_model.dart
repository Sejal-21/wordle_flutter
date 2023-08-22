import 'package:equatable/equatable.dart';
import 'package:wordle_flutter/wordle/wordle.dart';

class Word extends Equatable {
  const Word ({ required this.letters});

  factory Word.fromString(String word) => 
  Word(letters: word.split('').map((e) => Letter(val: e)).toList());

  final List<Letter> letters;

  String get wordString => letters.map((e) => e.val).join();

  //when we want to add a letter to a word , we have to get it's index
  void addLetter(String val){
    final currentIndex = letters.indexWhere((e) => e.val.isEmpty); //this looks for the first empty index of the string
    if(currentIndex != -1){
      letters[currentIndex] = Letter(val: val);
    }
  }

  // for removing a letter we have to get the index of the most recent letter 
  // or you can say the last index that is not an empty string
  // then we set that letter in that position as an empty letter 
  void removeLetter() {
    final recentLetterIndex = letters.lastIndexWhere((e) => e.val.isNotEmpty);
    if (recentLetterIndex != -1){
      letters[recentLetterIndex] = Letter.empty();
    }
  }

  @override
  List<Object?> get props => [letters];
}