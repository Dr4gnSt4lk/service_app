import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:service_app/mainwrapper.dart';
import 'package:service_app/screens/home/bookings.dart';
import 'package:service_app/screens/home/calendar.dart';
import 'package:service_app/screens/home/home.dart';
import 'package:service_app/screens/home/inbox.dart';
import 'package:service_app/screens/home/profile.dart';
import 'package:service_app/screens/login/login.dart';
import 'package:service_app/screens/login/register.dart';
import 'package:service_app/screens/login/select.dart';
import 'package:service_app/screens/splash/splashscreen.dart';

class AppNavigation {
  AppNavigation._();

  static String initR = '/splash';

  static final _rootNavigatorKey = GlobalKey<NavigatorState>();
  static final _rootNavigatorSplash =
      GlobalKey<NavigatorState>(debugLabel: 'shellSplash');
  static final _rootNavigatorLogin =
      GlobalKey<NavigatorState>(debugLabel: 'shellLogin');
  static final _rootNavigatorHome =
      GlobalKey<NavigatorState>(debugLabel: 'shellHome');
  static final _rootNavigatorBookings =
      GlobalKey<NavigatorState>(debugLabel: 'shellBookings');
  static final _rootNavigatorCalendar =
      GlobalKey<NavigatorState>(debugLabel: 'shellCalendar');
  static final _rootNavigatorInbox =
      GlobalKey<NavigatorState>(debugLabel: 'shellInbox');
  static final _rootNavigatorProfile =
      GlobalKey<NavigatorState>(debugLabel: 'shellProfile');

  static final GoRouter router = GoRouter(
      initialLocation: initR,
      navigatorKey: _rootNavigatorKey,
      routes: <RouteBase>[
        GoRoute(
          path: '/splash',
          name: 'Splash',
          builder: (context, state) {
            Future.delayed(Duration(seconds: 3)).then((_) {
              router.go('/select');
            });
            return SplashScreen(
              key: state.pageKey,
            );
          },
        ),
        GoRoute(
            path: '/select',
            name: 'Select',
            builder: (context, state) {
              return SelectPage(key: state.pageKey);
            },
            routes: [
              GoRoute(
                  path: 'login',
                  name: 'Login',
                  builder: (context, state) {
                    return LoginPage(key: state.pageKey);
                  },
                  routes: [
                    GoRoute(
                      path: 'register',
                      name: 'LoginRegister',
                      builder: (context, state) {
                        return RegisterPage(key: state.pageKey);
                      },
                    )
                  ]),
              GoRoute(
                path: 'register',
                name: 'Register',
                builder: (context, state) {
                  return RegisterPage(key: state.pageKey);
                },
              )
            ]),

        /*GoRoute(
          path: '/successreg',
          name: 'SuccessReg',
          builder: (context, state) {
            return SuccessfulRegister(key: state.pageKey);
          },
        ),*/

        StatefulShellRoute.indexedStack(
            builder: (context, state, navigationShell) {
              return MainWrapper(
                navigationShell: navigationShell,
              );
            },
            branches: <StatefulShellBranch>[
              StatefulShellBranch(navigatorKey: _rootNavigatorHome, routes: [
                GoRoute(
                  path: '/home',
                  name: 'Home',
                  builder: (context, state) {
                    return HomePage(
                      key: state.pageKey,
                    );
                  },
                )
              ]),
              StatefulShellBranch(
                  navigatorKey: _rootNavigatorBookings,
                  routes: [
                    GoRoute(
                      path: '/bookings',
                      name: 'Bookings',
                      builder: (context, state) {
                        return BookingsPage(
                          key: state.pageKey,
                        );
                      },
                    )
                  ]),
              StatefulShellBranch(
                  navigatorKey: _rootNavigatorCalendar,
                  routes: [
                    GoRoute(
                      path: '/calendar',
                      name: 'Calendar',
                      builder: (context, state) {
                        return CalendarPage(
                          key: state.pageKey,
                        );
                      },
                    )
                  ]),
              StatefulShellBranch(navigatorKey: _rootNavigatorInbox, routes: [
                GoRoute(
                  path: '/inbox',
                  name: 'Inbox',
                  builder: (context, state) {
                    return InboxPage(
                      key: state.pageKey,
                    );
                  },
                )
              ]),
              StatefulShellBranch(navigatorKey: _rootNavigatorProfile, routes: [
                GoRoute(
                  path: '/profile',
                  name: 'Profile',
                  builder: (context, state) {
                    return ProfilePage(
                      key: state.pageKey,
                    );
                  },
                )
              ]),
            ])
      ]);
}
