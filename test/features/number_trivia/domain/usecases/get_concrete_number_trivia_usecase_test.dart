import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:number_trivia/features/number_trivia/domain/entities/number_trivia_entity.dart';
import 'package:number_trivia/features/number_trivia/domain/repositories/number_trivia_respository.dart';
import 'package:number_trivia/features/number_trivia/domain/usecases/get_concrete_number_trivia_usecase.dart';

class MockNumberTriviaRepository extends Mock
    implements NumberTriviaRepository {}

void main() {
  GetConcreteNumberTriviaUseCase? usecase;
  MockNumberTriviaRepository? mockNumberTriviaRepository;

  setUp(() {
    mockNumberTriviaRepository = MockNumberTriviaRepository();
    usecase =
        GetConcreteNumberTriviaUseCase(repository: mockNumberTriviaRepository!);
  });

  const tNumber = 1;
  final tNumberTrivia = NumberTriviaEntity(text: 'teste', number: 1);

  test('Should get trivia for the number from the repository', () async {
    when(mockNumberTriviaRepository!.getConcreteNumberTrivia(any))
        .thenAnswer((_) async => Right(tNumberTrivia));

    final result = await usecase!.execute(number: tNumber);

    expect(result, Right(tNumberTrivia));
    verify(mockNumberTriviaRepository!.getConcreteNumberTrivia(tNumber));
    verifyNoMoreInteractions(mockNumberTriviaRepository);
  });
}
