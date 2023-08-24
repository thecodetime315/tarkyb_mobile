import 'package:base_flutter/core/base_widgets/custom_text_field.dart';
import 'package:base_flutter/core/base_widgets/my_text.dart';
import 'package:base_flutter/core/extensions/media_query.dart';
import 'package:base_flutter/core/helpers/validator.dart';
import 'package:base_flutter/core/resource/color_manager.dart';
import 'package:base_flutter/core/resource/navigation_service.dart';
import 'package:flutter/material.dart';

import '../../../../core/base_widgets/custom_drop_down.dart';
import '../../../../core/helpers/adaptive_picker.dart';
import '../../../custom_widgets/custom_gradient_button.dart';
import '../../filter/filter.dart';

class HomeFilter extends StatelessWidget {
  dateFun(BuildContext context) {
    AdaptivePicker.datePicker(
      context: context,
      title: "التاريخ",
      onConfirm: (time) {
        // cubit.dateController.text = time.toString().substring(0, 10);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
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
        DropdownButtonCustom(
          hintText: "الخدمة",
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
        CustomTextField(
          validator: (value) => value?.noValidate(),
          fieldTypes: FieldTypes.clickable,
          hint: "التاريخ",
          textColor: ColorManager.primary,
          onTap: () => dateFun(context),
          type: TextInputType.text,
          prefixIcon: Icon(
            Icons.calendar_today,
            color: ColorManager.primary,
            size: 20,
          ),
        ),
        Row(
          children: [
            Checkbox(value: false, onChanged: (value) {}),
            MyText(
              title: "حجز خدمة VIP خارج اوقات العمل",
              color: ColorManager.grey2,
            )
          ],
        ),
        Center(
          child: CustomGradientButton(
            title: "بحث",
            onTap: () {
              NavigationService.navigateTo(Filter());
            },
            width: context.width * 0.35,
          ),
        )
      ],
    );
  }
}
