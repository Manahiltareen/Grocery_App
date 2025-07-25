
import '../../linker/linker.dart';

class PageContainer extends StatefulWidget {
  final String text;
  final String image;
  const PageContainer({super.key, required this.text, required this.image});

  @override
  State<PageContainer> createState() => _PageContainerState();
}

class _PageContainerState extends State<PageContainer> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 278,
      width: 490,
      decoration: BoxDecoration(
        image: DecorationImage(image:AssetImage(widget.image)),
      ),
      child: Padding(
        padding: const EdgeInsets.only(top: 120.0,right: 140.0),
        child: BlackTextWidget(text: widget.text,fontSize: 18,fontWeight:   FontWeight.w700,),
      ),
    );
  }
}
