



import '../../../linker/linker.dart';

class ProfileScreen extends StatelessWidget {
   ProfileScreen({super.key});
  List<ProfileList> items=[
    ProfileList(AboutScreen(), text: 'About me', image: AppIcons.persongreen, icon:Icons.arrow_forward_ios,),
    ProfileList(OrderScreen(), text: 'My orders', image: AppIcons.order, icon: Icons.arrow_forward_ios),
    ProfileList(FavouriteScreen(), text:'My Favourites', image: AppIcons.greenheart, icon:Icons.arrow_forward_ios),
 ProfileList(MyAddressScreen(), text: 'My address', image: AppIcons.address, icon: Icons.arrow_forward_ios),
  ProfileList(CreditcardScreen(), text: 'Credit cards', image: AppIcons.creditcard, icon: Icons.arrow_forward_ios),
    ProfileList(TransactionsScreen(), text:'Transactions' , image:AppIcons.transaction, icon: Icons.arrow_forward_ios),
   ProfileList(NotifictionScreen(), text: 'Notifications', image:AppIcons.notification1, icon:Icons.arrow_forward_ios),
  ProfileList(SignoutScreen(), text:'Sign out', image: AppIcons.signout, icon:Icons.arrow_forward_ios)
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              alignment: Alignment.topCenter,
              children: [
                Expanded(
                  flex: 20,
                    child: Container(
                  height: 145,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: AppColors.whiteColor,
                  ),
                )),
                      Expanded(
                        flex: 80,
                        child:Column(
                          children: [
                            Container(
                                width: double.infinity,
                                decoration: BoxDecoration(
                                ),
                                child: Column(
                                    children: [
                                      SizedBox(height: 80,),
                                      Container(
                                        height: 100,
                                        width: 100,
                                        decoration: BoxDecoration(
                                            shape: BoxShape.circle,
                                            image: DecorationImage(image: AssetImage(AppIcons.profile),)
                                        ),
                                      ),
                                      BlackTextWidget(text: 'Olivia Austin',fontWeight: FontWeight.w600,fontSize: 18,),
                                      GreyText(text: 'oliviaaustin@gmail.com',),
                                    ],
                                ),
                            ),
                            ListClass(profileitems: items),
                          ],
                        ),

                  ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

