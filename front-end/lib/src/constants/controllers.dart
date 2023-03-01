import '../app_controller/controller.dart';
import '../features/auth/controllers/login_controller.dart';
import '../features/auth/controllers/register_controller.dart';
import '../features/home/controllers/home_controller.dart';
import '../features/message/controllers/message_controller.dart';
import '../features/search/controllers/search_controller.dart';

LoginController loginController = LoginController.instance;
RegisterController registerController = RegisterController.instance;
SearchController searchController = SearchController.instance;
HomeController homeController = HomeController.instance;
MessageController messageController = MessageController.instance;
AppController appController = AppController.instance;
