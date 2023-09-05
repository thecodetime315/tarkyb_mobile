import 'package:base_flutter/core/base_widgets/cache_image.dart';
import 'package:base_flutter/core/base_widgets/my_text.dart';
import 'package:base_flutter/core/extensions/media_query.dart';
import 'package:base_flutter/features/custom_widgets/custom_app_bar.dart';
import 'package:base_flutter/features/presentation/technician_details/cubits/tech_details_cubit.dart';
import 'package:base_flutter/features/presentation/technician_details/widgets/technician_tabs.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

import '../tabs/client_reviews_tab.dart';
import '../tabs/desc_tab.dart';
import '../tabs/services_tab.dart';
import '../tabs/work_time_tab.dart';

class TechnicianDetailsBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var cubit = context.read<TechDetailsCubit>().state.technicianDetailsModel;
    return DefaultTabController(
      length: 4,
      child: Stack(
        children: [
          CustomAppBar(
              title: "التفاصيل",
              child: Container(
                width: context.width,
                padding: EdgeInsets.only(
                    top: context.height * 0.06, right: 10, left: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    MyText(
                      title: cubit?.name ?? '',
                      size: 16,
                      fontWeight: FontWeight.w400,
                    ),
                    RatingBar.builder(
                      initialRating: double.parse(cubit?.averageRate ?? '0'),
                      minRating: 1,
                      itemSize: 15,
                      direction: Axis.horizontal,
                      allowHalfRating: true,
                      itemCount: 5,
                      ignoreGestures: true,
                      itemPadding: EdgeInsets.symmetric(horizontal: 1.0),
                      itemBuilder: (context, _) => Icon(
                        Icons.star,
                        color: Colors.amber,
                      ),
                      onRatingUpdate: (rating) {
                        print(rating);
                      },
                    ),
                    TechnicianTabs(),
                    Flexible(
                      child: TabBarView(
                        physics: NeverScrollableScrollPhysics(),
                        children: [
                          DescTab(),
                          ServicesTab(),
                          WorkTimeTab(),
                          ClientReviewsTab(),
                        ],
                      ),
                    ),

                  ],
                ),
              )),
          Positioned(
            child: CachedImage(
              url:cubit?.image??'',
              height: 80,
              width: 80,
              haveRadius: true,
              borderRadius: BorderRadius.circular(40),
            ),
            top: context.height * 0.14,
            right: context.width * 0.4,
            left: context.width * 0.4,
          )
        ],
      ),
    );
  }
}
