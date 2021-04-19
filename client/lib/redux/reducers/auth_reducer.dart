import 'package:fr_lenra_client/api/response_models/token_response.dart';
import 'package:fr_lenra_client/redux/actions/async_action.dart';
import 'package:fr_lenra_client/redux/actions/change_lost_password_action.dart';
import 'package:fr_lenra_client/redux/actions/change_password_action.dart';
import 'package:fr_lenra_client/redux/actions/login_action.dart';
import 'package:fr_lenra_client/redux/actions/logout_action.dart';
import 'package:fr_lenra_client/redux/actions/recovery_action.dart';
import 'package:fr_lenra_client/redux/actions/register_action.dart';
import 'package:fr_lenra_client/redux/actions/verify_code_action.dart';
import 'package:fr_lenra_client/redux/states/auth_state.dart';
import 'package:redux/redux.dart';

Reducer<AuthState> authStateReducer = combineReducers([
  TypedReducer<AuthState, RegisterAction>(handleRegisterAction),
  TypedReducer<AuthState, VerifyCodeAction>(handleSendCodeAction),
  TypedReducer<AuthState, LoginAction>(handleLoginAction),
  TypedReducer<AuthState, RecoveryAction>(handleSendLostPasswordCode),
  TypedReducer<AuthState, ChangeLostPasswordAction>(handleLostPasswordModification),
  TypedReducer<AuthState, ChangePasswordAction>(handlePasswordModification),
  TypedReducer<AuthState, LogoutAction>(handleRemoveTokenAfterLogoutAction),
  TypedReducer<AuthState, LogoutAction>(handleChangeStatusAfterLogoutAction),
  TypedReducer<AuthState, AsyncAction<TokenResponse>>(handleTokenResponse),
]);

AuthState handleTokenResponse(AuthState state, AsyncAction<TokenResponse> action) {
  if (action.isDone) {
    return state.copyWith(tokenResponse: action.data);
  }
  return state;
}

AuthState handleRemoveTokenAfterLogoutAction(AuthState state, LogoutAction action) {
  if (action.isDone) {
    return state.copyWith(
      tokenResponse: null,
    );
  }

  return state;
}

AuthState handleChangeStatusAfterLogoutAction(AuthState state, LogoutAction action) {
  return state.copyWith(
    logoutStatus: state.logoutStatus.reducer(action),
  );
}

AuthState handleLoginAction(AuthState state, LoginAction action) {
  return state.copyWith(
    loginStatus: state.loginStatus.reducer(action),
  );
}

AuthState handleRegisterAction(AuthState state, RegisterAction action) {
  return state.copyWith(
    registerStatus: state.registerStatus.reducer(action),
  );
}

AuthState handleSendCodeAction(AuthState state, VerifyCodeAction action) {
  return state.copyWith(
    verifyCodeStatus: state.verifyCodeStatus.reducer(action),
  );
}

AuthState handleSendLostPasswordCode(AuthState state, RecoveryAction action) {
  return state.copyWith(
    sendLostPasswordCodeStatus: state.sendLostPasswordCodeStatus.reducer(action),
  );
}

AuthState handleLostPasswordModification(AuthState state, ChangeLostPasswordAction action) {
  return state.copyWith(
    lostPasswordModificationStatus: state.lostPasswordModificationStatus.reducer(action),
  );
}

AuthState handlePasswordModification(AuthState state, ChangePasswordAction action) {
  return state.copyWith(
    passwordModificationStatus: state.passwordModificationStatus.reducer(action),
  );
}
