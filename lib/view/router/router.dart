import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:muzammil_hussain/view/pages/experience/experience_page.dart';
import 'package:muzammil_hussain/view/router/route_transition.dart';
import '../pages/about/about_page.dart';
import '../pages/contact/contact_page.dart';
import '../pages/home/home_page.dart';
import '../pages/works/works_page.dart';
import 'routes.dart';

final router = GoRouter(
  initialLocation: Routes.home,
  routes: [
    GoRoute(
      path: Routes.home,
      pageBuilder: (context, state) => _buildPageWithDefaultTransition(
        context: context,
        state: state,
        child: HomePage(),
      ),
    ),
    GoRoute(
      path: Routes.contact,
      pageBuilder: (context, state) => _buildPageWithDefaultTransition(
        context: context,
        state: state,
        child: ContactPage(),
      ),
    ),
    GoRoute(
      path: Routes.about,
      pageBuilder: (context, state) => _buildPageWithDefaultTransition(
        context: context,
        state: state,
        child: AboutPage(),
      ),
    ),
    GoRoute(
      path: Routes.works,
      pageBuilder: (context, state) => _buildPageWithDefaultTransition(
        context: context,
        state: state,
        child: WorksPage(),
      ),
    ),
    GoRoute(
      path: Routes.experience,
      pageBuilder: (context, state) => _buildPageWithDefaultTransition(
        context: context,
        state: state,
        child: ExperiencePage(),
      ),
    ),
  ],
);

CustomTransitionPage _buildPageWithDefaultTransition<T>({
  required BuildContext context,
  required GoRouterState state,
  required Widget child,
}) {
  return SlideTransitionPage(
    child: child,
    position: SlidePosition.left,
  );
}
