// lib/services/quiz_service.dart
import '../models/question.dart';

class QuizService {
  final List<Question> _questions = [
    Question(questionText: 'Is the sky blue?', answer: true),
    Question(questionText: 'Is the earth flat?', answer: false),
    Question(questionText: 'Does water boil at 100 degrees Celsius?', answer: true),
    Question(questionText: 'Is the capital of France Berlin?', answer: false),
    Question(questionText: 'Do cats bark?', answer: false),
    Question(questionText: 'Is 2 + 2 equal to 4?', answer: true),
    Question(questionText: 'Is the sun a star?', answer: true),
    Question(questionText: 'Is the Great Wall of China visible from space?', answer: false),
    Question(questionText: 'Is Python a programming language?', answer: true),
    Question(questionText: 'Can humans breathe underwater without equipment?', answer: false),
  ];

  List<Question> get questions => _questions;
}
