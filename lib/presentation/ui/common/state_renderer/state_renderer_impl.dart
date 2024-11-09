import 'package:flutter/material.dart';
import 'package:recipetestapp/app/constants/global_constants.dart';
import 'package:recipetestapp/presentation/styles/styles.dart';
import 'package:recipetestapp/presentation/ui/common/state_renderer/state_renderer.dart';

abstract class FlowState {
  StateRendererType getStateRendererType();
  String getMessage();
  void showPopup(
    BuildContext context, {
    double height = AppSizeConstants.s100,
    double width = AppSizeConstants.s100,
    Function? tryAgain,
  });
}

/// Loading state (popup, full screen)
class LoadingState extends FlowState {
  StateRendererType stateRendererType = StateRendererType.popupLoadingState;
  String message;

  LoadingState({this.message = AppStrings.loading});

  @override
  String getMessage() => message;

  @override
  StateRendererType getStateRendererType() => stateRendererType;

  @override
  void showPopup(
    BuildContext context, {
    double height = AppSizeConstants.s100,
    double width = AppSizeConstants.s100,
    Function? tryAgain,
  }) {
    _showPopup(
      context,
      getStateRendererType(),
      getMessage(),
      height: height,
      width: width,
      tryAgain: tryAgain,
    );
  }
}

class ErrorState extends FlowState {
  StateRendererType stateRendererType = StateRendererType.popupErrorState;
  String message;

  ErrorState(this.message);

  @override
  String getMessage() => message;

  @override
  StateRendererType getStateRendererType() => stateRendererType;

  @override
  void showPopup(
    BuildContext context, {
    double height = AppSizeConstants.s100,
    double width = AppSizeConstants.s100,
    Function? tryAgain,
  }) {
    _showPopup(context, getStateRendererType(), getMessage(),
        height: height, width: width, tryAgain: tryAgain);
  }
}

class SuccessState extends FlowState {
  String message;

  SuccessState([this.message = AppStrings.success]);

  @override
  String getMessage() => message;

  @override
  StateRendererType getStateRendererType() =>
      StateRendererType.popupSuccessState;

  @override
  void showPopup(
    BuildContext context, {
    double height = AppSizeConstants.s100,
    double width = AppSizeConstants.s100,
    Function? tryAgain,
  }) {
    _showPopup(context, getStateRendererType(), getMessage(),
        height: height, width: width, tryAgain: tryAgain);
  }
}

extension FlowStateExtension on FlowState {
  _showPopup(
    BuildContext context,
    StateRendererType stateRendererType,
    String message, {
    required double width,
    required double height,
    String title = Constants.empty,
    Function? tryAgain,
  }) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (context.mounted) {
        showDialog(
          context: context,
          builder: (BuildContext context) => StateRenderer(
              stateRendererType: stateRendererType,
              message: message,
              title: title,
              retryAction: tryAgain ?? () {},
              width: width,
              height: height),
        );
      }
    });
  }
}
