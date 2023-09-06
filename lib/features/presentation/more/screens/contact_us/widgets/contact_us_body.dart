import 'package:base_flutter/core/base_widgets/custom_button.dart';
import 'package:base_flutter/core/helpers/app_loader_helper.dart';
import 'package:base_flutter/core/localization/app_localizations.dart';
import 'package:base_flutter/core/utils/enums.dart';
import 'package:base_flutter/features/presentation/more/screens/contact_us/cubit/contact_us_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../models/settings_model.dart';
import 'contact_us_form.dart';
import 'contact_us_social.dart';

class ContactUsBody extends StatelessWidget {
  final List<SettingsModel> model;

  const ContactUsBody({Key? key, required this.model}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ContactUsCubit, ContactUsState>(
      builder: (context, state) {
        return SingleChildScrollView(
          child: Column(
            children: [
              ContactUsForm(),
              if(state.contactUsState == RequestState.init || state.contactUsState == RequestState.loaded )
                CustomButton(
                  title: tr(context, "send"),
                  onTap: () {
                    context.read<ContactUsCubit>().contactUs();
                  },
                  margin: EdgeInsets.symmetric(vertical: 15, horizontal: 5),
                ),
              if(state.contactUsState == RequestState.loading)
                Center(child: AppLoaderHelper.showSimpleLoading(),),
              ContactUsSocial(model: model,),
            ],
          ),
        );
      },
    );
  }
}
