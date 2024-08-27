import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:watch_store/component/extension.dart';
import 'package:watch_store/gen/assets.gen.dart';
import 'package:watch_store/res/dimens.dart';
import 'package:watch_store/res/strings.dart';
import 'package:watch_store/route_manager/screen_names.dart';
import 'package:watch_store/screens/auth/cubit/auth_cubit.dart';
import 'package:watch_store/widget/app_text_field.dart';
import 'package:watch_store/widget/main_button.dart';

import '../../component/text_style.dart';
import '../../widget/snack_bar.dart';

class SendOtpScreen extends StatelessWidget {
  SendOtpScreen({
    super.key,
  });

  final TextEditingController _controller = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SizedBox(
          width: double.infinity,
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image.asset(
                  Assets.png.mainLogo.path,
                  height: 100,
                ),
                AppDimens.large.height,
                AppTextField(
                  lable: AppStrings.enterYourNumber,
                  hint: AppStrings.hintPhoneNumber,
                  inputType: TextInputType.phone,
                  controller: _controller,
                  align: TextAlign.center,
                  validator: (value) {
                    if (value!.length < 11) {
                      return 'لطفا شماره تلفن را وارد کنید';
                    }
                    return null;
                  },
                  inputFormatter: [
                    FilteringTextInputFormatter.digitsOnly,
                    LengthLimitingTextInputFormatter(11),
                  ],
                ),
                AppDimens.small.height,
                BlocConsumer<AuthCubit, AuthState>(
                  listener: (context, state) {
                    if (state is SentState) {
                      Navigator.pushNamed(context, ScreenNames.verifyCodeScreen,
                          arguments: [state.mobile, state.code]);
                      showCustomSnackBar(
                          context,
                          "کد فعالسازی: ${state.code.toString()}",
                          100,
                          "successes");
                    } else if (state is ErrorState) {
                      showCustomSnackBar(
                          context, "خطا در اتصال به سرور", 5, "error");
                    }
                  },
                  builder: (context, state) {
                    return MainButton(
                      onPressed: state is LoadingState
                          ? null
                          : () {
                              _formKey.currentState!.validate()
                                  ? BlocProvider.of<AuthCubit>(context)
                                      .sendSms(_controller.text)
                                  : null;
                            },
                      child: state is LoadingState
                          ? LoadingAnimationWidget.prograssiveDots(
                              color: Colors.white,
                              size: 37,
                            )
                          : const Text(
                              AppStrings.sendOtpCode,
                              style: AppTextStyles.mainButton,
                            ),
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
