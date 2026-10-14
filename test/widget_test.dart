import 'package:donuts_app/app.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:user_repository/user_repository.dart';

class _FakeUserRepository implements UserRepository {
  @override
  Stream<MyUser> get user => Stream.value(MyUser.empty);

  @override
  Future<void> logOut() async {}

  @override
  Future<void> setUserData(MyUser user) async {}

  @override
  Future<void> signIn(String email, String password) async {}

  @override
  Future<MyUser> signUp(MyUser myUser, String password) async => myUser;
}

void main() {
  testWidgets('shows the welcome screen for unauthenticated users', (
    WidgetTester tester,
  ) async {
    await tester.pumpWidget(MainApp(_FakeUserRepository()));
    await tester.pumpAndSettle();

    expect(find.text('Sign In'), findsWidgets);
    expect(find.text('Sign Up'), findsWidgets);
  });
}
