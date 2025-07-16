
import '../../linker/linker.dart';

class GreyText extends StatelessWidget {
  final String text;
  final TextAlign textalign;
  const GreyText({super.key, required this.text,this.textalign=TextAlign.start});

  @override
  Widget build(BuildContext context) {
    return Text(text,textAlign:textalign,style: GoogleFonts.poppins(textStyle: TextStyle(color:
    AppColors.greyColor,fontWeight: FontWeight.w500,fontSize: 15)),);
  }
}
