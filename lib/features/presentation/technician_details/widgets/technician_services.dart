import 'package:base_flutter/features/presentation/technician_details/widgets/technician_service_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_expanded_tile/flutter_expanded_tile.dart';

import '../../../../core/base_widgets/my_text.dart';
import '../../../../core/resource/color_manager.dart';

class TechnicianServices extends StatefulWidget {
  @override
  State<TechnicianServices> createState() => _TechnicianServicesState();
}

class _TechnicianServicesState extends State<TechnicianServices> {
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
        ExpandedTile(
          contentseparator: 0,
          controller: _controller,
          trailing: Icon(
            Icons.arrow_forward_ios_rounded,
            size: 20,
            color: ColorManager.primary,
          ),
          title: MyText(
            title: "الخدمات",
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
            children: List.generate(5, (index) => TechnicianServiceItem()),
          ),
        ),
        Divider(height: 4,endIndent: 10,indent: 10,color: ColorManager.grey2,),

      ],
    );
  }
}
