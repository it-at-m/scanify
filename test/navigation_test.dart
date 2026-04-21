import 'package:flutter/material.dart';
import 'package:flutter_application/features/scan/bloc/scan_state.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:flutter_application/core/navigation/navigation_cubit.dart';
import 'package:flutter_application/features/scan/bloc/scan_cubit.dart';
import 'package:flutter_application/core/navigation/navigation_widget.dart';

class MockNavigationCubit extends MockCubit<AppTab>
    implements NavigationCubit {}

class MockScanCubit extends MockCubit<ScanState> implements ScanCubit {}

void main() {
  late MockNavigationCubit navigationCubit;
  late MockScanCubit scanCubit;

  setUp(() {
    navigationCubit = MockNavigationCubit();
    scanCubit = MockScanCubit();

    when(() => navigationCubit.state).thenReturn(AppTab.home);
  });

  testWidgets('NavigationWidget renders NavigationBar with all tabs', (
    WidgetTester tester,
  ) async {
    await tester.pumpWidget(
      MaterialApp(
        home: MultiBlocProvider(
          providers: [
            BlocProvider<NavigationCubit>.value(value: navigationCubit),
            BlocProvider<ScanCubit>.value(value: scanCubit),
          ],
          child: const NavigationWidget(
            pages: {
              AppTab.home: SizedBox(),
              AppTab.scan: SizedBox(),
              AppTab.history: SizedBox(),
              AppTab.export: SizedBox(),
            },
          ),
        ),
      ),
    );

    expect(find.byType(NavigationBar), findsOneWidget);
    expect(find.text('Home'), findsOneWidget);
    expect(find.text('Scan'), findsOneWidget);
    expect(find.text('History'), findsOneWidget);
    expect(find.text('Export'), findsOneWidget);
  });
}
