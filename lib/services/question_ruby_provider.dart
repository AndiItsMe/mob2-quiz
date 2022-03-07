import 'package:quiz/services/question_provider.dart';
import 'package:quiz/models/question.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class QuestionRubyProvider implements QuestionProvider {
  Future<Question> fetch() async {
    final response =
        await http.get(Uri.parse('http://10.0.2.2:4567/questions/next'));

    if (response.statusCode == 200) {
      final json = jsonDecode(response.body);
      return Question(json['caption'], json['answers'].cast<String>(),
          json['correct_answer_index'], json['hint']);
    } else {
      throw Exception(response.reasonPhrase!);
    }
  }
}
