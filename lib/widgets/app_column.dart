import 'package:e_commerce/widgets/small_text.dart';
import 'package:flutter/material.dart';

import '../utilities/colors.dart';
import '../utilities/dimensions.dart';
import 'big_text.dart';
import 'icon_and_text.dart';

class AppColumn extends StatelessWidget {
  final String text;
  const AppColumn({required this.text,Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        BigText(text: text,size: Dimensions.font26,),
        SizedBox(height: Dimensions.small,),
        Row(
          children: [
            Wrap(children: List.generate(
                5, (index) => const Icon(Icons.star,color: AppColors.mainColor,
            ))),


            SizedBox(width: Dimensions.small,),
            const SmallText(text: '4.7',size: 14,),
            SizedBox(width: Dimensions.small,),
            const SmallText(text: '1047',size: 14,),
            SizedBox(width: Dimensions.small,),
            const SmallText(text: 'Comments',size: 15,)
          ],
        ),
        SizedBox(height: Dimensions.sized,),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: const [
            IconAndText(

                icon: Icons.circle_sharp,
                text: 'Normal',
                iconColor: AppColors.iconColor1),


            IconAndText(

                icon: Icons.location_on,
                text: '1.7Km',
                iconColor: AppColors.mainColor),


            IconAndText(

                icon: Icons.access_time_rounded,
                text: '32min',
                iconColor: AppColors.iconColor2)
          ],
        )

      ],
    );  }
}
