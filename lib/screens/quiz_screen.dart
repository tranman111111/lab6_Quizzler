// lib/screens/quiz_screen.dart
import 'package:flutter/material.dart';
import '../services/quiz_service.dart';
import '../models/question.dart';

class QuizScreen extends StatefulWidget {
  @override
  _QuizScreenState createState() => _QuizScreenState();
}

class _QuizScreenState extends State<QuizScreen> {
  final QuizService _quizService = QuizService();
  int _currentQuestionIndex = 0;
  int _score = 0; // Biến để theo dõi điểm số
  List<Icon> _scoreKeeper = []; // Danh sách biểu tượng để hiển thị điểm số

  void _checkAnswer(bool userAnswer) {
    final bool correctAnswer = _quizService.questions[_currentQuestionIndex].answer;

    setState(() {
      if (userAnswer == correctAnswer) {
        _score++; // Tăng điểm nếu trả lời đúng
        _scoreKeeper.add(Icon(Icons.check, color: Colors.green));
      } else {
        _scoreKeeper.add(Icon(Icons.close, color: Colors.red));
      }

      if (_currentQuestionIndex < _quizService.questions.length - 1) {
        _currentQuestionIndex++; // Chuyển đến câu hỏi tiếp theo
      } else {
        // Bạn có thể thêm logic để hiển thị kết quả ở đây
        _showScoreDialog();
      }
    });
  }

  void _showScoreDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Kết quả'),
          content: Text('Điểm của bạn: $_score/${_quizService.questions.length}'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
                setState(() {
                  _currentQuestionIndex = 0; // Đặt lại câu hỏi
                  _score = 0; // Đặt lại điểm số
                  _scoreKeeper = []; // Đặt lại danh sách điểm
                });
              },
              child: Text('Chơi lại'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final Question currentQuestion = _quizService.questions[_currentQuestionIndex];

    return Scaffold(
      appBar: AppBar(title: Text('Quizzler')),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: Padding(
              padding: EdgeInsets.all(16.0),
              child: Text(
                currentQuestion.questionText,
                style: TextStyle(fontSize: 24.0),
              ),
            ),
          ),
          ElevatedButton(
            onPressed: () => _checkAnswer(true),
            child: Text('True'),
          ),
          ElevatedButton(
            onPressed: () => _checkAnswer(false),
            child: Text('False'),
          ),
          Row(
            children: _scoreKeeper, // Hiển thị biểu tượng điểm
          ),
        ],
      ),
    );
  }
}
