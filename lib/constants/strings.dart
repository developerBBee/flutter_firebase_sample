import 'package:uuid/uuid.dart';

const String appTitle = "Flutter Application Test";

const String signupTitle = "新規登録";
const String signupEmailHint = "メールアドレス";
const String signupText = "新規登録を行う";

const String loginTitle = "ログイン";
const String loginEmailHint = "メールアドレス";
const String loginText = "ログインする";

const String accountTitle = "アカウント";

const String logoutTitle = "ログアウト";
const String logoutText = "ログアウト";

const String themeTitle = "テーマ";

const String aliceName = "Alice";

const String usersFieldKey = "users";

const String message = "ユーザーが作成できました";

const String loadingText = "読み込み中...";

// BottomNavigationBar
const String homeTitle = "ホーム";
const String searchTitle = "検索";
const String profileTitle = "プロフィール";

// UUID
String getUUID() {
  const Uuid uuid = Uuid();
  return uuid.v4();
}
String jpgUuidFileName = "${getUUID()}.jpg";

// ImagePicker
const String cropperTitle = "Cropper";

// Key names
const String isDarkThemeKey = "isDarkTheme";