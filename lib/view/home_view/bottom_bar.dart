
import '../../linker/linker.dart';

class BottomNav extends StatefulWidget {
  const BottomNav({super.key});

  @override
  State<BottomNav> createState() => _BottomNavState();
}

class _BottomNavState extends State<BottomNav> {
  int currentIndexs=0;
  final List<Widget> navscreens=[
    HomeScreen1(),
     ProfileScreen(),
    FavouriteScreen(),
    CartScreen(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
    body:navscreens[currentIndexs],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentIndexs,
          onTap: (index){
            setState(() {
              currentIndexs=index;
            });
          },
          selectedItemColor: AppColors.greencolor,
          items:[BottomNavigationBarItem(icon:Image(image: AssetImage(AppIcons.homeicon)),label: '' ),
          BottomNavigationBarItem(icon:Image(image: AssetImage(AppIcons.person),color: AppColors.blackColor,),label: '' ),
       BottomNavigationBarItem(icon:Image(image: AssetImage(AppIcons.hearticon,),color: AppColors.blackColor,),label: '' ),
        BottomNavigationBarItem(icon:Image(image: AssetImage(AppIcons.cart2),color: AppColors.blackColor,) ,label: '',),
      ]),
    );
  }
}

