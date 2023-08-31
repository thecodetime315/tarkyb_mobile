import 'package:base_flutter/features/presentation/technician_details/widgets/time_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_expanded_tile/flutter_expanded_tile.dart';

import '../../../../core/base_widgets/my_text.dart';
import '../../../../core/resource/color_manager.dart';
import '../../../models/technician_details_model.dart';

class TechnicianTimes extends StatefulWidget {
  final WorkingPeriods? workingPeriods;

  const TechnicianTimes({Key? key, this.workingPeriods}) : super(key: key);

  @override
  State<TechnicianTimes> createState() => _TechnicianTimesState();
}

class _TechnicianTimesState extends State<TechnicianTimes> {
  late ExpandedTileController _controller;

  @override
  void initState() {
    _controller = ExpandedTileController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          // width: context.width*0.4,
          margin: EdgeInsets.symmetric(vertical: 5),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5),
            border: Border.all(color: ColorManager.grey2.withOpacity(0.7)),
          ),
          child: ExpandedTile(
            contentseparator: 0,
            controller: _controller,
            trailing: Icon(
              Icons.arrow_forward_ios_rounded,
              size: 20,
              color: ColorManager.primary,
            ),
            title: MyText(
              title: widget.workingPeriods?.day ?? '',
              size: 16,
              fontWeight: FontWeight.w400,
            ),
            theme: const ExpandedTileThemeData(
              headerRadius: 0,
              contentRadius: 0,
              headerColor: Colors.white,
              headerSplashColor: Colors.grey,
              contentPadding: EdgeInsets.zero,
              contentBackgroundColor: Colors.white,
              titlePadding: EdgeInsets.zero,
              trailingPadding: EdgeInsets.zero,
              headerPadding: EdgeInsetsDirectional.only(
                  top: 12, bottom: 12, start: 12, end: 4),
              leadingPadding: EdgeInsets.zero,
            ),
            content: Column(
              children: List.generate(
                  widget.workingPeriods?.values?.length ?? 0,
                  (index) => TimeItem(
                        title:
                            'من ${widget.workingPeriods?.values![index].from} الى  ${widget.workingPeriods?.values![index].to}',
                        periodName:
                            widget.workingPeriods?.values![index].name ?? '',
                      )),
            ),
          ),
        ),
        // Divider(height: 5,
        // color: ColorManager.grey2,
        // indent: 15,
        // endIndent: 15,),
      ],
    );
  }
}
