// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';

class NumberTriviaEntity extends Equatable {
  final String text;
  final int number;

  NumberTriviaEntity({
    required this.text,
    required this.number,
  });

  @override
  List<Object> get props => [text, number];
}
