// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:dartz/dartz.dart';
import 'package:number_trivia/core/error/failures.dart';
import 'package:number_trivia/features/number_trivia/domain/entities/number_trivia_entity.dart';

import '../repositories/number_trivia_respository.dart';
import 'package:meta/meta.dart';

class GetConcreteNumberTriviaUseCase {
  final NumberTriviaRepository repository;

  GetConcreteNumberTriviaUseCase({
    required this.repository,
  });

  Future<Either<Failure, NumberTriviaEntity>?> execute(
      {required int number}) async {
    return await repository.getConcreteNumberTrivia(number);
  }
}
