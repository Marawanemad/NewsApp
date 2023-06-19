abstract class NewsStates {}

class IntialState extends NewsStates {}

class ChangeBottomNavState extends NewsStates {}

class ChangeBrightnessModeState extends NewsStates {}

class getBuisnessDataLoadingState extends NewsStates {}

class getBuisnessDataSuccessState extends NewsStates {}

class getBuisnessDataErrorState extends NewsStates {
  // to store this error if we want to use it later
  final String error;
  getBuisnessDataErrorState(this.error);
}

class getSportsDataSuccessState extends NewsStates {}

class getSportsDataLoadingState extends NewsStates {}

class getSportsDataErrorState extends NewsStates {
  // to store this error if we want to use it later
  final String error;
  getSportsDataErrorState(this.error);
}

class getScienceDataLoadingState extends NewsStates {}

class getScienceDataSuccessState extends NewsStates {}

class getScienceDataErrorState extends NewsStates {
  // to store this error if we want to use it later
  final String error;
  getScienceDataErrorState(this.error);
}

class getSearchDataLoadingState extends NewsStates {}

class getSearchDataSuccessState extends NewsStates {}

class getSearchDataErrorState extends NewsStates {
  // to store this error if we want to use it later
  final String error;
  getSearchDataErrorState(this.error);
}
