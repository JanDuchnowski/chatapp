import 'package:bloc/bloc.dart';
import 'package:chat_app/theme/theme.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

part 'theme_event.dart';
part 'theme_state.dart';

class ThemeBloc extends Bloc<ThemeEvent, ThemeState> {
  ThemeBloc() : super(ThemeState(AppTheme.darkTheme)) {
    on<ThemeChangeEvent>((event, emit) {
      state is DarkThemeState
          ? emit(LightThemeState(AppTheme.lightTheme))
          : emit(DarkThemeState(AppTheme.darkTheme));
    });

    on<SetThemeDarkEvent>((event, emit) {
      emit(DarkThemeState(AppTheme.darkTheme));
    });

    on<SetThemeLightEvent>((event, emit) {
      emit(LightThemeState(AppTheme.lightTheme));
    });

    on<CheckThemeEvent>(
      (event, emit) {
        emit(LightThemeState(AppTheme.lightTheme));
      },
    );
  }
}
