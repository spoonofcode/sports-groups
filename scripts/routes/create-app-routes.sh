#!/usr/bin/env bash

# define the template.
cat  << EOF
abstract class Routes {
  static const LOGIN = _Paths.LOGIN;
  static const MAIN = _Paths.MAIN;
  static const HOME = _Paths.MAIN + _Paths.HOME;
}

abstract class _Paths {
  static const LOGIN = '/login';
  static const MAIN = '/main';
  static const HOME = '/home';
}
EOF