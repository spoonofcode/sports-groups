#!/usr/bin/env bash

# define the template.
cat  << EOF
abstract class Routes {
  static const LOGIN = _Paths.LOGIN;
  static const MAIN = _Paths.MAIN;
  static const HOME = _Paths.MAIN + _Paths.HOME;
  static const SEARCH = _Paths.MAIN + _Paths.SEARCH;
  static const SCHEDULE = _Paths.MAIN + _Paths.SCHEDULE;
  static const PROFILE = _Paths.MAIN + _Paths.PROFILE;
  static const NOTIFICATIONS = _Paths.MAIN + _Paths.NOTIFICATIONS;
  static const MESSAGES = _Paths.MAIN + _Paths.MESSAGES;
}

abstract class _Paths {
  static const LOGIN = '/login';
  static const MAIN = '/main';
  static const HOME = '/home';
  static const SEARCH = '/search';
  static const SCHEDULE = '/schedule';
  static const PROFILE = '/profile';
  static const NOTIFICATIONS = '/notifications';
  static const MESSAGES = '/messages';
}
EOF