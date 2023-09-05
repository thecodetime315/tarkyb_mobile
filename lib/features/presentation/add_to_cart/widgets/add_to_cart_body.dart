import 'package:base_flutter/core/extensions/media_query.dart';
import 'package:base_flutter/core/helpers/validator.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/base_widgets/custom_drop_down.dart';
import '../../../../core/base_widgets/custom_text_field.dart';
import '../../../../core/base_widgets/my_text.dart';
import '../../../../core/helpers/adaptive_picker.dart';
import '../../../../core/helpers/app_loader_helper.dart';
import '../../../../core/location_address/LocationAddressImports.dart';
import '../../../../core/location_address/location_cubit/location_cubit.dart';
import '../../../../core/location_address/location_model/location_model.dart';
import '../../../../core/resource/color_manager.dart';
import '../../../../core/utils/utils_imports.dart';

class AddToCartBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final LocationCubit locationCubit = LocationCubit();
    final TextEditingController locationController = TextEditingController();
    void onLocationClick() async {
      var _loc = await Utils.getCurrentLocation();
      locationCubit.onLocationUpdated(LocationModel(
        lat: _loc?.latitude ?? 24.77426,
        lng: _loc?.longitude ?? 46.738586,
        address: "",
      ));
      Navigator.of(context).push(
        CupertinoPageRoute(
          builder: (_) => BlocProvider.value(
            value: locationCubit,
            child: LocationAddress(),
          ),
        ),
      );
    }

    dateFun(BuildContext context) {
      AdaptivePicker.datePicker(
        context: context,
        title: "التاريخ",
        onConfirm: (time) {
          // cubit.dateController.text = time.toString().substring(0, 10);
        },
      );
    }

    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          MyText(
            title: "ادخل البيانات",
            color: ColorManager.primary,
            size: 16,
          ),
          SizedBox(height: 5,),
          Row(
            children: [
              Expanded(
                child: DropdownButtonCustom(
                  hintText: "المنطقة",
                  dropDownValue: null,
                  items: [
                    DropdownMenuItem<String>(
                      value: "خدمة 1",
                      child: MyText(
                        title: 'خدمة 1',
                      ),
                    ),
                    DropdownMenuItem<String>(
                      value: "خدمة 2",
                      child: MyText(
                        title: 'خدمة 2',
                      ),
                    ),
                  ],
                  onChangeAction: (v) {
                    print("v : $v");
                  },
                ),
              ),
              Expanded(
                child: DropdownButtonCustom(
                  hintText: "المدينة",
                  dropDownValue: null,
                  items: [
                    DropdownMenuItem<String>(
                      value: "خدمة 1",
                      child: MyText(
                        title: 'خدمة 1',
                      ),
                    ),
                    DropdownMenuItem<String>(
                      value: "خدمة 2",
                      child: MyText(
                        title: 'خدمة 2',
                      ),
                    ),
                  ],
                  onChangeAction: (v) {
                    print("v : $v");
                  },
                ),
              ),
            ],
          ),
          Row(
            children: [
              Expanded(
                child: CustomTextField(
                  validator: (value) => value?.noValidate(),
                  fieldTypes: FieldTypes.clickable,
                  hint: "التاريخ",
                  textColor: ColorManager.primary,
                  onTap: () => dateFun(context),
                  width: context.width * 0.4,
                  type: TextInputType.text,
                  prefixIcon: Icon(
                    Icons.calendar_today,
                    color: ColorManager.primary,
                    size: 20,
                  ),
                ),
              ),
              Expanded(
                child: DropdownButtonCustom(
                  hintText: "اختر الوقت",
                  dropDownValue: null,
                  items: [
                    DropdownMenuItem<String>(
                      value: "خدمة 1",
                      child: MyText(
                        title: 'خدمة 1',
                      ),
                    ),
                    DropdownMenuItem<String>(
                      value: "خدمة 2",
                      child: MyText(
                        title: 'خدمة 2',
                      ),
                    ),
                  ],
                  onChangeAction: (v) {
                    print("v : $v");
                  },
                ),
              )
            ],
          ),
          BlocListener<LocationCubit, LocationState>(
            bloc: locationCubit,
            listener: (context, state) {
              locationController.text = state.model?.address ?? "";
            },
            child: BlocBuilder<LocationCubit, LocationState>(
              bloc: locationCubit,
              builder: (context, state) {
                if (state is LocationInitial) {
                  return CustomTextField(
                    onTap: () => onLocationClick(),
                    validator: (value) => value?.noValidate(),
                    fieldTypes: FieldTypes.clickable,
                    type: TextInputType.none,
                    controller: locationController,
                    hint: "ادخل العنوان",
                    textColor: ColorManager.primary,
                  );
                }
                return state is LocationLoading
                    ? AppLoaderHelper.showLoadingDialog()
                    : CustomTextField(
                        onTap: () => onLocationClick(),
                        validator: (value) => value?.noValidate(),
                        fieldTypes: FieldTypes.clickable,
                        type: TextInputType.none,
                        controller: locationController,
                        hint: "ادخل العنوان",
                        textColor: ColorManager.primary,
                      );
              },
            ),
          ),
        ],
      ),
    );
  }
}
