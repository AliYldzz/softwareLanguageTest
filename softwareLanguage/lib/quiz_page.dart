import 'package:flutter/material.dart';

class QuizPage extends StatefulWidget {
  final String subject;

  QuizPage({required this.subject});

  @override
  _QuizPageState createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  int _currentQuestionIndex = 0;
  int _score = 0;

  List<Map<String, Object>> get _questions {
    if (widget.subject == 'Java') {
      return _javaQuestions;
    } else if (widget.subject == 'Python') {
      return _pythonQuestions;
    } else {
      return _cQuestions;
    }
  }

  final List<Map<String, Object>> _javaQuestions = [
    {
      'questionText': 'What is Java?',
      'answers': [
        {'text': 'Programming Language', 'score': 1},
        {'text': 'Coffee', 'score': 0},
        {'text': 'Animal', 'score': 0},
        {'text': 'Country', 'score': 0},
      ],
    },
    {
      'questionText': 'Who developed Java?',
      'answers': [
        {'text': 'James Gosling', 'score': 1},
        {'text': 'Guido van Rossum', 'score': 0},
        {'text': 'Dennis Ritchie', 'score': 0},
        {'text': 'Bjarne Stroustrup', 'score': 0},
      ],
    },
    {
      'questionText': 'Java is ...',
      'answers': [
        {'text': 'Object-Oriented', 'score': 1},
        {'text': 'Procedural', 'score': 0},
        {'text': 'Functional', 'score': 0},
        {'text': 'Logical', 'score': 0},
      ],
    },
  ];

  final List<Map<String, Object>> _pythonQuestions = [
    {
      'questionText': 'What is Python?',
      'answers': [
        {'text': 'Programming Language', 'score': 1},
        {'text': 'Snake', 'score': 0},
        {'text': 'Car', 'score': 0},
        {'text': 'Food', 'score': 0},
      ],
    },
    {
      'questionText': 'Who developed Python?',
      'answers': [
        {'text': 'Guido van Rossum', 'score': 1},
        {'text': 'James Gosling', 'score': 0},
        {'text': 'Dennis Ritchie', 'score': 0},
        {'text': 'Bjarne Stroustrup', 'score': 0},
      ],
    },
    {
      'questionText': 'Python is ...',
      'answers': [
        {'text': 'Interpreted', 'score': 1},
        {'text': 'Compiled', 'score': 0},
        {'text': 'Both', 'score': 0},
        {'text': 'None', 'score': 0},
      ],
    },
  ];

  final List<Map<String, Object>> _cQuestions = [
    {
      'questionText': 'What is C?',
      'answers': [
        {'text': 'Programming Language', 'score': 1},
        {'text': 'Letter', 'score': 0},
        {'text': 'Music Note', 'score': 0},
        {'text': 'Movie Rating', 'score': 0},
      ],
    },
    {
      'questionText': 'Who developed C?',
      'answers': [
        {'text': 'Dennis Ritchie', 'score': 1},
        {'text': 'Guido van Rossum', 'score': 0},
        {'text': 'James Gosling', 'score': 0},
        {'text': 'Bjarne Stroustrup', 'score': 0},
      ],
    },
    {
      'questionText': 'C is ...',
      'answers': [
        {'text': 'Procedural', 'score': 1},
        {'text': 'Object-Oriented', 'score': 0},
        {'text': 'Functional', 'score': 0},
        {'text': 'Logical', 'score': 0},
      ],
    },
  ];

  void _answerQuestion(int score) {
    setState(() {
      _score += score;
      _currentQuestionIndex++;
    });

    if (_currentQuestionIndex < _questions.length) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(score > 0 ? 'Harika!' : 'Yanlış cevap'),
          backgroundColor: score > 0 ? Colors.green : Colors.red,
          duration: Duration(seconds: 1),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('${widget.subject} Quiz'),
        centerTitle: true,
        backgroundColor: Colors.blueAccent,
        elevation: 0,
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.blueAccent, Colors.lightBlueAccent],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        padding: const EdgeInsets.all(16.0),
        child: _currentQuestionIndex < _questions.length
            ? Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  LinearProgressIndicator(
                    value: (_currentQuestionIndex + 1) / _questions.length,
                    backgroundColor: Colors.white,
                    valueColor: AlwaysStoppedAnimation<Color>(Colors.green),
                  ),
                  SizedBox(height: 20),
                  Text(
                    _questions[_currentQuestionIndex]['questionText'] as String,
                    style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: Colors.white),
                  ),
                  SizedBox(height: 20),
                  ...(_questions[_currentQuestionIndex]['answers']
                          as List<Map<String, Object>>)
                      .map((answer) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8.0),
                      child: ElevatedButton(
                        onPressed: () => _answerQuestion(answer['score'] as int),
                        style: ElevatedButton.styleFrom(
                          primary: Colors.white,
                          onPrimary: Colors.blueAccent,
                          textStyle: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                          elevation: 5,
                          shadowColor: Colors.black54,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15),
                          ),
                        ),
                        child: Text(
                          answer['text'] as String,
                          textAlign: TextAlign.center,
                        ),
                      ),
                    );
                  }).toList()
                ],
              )
            : Center(
                child: Text(
                  'Quiz tamamlandı!\nSkorunuz: $_score/${_questions.length}',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.white),
                ),
              ),
      ),
    );
  }
}
