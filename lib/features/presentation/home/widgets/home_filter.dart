import 'dart:developer';

import 'package:base_flutter/core/base_widgets/custom_text_field.dart';
import 'package:base_flutter/core/base_widgets/my_text.dart';
import 'package:base_flutter/core/extensions/media_query.dart';
import 'package:base_flutter/core/generic_cubit/generic_cubit.dart';
import 'package:base_flutter/core/helpers/app_loader_helper.dart';
import 'package:base_flutter/core/helpers/validator.dart';
import 'package:base_flutter/core/resource/color_manager.dart';
import 'package:base_flutter/core/resource/navigation_service.dart';
import 'package:base_flutter/core/utils/enums.dart';
import 'package:base_flutter/features/models/areas_model.dart';
import 'package:base_flutter/features/models/cities_model.dart';
import 'package:base_flutter/features/presentation/filter/cubits/filter_cubit.dart';
import 'package:base_flutter/features/presentation/home/cubit/home_cubit/home_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/base_widgets/custom_drop_down.dart';

import '../../../custom_widgets/custom_gradient_button.dart';
import '../../../models/services_model.dart';
import '../../filter/filter.dart';

class HomeFilter extends StatelessWidget {
  final GenericCubit<bool> checkCubit = GenericCubit(false);

  @override
  Widget build(BuildContext context) {
    var filterCubit = context.read<FilterCubit>();
    var dropped ;
    return BlocBuilder<HomeCubit, HomeState>(
      builder: (context, state) {
        return Form(
          key: context.read<HomeCubit>().formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              MyText(
                title: 'حدد موقعك الجغرافي واطلب خدمتك الان ',
                fontWeight: FontWeight.w400,
                color: ColorManager.primary,
                alien: TextAlign.start,
                size: 13,
              ),
              SizedBox(
                height: 5,
              ),
              // if(state.servicesState == RequestState.loaded || state.servicesState == RequestState.init)
              DropdownButtonCustom<ServicesModel>(
                hintText: "الخدمة",
                items: [
                  for (var item in state.servicesList)
                    DropdownMenuItem<ServicesModel>(
                      value: item,
                      child: Text(
                        item.name ?? '',
                      ),
                    )
                ],
                dropDownValue: dropped,
                onChangeAction: (v) {
                  filterCubit.serviceId = v.id;
                  log("change : $v");
                  log("change : ${filterCubit.serviceId}");
                },
              ),
              DropdownButtonCustom<CitiesModel>(
                hintText: "المدينة",
                items: [
                  for (var item in state.citiesList)
                    DropdownMenuItem<CitiesModel>(
                      value: item,
                      child: Text(
                        item.nameAr ?? '',
                      ),
                    )
                ],
                dropDownValue: null,
                onChangeAction: (v) {
                  filterCubit.cityId = v.id;
                  log("change : $v");
                  log("change : ${filterCubit.cityId}");
                },
              ),
              DropdownButtonCustom<AreasModel>(
                hintText: "المنطقة",
                items: [
                  for (var item in state.areasList)
                    DropdownMenuItem<AreasModel>(
                      value: item,
                      child: Text(
                        item.name ?? '',
                      ),
                    )
                ],
                dropDownValue: null,
                onChangeAction: (v) {
                  filterCubit.areaId = v.id;
                  log("change : $v");
                  log("change : ${filterCubit.areaId}");
                },
              ),
              CustomTextField(
                validator: (value) => value?.noValidate(),
                fieldTypes: FieldTypes.clickable,
                hint: "التاريخ",
                textColor: ColorManager.primary,
                onTap: () => context.read<HomeCubit>().dateFun(context),
                controller: context.read<HomeCubit>().dateController,
                type: TextInputType.text,
                prefixIcon: Icon(
                  Icons.calendar_today,
                  color: ColorManager.primary,
                  size: 20,
                ),
              ),

              Row(
                children: [
                  BlocBuilder<GenericCubit<bool>, GenericState<bool>>(
                    bloc: checkCubit,
                    builder: (context, state) {
                      return Checkbox(
                          value: state.data,
                          activeColor: ColorManager.primary,
                          onChanged: (value) {
                            checkCubit.onUpdateData(value!);
                            bool checked = value;
                            filterCubit.vip = checked;
                            log("checked is ${filterCubit.vip}");
                          });
                    },
                  ),
                  MyText(
                    title: "حجز خدمة VIP خارج اوقات العمل",
                    color: ColorManager.grey2,
                  )
                ],
              ),
              BlocBuilder<FilterCubit, FilterState>(
                builder: (context, state) {
                  if(state.filterState == RequestState.loading)
                  return  Center(child: AppLoaderHelper.showSimpleLoading(),);
                  if(state.filterState == RequestState.loaded || state.filterState == RequestState.init)
                    return Center(
                      child: CustomGradientButton(
                        title: "بحث",
                        onTap: () {
                          filterCubit.filter(
                              date: context.read<HomeCubit>().dateController.text);
                          context.read<HomeCubit>().formKey.currentState!.reset();
                        },
                        width: context.width * 0.35,
                      ),
                    );
                  return SizedBox();
                },
              )
            ],
          ),
        );
      },
    );
  }
}
