import 'package:go_router/go_router.dart';
import 'package:pokemon/features/home/ui/home_screen.dart';

enum AppRoutes {
  home,
}

final appRouter = GoRouter(
  routes: [
    GoRoute(
      path: '/',
      name: AppRoutes.home.name,
      builder: (context, state) {
        return const HomeScreen();
      },
    ),
  ],
);
