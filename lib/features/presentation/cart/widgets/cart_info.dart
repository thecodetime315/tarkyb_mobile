import 'dart:developer';

import 'package:base_flutter/core/extensions/media_query.dart';
import 'package:base_flutter/core/generic_cubit/generic_cubit.dart';
import 'package:base_flutter/core/helpers/validator.dart';
import 'package:base_flutter/features/models/areas_model.dart';
import 'package:base_flutter/features/models/cities_model.dart';
import 'package:base_flutter/features/models/working_time_model.dart';
import 'package:base_flutter/features/presentation/cart/cart_logic.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/base_widgets/custom_drop_down.dart';
import '../../../../core/base_widgets/custom_text_field.dart';
import '../../../../core/base_widgets/my_text.dart';
import '../../../../core/helpers/app_loader_helper.dart';
import '../../../../core/location_address/location_cubit/location_cubit.dart';
import '../../../../core/resource/color_manager.dart';

class CartInfo extends StatelessWidget {
  final CartLogic cartLogic;

  const CartInfo({Key? key, required this.cartLogic}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
          SizedBox(
            height: 5,
          ),
          DropdownButtonCustom<CitiesModel>(
            hintText: "المدينة",
            dropDownValue: null,
            items: [
              for (var item in cartLogic.citiesCubit.state.data)
                DropdownMenuItem<CitiesModel>(
                  value: item,
                  child: Text(
                    item.nameAr ?? '',
                  ),
                )
            ],
            onChangeAction: (v) {
              cartLogic.selectedCityCubit.onUpdateData(v.id);
              log("ssss : ${cartLogic.selectedCityCubit.state.data}");
            },
          ),
          BlocBuilder<GenericCubit<int>, GenericState<int>>(
            bloc: cartLogic.selectedAreaCubit,
            builder: (context, state) {
              return DropdownButtonCustom<AreasModel>(
                hintText: "المنطقة",
                dropDownValue: null,
                items: [
                  for (var item in cartLogic.areasCubit.state.data)
                    DropdownMenuItem<AreasModel>(
                      value: item,
                      child: Text(
                        item.name ?? '',
                      ),
                    )
                ],
                onChangeAction: (v) {
                  cartLogic.selectedAreaCubit.onUpdateData(v.id);
                  log("ssss : ${cartLogic.selectedAreaCubit.state.data}");
                },
              );
            },
          ),
          cartLogic.cartCubit.state.data?.vip == 0  ?   Row(
            children: [
              Expanded(
                child: CustomTextField(
                  validator: (value) => value?.noValidate(),
                  fieldTypes: FieldTypes.clickable,
                  hint: "التاريخ",
                  textColor: ColorManager.primary,
                  onTap: () => cartLogic.dateFun(context,
                      cartLogic.cartCubit.state.data?.technician?.id ?? 0),
                  width: context.width * 0.5,
                  controller: cartLogic.dateController,
                  type: TextInputType.text,
                ),
              ),
              Expanded(
                child: BlocBuilder<GenericCubit<List<WorkingTimeModel>>,
                    GenericState<List<WorkingTimeModel>>>(
                  bloc: cartLogic.workingTimeCubit,
                  builder: (context, state) {
                    return DropdownButtonCustom<WorkingTimeModel>(
                      hintText: "اختر الوقت",
                      dropDownValue: null,
                      items: [
                        for (var item in cartLogic.workingTimeCubit.state.data)
                          DropdownMenuItem<WorkingTimeModel>(
                            value: item,
                            child: Text(
                              item.name ?? '',
                            ),
                          )
                      ],
                      onChangeAction: (v) {
                        cartLogic.periodId = v;
                      },
                    );
                  },
                ),
              )
            ],
          ) : SizedBox(),
          BlocListener<LocationCubit, LocationState>(
            bloc: cartLogic.locationCubit,
            listener: (context, state) {
              cartLogic.locationController.text = state.model?.address ?? "";
            },
            child: BlocBuilder<LocationCubit, LocationState>(
              bloc: cartLogic.locationCubit,
              builder: (context, state) {
                if (state is LocationInitial) {
                  return CustomTextField(
                    onTap: () => cartLogic.onLocationClick(context),
                    validator: (value) => value?.noValidate(),
                    fieldTypes: FieldTypes.clickable,
                    type: TextInputType.none,
                    controller: cartLogic.locationController,
                    hint: "ادخل العنوان",
                    textColor: ColorManager.primary,
                  );
                }
                return state is LocationLoading
                    ? AppLoaderHelper.showLoadingDialog()
                    : CustomTextField(
                        onTap: () => cartLogic.onLocationClick(context),
                        validator: (value) => value?.noValidate(),
                        fieldTypes: FieldTypes.clickable,
                        type: TextInputType.none,
                        controller: cartLogic.locationController,
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
