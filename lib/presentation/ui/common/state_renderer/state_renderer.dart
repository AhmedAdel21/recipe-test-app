import 'package:flutter/material.dart';
import 'package:recipetestapp/presentation/styles/styles.dart';

enum StateRendererType {
  popupLoadingState,
  popupErrorState,
  popupSuccessState,
}

class StateRenderer extends StatelessWidget {
  final StateRendererType stateRendererType;
  final String message;
  final String title;
  final Function retryAction;
  final double? height;
  final double? width;

  const StateRenderer({
    required this.stateRendererType,
    required this.retryAction,
    this.message = AppStrings.loading,
    this.title = "",
    this.height,
    this.width,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return _getStateWidget(context);
  }

  Widget _getStateWidget(BuildContext context) {
    switch (stateRendererType) {
      case StateRendererType.popupLoadingState:
        return _getPopUpDialog(context, [
          _getAnimatedImage(GifAssets.appLogo),
          _getMessage(message),
        ]);
      case StateRendererType.popupErrorState:
        return _getPopUpDialog(context, [
          _getAnimatedImage(GifAssets.error),
          _getMessage(message),
          _getRetryButton(AppStrings.ok, context),
        ]);

      case StateRendererType.popupSuccessState:
        return _getPopUpDialog(context, [
          _getAnimatedImage(JsonAssets.success),
          _getMessage(title),
          _getMessage(message),
          _getRetryButton(AppStrings.ok, context),
        ]);
    }
  }

  Widget _getDialogContent(BuildContext context, List<Widget> children) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: children,
    );
  }

  Widget _getPopUpDialog(BuildContext context, List<Widget> children) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(AppSizeConstants.s14),
      ),
      elevation: AppSizeConstants.s1_5,
      backgroundColor: Colors.transparent,
      child: Container(
        decoration: BoxDecoration(
            color: ColorConstants.white,
            shape: BoxShape.rectangle,
            borderRadius: BorderRadius.circular(AppSizeConstants.s14),
            boxShadow: const [BoxShadow(color: Colors.black26)]),
        child: _getDialogContent(context, children),
      ),
    );
  }

  Widget _getAnimatedImage(String animationName,
      {double? width, double? height}) {
    return SizedBox(
      height: height ?? AppSizeConstants.s100,
      width: width ?? AppSizeConstants.s100,
      child: Image.asset(animationName),
    );
  }

  Widget _getRetryButton(String buttonTitle, BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(AppPaddingConstants.p18),
        child: SizedBox(
          width: double.infinity,
          child: ElevatedButton(
            style: ButtonStyle(
              elevation: WidgetStateProperty.all(10),
              padding: WidgetStateProperty.all(const EdgeInsets.all(15)),
              backgroundColor: WidgetStateProperty.all(ColorConstants.white),
              foregroundColor: WidgetStateProperty.all<Color>(Colors.black),
              shape: WidgetStateProperty.all<RoundedRectangleBorder>(
                RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(200),
                ),
              ),
            ),
            onPressed: () {
              // popup error state
              retryAction.call();
              Navigator.of(context).pop();
            },
            child: Text(
              buttonTitle,
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
        ),
      ),
    );
  }

  Widget _getMessage(String message) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(AppPaddingConstants.p8),
        child: Text(
          message,
          style: TextStylesManager.getRegularStyle(
            fontSize: FontSizeConstants.s18,
            color: ColorConstants.black,
          ),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
