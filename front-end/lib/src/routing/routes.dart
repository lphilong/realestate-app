import 'package:get/get.dart';
import '../bindings/login_binding.dart';
import '../bindings/register_binding.dart';
import '../bindings/search_binding.dart';
import '../common_widgets/application.dart';
import '../features/auth/screens/auth.dart';
import '../features/auth/screens/login.dart';
import '../features/auth/screens/register.dart';
import '../features/home/models/properties_model.dart';
import '../features/message/screens/contact_screen.dart';
import '../features/message/screens/messages.dart';
import '../features/search/screens/no_result.dart';
import '../features/search/screens/result.dart';
import '../features/search/screens/search_screen.dart';

Props? prop;

class AppRoutes {
  static const auth = Routes.auth;
  static const search = Routes.search;
  static const login = Routes.login;
  static const register = Routes.register;
  static const home = Routes.home;
  static const result = Routes.result;
  static const noResult = Routes.noResult;
  static const mess = Routes.mess;
  static const contact = Routes.contact;

  static final routes = [
    GetPage(name: Routes.auth, page: () => const AuthenticationScreen()),
    GetPage(
        name: Routes.search,
        page: () => const SearchScreen(),
        binding: SearchBiding()),
    GetPage(
        name: Routes.login, page: () => const Login(), binding: LoginBiding()),
    GetPage(
        name: Routes.register,
        page: () => const Register(),
        binding: RegisterBinding()),
    GetPage(name: Routes.home, page: () => const MainPage()),
    GetPage(name: Routes.result, page: () => const ResultScreen()),
    GetPage(name: Routes.noResult, page: () => const NoResultScreen()),
    GetPage(name: Routes.mess, page: () => const MessageScreen()),
    GetPage(name: Routes.contact, page: () => const ContactScreen()),
  ];
}

class Routes {
  static const auth = '/auth';
  static const search = '/search';
  static const login = '/login';
  static const register = '/register';
  static const home = '/home';
  static const result = '/result';
  static const noResult = '/404';
  static const mess = '/mess';
  static const contact = '/contact';
}
