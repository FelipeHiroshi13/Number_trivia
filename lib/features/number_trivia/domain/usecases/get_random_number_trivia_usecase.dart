import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:number_trivia/core/error/failures.dart';
import 'package:number_trivia/core/usecases/usecase.dart';
import 'package:number_trivia/features/number_trivia/domain/entities/number_trivia_entity.dart';
import 'package:number_trivia/features/number_trivia/domain/usecases/get_concrete_number_trivia_usecase.dart';

import '../repositories/number_trivia_respository.dart';

class GetRandomNumberTriviaUseCase
    implements UseCase<NumberTriviaEntity, NoParams> {
  final NumberTriviaRepository repository;

  GetRandomNumberTriviaUseCase({
    required this.repository,
  });

  @override
  Future<Either<Failure, NumberTriviaEntity>?> call(NoParams params) async {
    return await repository.getRandomNumberTrivia();
  }
}
