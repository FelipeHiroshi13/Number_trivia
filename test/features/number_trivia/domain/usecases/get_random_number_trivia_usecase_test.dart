import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:number_trivia/core/usecases/usecase.dart';
import 'package:number_trivia/features/number_trivia/domain/entities/number_trivia_entity.dart';
import 'package:number_trivia/features/number_trivia/domain/repositories/number_trivia_respository.dart';
import 'package:number_trivia/features/number_trivia/domain/usecases/get_random_number_trivia_usecase.dart';

class MockNumberTriviaRepository extends Mock
    implements NumberTriviaRepository {}

void main() {
  GetRandomNumberTriviaUseCase? usecase;
  MockNumberTriviaRepository? mockNumberTriviaRepository;

  setUp(() {
    mockNumberTriviaRepository = MockNumberTriviaRepository();
    usecase =
        GetRandomNumberTriviaUseCase(repository: mockNumberTriviaRepository!);
  });

  final tNumberTrivia = NumberTriviaEntity(text: 'teste', number: 1);

  test('Should get trivia for from the repository', () async {
    when(mockNumberTriviaRepository!.getRandomNumberTrivia())
        .thenAnswer((_) async => Right(tNumberTrivia));

    final result = await usecase!(NoParams());

    expect(result, Right(tNumberTrivia));
    verify(mockNumberTriviaRepository!.getRandomNumberTrivia());
    verifyNoMoreInteractions(mockNumberTriviaRepository);
  });
}
