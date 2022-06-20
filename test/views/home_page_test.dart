import 'package:awesome_app/controllers/list_image/list_image_bloc.dart';
import 'package:awesome_app/models/image_model.dart';
import 'package:awesome_app/views/home_page.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../dummy_data/dummy_object.dart';

class MockListImageBloc extends MockBloc<ListImageEvent, ListImageState>
    implements ListImageBloc {}

class ListImageEventFake extends Fake implements ListImageEvent {}

class ListImageStateFake extends Fake implements ListImageState {}

void main() {
  late MockListImageBloc mockPopularMoviesBloc;

  setUpAll(() {
    registerFallbackValue(ListImageEventFake());
    registerFallbackValue(ListImageStateFake());
  });

  setUp(() {
    mockPopularMoviesBloc = MockListImageBloc();
  });

  Widget _makeTestableWidget(Widget body) {
    return BlocProvider<ListImageBloc>.value(
      value: mockPopularMoviesBloc,
      child: MaterialApp(
        home: body,
      ),
    );
  }

  group('Home Page:', () {
    testWidgets('page should nothing when empty', (WidgetTester tester) async {
      when(() => mockPopularMoviesBloc.state).thenReturn(ListImageInitial());
      await tester.pumpWidget(_makeTestableWidget(const HomePage()));

      final progressBarFinder = find.byType(CircularProgressIndicator);
      expect(progressBarFinder, findsNothing);
    });

      testWidgets('page should display center progress bar when loading',
        (WidgetTester tester) async {
      when(() => mockPopularMoviesBloc.state)
          .thenReturn(ListImageLoading());
      await tester.pumpWidget(_makeTestableWidget(const HomePage()));

      final progressBarFinder = find.byType(CircularProgressIndicator);
      final centerFinder = find.byType(Center);

      expect(centerFinder, findsOneWidget);
      expect(progressBarFinder, findsOneWidget);
    });

    testWidgets('page should display ListView when data is loaded',
        (WidgetTester tester) async {
      when(() => mockPopularMoviesBloc.state)
          .thenReturn(ListImageSuccess(false, false, images: testImageList));

      await tester.pumpWidget(_makeTestableWidget(const HomePage()));

      final listViewFinder = find.byType(ListView);
      expect(listViewFinder, findsOneWidget);
    });

    testWidgets('page should display text with message when Error',
        (WidgetTester tester) async {
      when(() => mockPopularMoviesBloc.state)
          .thenReturn(const ListImageError('Error'));

      await tester.pumpWidget(_makeTestableWidget(const HomePage()));

      final textFinder = find.byKey(const Key('error_widgets'));
      expect(textFinder, findsOneWidget);
    });
  });
}
