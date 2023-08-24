import 'package:base_flutter/core/extensions/media_query.dart';
import 'package:base_flutter/core/resource/assets_manager.dart';
import 'package:base_flutter/features/presentation/auth/screens/select_user/widgets/select_type_items.dart';
import 'package:base_flutter/features/presentation/auth/screens/select_user/widgets/select_user_texts.dart';
import 'package:flutter/material.dart';

class SelectUserBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 390,
      height: 844,
      clipBehavior: Clip.antiAlias,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment(-1.00, -0.00),
          end: Alignment(1, 0),
          colors: [
            Color(0xFF009ECF),
            Color(0xFF2B4560),
          ],
        ),
      ),
      child: Stack(
        children: [
          Image.asset(AssetsManager.bottomPattern),
          Positioned(
            // left: 45,
            right: 0,
            left: 0,
            top: context.height * 0.2,
            child: Column(
              children: [
                SelectUserTexts(),
                SizedBox(
                  height: 40,
                ),
                SelectTypeItems(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
