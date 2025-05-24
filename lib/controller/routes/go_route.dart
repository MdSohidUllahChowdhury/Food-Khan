import 'package:Food_Khan/view/page/home.dart';
import 'package:go_router/go_router.dart';

class MyRoute {
  GoRouter routing = GoRouter(
    routes: [
      
      GoRoute(
        path: '/',
        name: 'Home',
        builder: (context, state) { 
          return const Home();
        },
      ),
      
      GoRoute(
        path: '/',
        name: 'Home',
        builder: (context, state) {
          return const Home();
        },
      ),
      
      GoRoute(
        path: '/',
        name: 'Home',
        builder: (context, state) {
          return const Home();
        },
      ),

    ],
  );
}
