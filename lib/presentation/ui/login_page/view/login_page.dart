import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';
import 'package:formz/formz.dart';
import 'package:go_router/go_router.dart';
import 'package:recipetestapp/presentation/navigation/app_router.dart';
import 'package:recipetestapp/presentation/styles/styles.dart';
import 'package:recipetestapp/presentation/ui/common/state_renderer/state_renderer_impl.dart';
import 'package:recipetestapp/presentation/ui/login_page/bloc/login_bloc.dart';
import 'package:recipetestapp/presentation/ui/login_page/models/login_models.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return PlatformScaffold(
      backgroundColor: ColorConstants.backGroundGreyColor,
      body: Padding(
        padding: const EdgeInsets.all(AppPaddingConstants.p12),
        child: BlocProvider(
          create: (context) => LoginBloc(),
          child: const _LoginForm(),
        ),
      ),
    );
  }
}

class _LoginForm extends StatefulWidget {
  const _LoginForm({super.key});

  @override
  State<_LoginForm> createState() => __LoginFormState();
}

class __LoginFormState extends State<_LoginForm> {
  final _formKey = GlobalKey<FormState>();
  late final LoginBloc _bloc;

  void _bind() {
    _bloc = context.read<LoginBloc>();
  }

  @override
  void initState() {
    super.initState();
    _bind();
  }

  bool isCurrentDialogShowing() => ModalRoute.of(context)?.isCurrent != true;

  void dismissDialog() {
    if (Navigator.canPop(context) && isCurrentDialogShowing()) {
      Navigator.of(context, rootNavigator: true).pop();
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<LoginBloc, LoginState>(
      listener: (context, state) {
        switch (state.status) {
          case FormzSubmissionStatus.inProgress:
            {
              dismissDialog();
              LoadingState().showPopup(context, height: 200, width: 200);
            }
            break;
          case FormzSubmissionStatus.failure:
            {
              dismissDialog();
              ErrorState(state.errorMessage)
                  .showPopup(context, height: 200, width: 200);
            }
            break;
          case FormzSubmissionStatus.success:
            {
              dismissDialog();
              context.pushReplacementNamed(RoutesName.splash);
            }
            break;
          case FormzSubmissionStatus.canceled:
          case FormzSubmissionStatus.initial:
            break;
        }
      },
      child: Container(
        alignment: Alignment.center,
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                margin: const EdgeInsets.only(bottom: AppMarginConstants.m21),
                child: Image.asset(
                  ImageAssets.appLogo,
                  width: AppSizeConstants.s100,
                  height: AppSizeConstants.s100,
                ),
              ),
              Container(
                margin: const EdgeInsets.all(AppMarginConstants.m14),
                padding: const EdgeInsets.all(AppPaddingConstants.p14),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  color: ColorConstants.white,
                ),
                child: Form(
                  key: _formKey,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      _emailInput,
                      const Padding(
                          padding: EdgeInsets.all(AppPaddingConstants.p12)),
                      _passwordInput,
                      const Padding(
                          padding: EdgeInsets.all(AppPaddingConstants.p12)),
                      _loginButton,
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget get _emailInput {
    return BlocSelector<LoginBloc, LoginState, Email>(
      selector: (state) => state.email,
      builder: (context, state) {
        return TextFormField(
          validator: (value) => state.validator(value ?? " ")?.getErrorMessage,
          key: const Key('loginForm_emailInput_textField'),
          onChanged: (email) => _bloc.add(LoginEmailChanged(email)),
          decoration: const InputDecoration(
            icon: Icon(Icons.person),
            hintText: AppStrings.emailHintText,
          ),
        );
      },
    );
  }

  Widget get _passwordInput {
    return BlocSelector<LoginBloc, LoginState, Password>(
      selector: (state) => state.password,
      builder: (context, state) {
        return TextFormField(
          validator: (value) => state.validator(value ?? "")?.getErrorMessage,
          key: const Key('loginForm_passwordInput_textField'),
          onChanged: (password) => _bloc.add(LoginPasswordChanged(password)),
          obscureText: true,
          decoration: const InputDecoration(
            icon: Icon(Icons.key),
            hintText: AppStrings.passwordHintText,
          ),
        );
      },
    );
  }

  Widget get _loginButton {
    return BlocSelector<LoginBloc, LoginState, bool>(
      selector: (state) => state.isValid,
      builder: (context, state) {
        return ElevatedButton(
          style: ElevatedButton.styleFrom(
            foregroundColor: ColorConstants.black,
            textStyle: TextStylesManager.getBoldStyle(
              fontSize: FontSizeConstants.s18,
            ),
          ),
          key: const Key('loginForm_loginButton'),
          onPressed: () {
            if (_formKey.currentState!.validate()) {
              _bloc.add(const LoginSubmit());
            }
          },
          child: const Text(AppStrings.login),
        );
      },
    );
  }
}
