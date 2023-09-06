import 'package:e_commerce/utilities/colors.dart';
import 'package:e_commerce/utilities/dimensions.dart';
import 'package:e_commerce/widgets/small_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ExpandableText extends StatefulWidget {
  final String text;
  const ExpandableText({Key? key,required this.text}) : super(key: key);

  @override
  State<ExpandableText> createState() => _ExpandableTextState();
}

class _ExpandableTextState extends State<ExpandableText> {
  late String firstHalf;
  late String secondHalf;

  bool hiddenText = true;
  double textHeight = Dimensions.screenHeight/7.30;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    if(widget.text.length>textHeight){
      firstHalf = widget.text.substring(0,textHeight.toInt());
      secondHalf = widget.text.substring(textHeight.toInt()+1,widget.text.length);
    }else{
      firstHalf = widget.text;
      secondHalf = '';
    }
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      child: secondHalf.isEmpty?SmallText(height:1.8,size: Dimensions.font16,color: AppColors.paraColor,text: firstHalf):
      Column(
        children: [
          SmallText(height: 1.8,size: Dimensions.font16,color: AppColors.paraColor,text: hiddenText?(firstHalf+"..."):(firstHalf + secondHalf)),
          InkWell(
            onTap: (){
              setState(() {
                hiddenText = !hiddenText;
              });
            },
            child: Row(
              children: [
                SmallText(text: hiddenText?"Show more":"Show less",color: AppColors.mainColor,),
                Icon(hiddenText?Icons.arrow_drop_down_outlined:Icons.arrow_drop_up_outlined,color: AppColors.mainColor,)
              ],
            ),
          )
        ],
      ),
    );
  }
}
