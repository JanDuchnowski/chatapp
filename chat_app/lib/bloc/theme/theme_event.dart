part of 'theme_bloc.dart';

sealed class ThemeEvent extends Equatable {
  const ThemeEvent();

  @override
  List<Object> get props => [];
}

class InitialThemeEvent extends ThemeEvent {}

class ThemeChangeEvent extends ThemeEvent {
  const ThemeChangeEvent();

  @override
  List<Object> get props => [];
}

class CheckThemeEvent extends ThemeEvent {
  const CheckThemeEvent();

  @override
  List<Object> get props => [];
}

class SetThemeDarkEvent extends ThemeEvent {
  const SetThemeDarkEvent();

  @override
  List<Object> get props => [];
}

class SetThemeLightEvent extends ThemeEvent {
  const SetThemeLightEvent();

  @override
  List<Object> get props => [];
}
