enum AppStatus {
  initial,
  changingLanguage,
  changeLanguageSuccess,
  changeLanguageFail,
}

enum LoadingStatus {
  show,
  hide,
}

class AppState {
  const AppState({
    this.language = 'en',
    this.status = AppStatus.initial,
    this.loadingStatus,
  });

  final String language;
  final AppStatus status;
  final LoadingStatus? loadingStatus;

  AppState copyWith({
    String? language,
    AppStatus? status,
    LoadingStatus? loadingStatus,
  }) {
    return AppState(
      language: language ?? this.language,
      status: status ?? this.status,
      loadingStatus: loadingStatus ?? this.loadingStatus,
    );
  }

  static const AppState initState = AppState();
}
