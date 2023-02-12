// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

import 'package:number_trivia/core/error/failures.dart';
import 'package:number_trivia/core/usecases/usecase.dart';
import 'package:number_trivia/features/number_trivia/domain/entities/number_trivia_entity.dart';

import '../repositories/number_trivia_respository.dart';

class GetConcreteNumberTriviaUseCase
    implements UseCase<NumberTriviaEntity, Params> {
  final NumberTriviaRepository repository;

  GetConcreteNumberTriviaUseCase({
    required this.repository,
  });

  @override
  Future<Either<Failure, NumberTriviaEntity>?> call(Params params) async {
    return await repository.getConcreteNumberTrivia(params.number);
  }
}

class Params extends Equatable {
  final int number;

  Params({
    required this.number,
  });

  @override
  List<Object> get props => [number];
}
