part of 'theme_bloc.dart';

class ThemeState extends Equatable {
  const ThemeState(this.theme);

  final ThemeData theme;

  @override
  List<Object> get props => [];
}

class DarkThemeState extends ThemeState {
  const DarkThemeState(super.theme);
}

class LightThemeState extends ThemeState {
  const LightThemeState(super.theme);
}
