import 'package:ecommerce_app/core/helper/navigat_to.dart';
import 'package:ecommerce_app/core/resources_manager/constant/images/images.dart';
import 'package:ecommerce_app/core/resources_manager/shared_styles/colors.dart';
import 'package:ecommerce_app/core/widget/defult_button.dart';
import 'package:ecommerce_app/features/Auth/screen/login_screen.dart';
import 'package:ecommerce_app/features/Auth/screen/register_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../core/resources_manager/localization/app_text.dart';

class GetStartScreen extends StatelessWidget {
  const GetStartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        alignment: AlignmentDirectional.bottomCenter,
        children: [
          Image.asset(
            AppImages.getStarted,
            fit: BoxFit.cover,
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
          ),
          Container(
            width: double.infinity,
            height: MediaQuery.of(context).size.height * 0.5,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.bottomCenter,
                end: Alignment.topCenter,
                colors: [
                  Colors.black.withOpacity(0.63),
                  Colors.black.withOpacity(0.0),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(
              vertical: 20.0,
              horizontal: 55,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text(
                  'You want\nAuthentic,here \nyougo!',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 30,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                SizedBox(height: 24),
                Text(
                  'Find it here, buy it now!',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                SizedBox(height: 24),
                SizedBox(
                  width: double.infinity,
                  child: DefultButton(
                    text: AppText.login,
                    ontap: () {
                      MyNavigator.navigatTo(screen: LoginScreen());
                    },
                  ),
                ),
                SizedBox(height: 15),
                SizedBox(
                  width: double.infinity,
                  height: 50,
                  child: ElevatedButton(
                    onPressed: () {
                      MyNavigator.navigatTo(screen: RegisterScreen());
                    },
                    child: Text(
                      AppText.register,
                      style: TextStyle(color: AppColors.ParadisePink),
                    ),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5),
                      ),
                      side: BorderSide(color: AppColors.ParadisePink),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}


// import 'package:ecommerce_app/core/resources_manager/constant/images/images.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';

// class GetStartScreen extends StatelessWidget {
//   const GetStartScreen({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Stack(
//         alignment: AlignmentDirectional.bottomCenter,
//         children: [
//           Image.asset(
//             AppImages.getStarted,
//             fit: BoxFit.cover,
//             height: MediaQuery.of(context).size.height,
//             width: MediaQuery.of(context).size.width,
//           ),
//           Container(
//             width: double.infinity,
//             height: MediaQuery.of(context).size.height * 0.45,
//             decoration: BoxDecoration(
//               gradient: LinearGradient(
//                 begin: Alignment.bottomCenter,
//                 end: Alignment.topCenter,

//                 colors: [
//                   Colors.black.withAlpha(160),
//                   Colors.black.withAlpha(0),
//                 ],
//               ),
//             ),
//           ),
//           Padding(
//             padding: const EdgeInsets.only(bottom: 20.0),
//             child: Column(
//               mainAxisAlignment: MainAxisAlignment.end,
//               children: [
//                 SizedBox(
//                   width: MediaQuery.of(context).size.width * 0.75,
//                   child: Text(
//                     'data data data data data data ',
//                     textAlign: TextAlign.center,
//                     style: TextStyle(fontSize: 50, color: Colors.white),
//                   ),
//                 ),
//                 Text(
//                   'data',
//                   style: TextStyle(fontSize: 50, color: Colors.white),
//                 ),
//                 SizedBox(
//                   width: double.infinity,
//                   child: ElevatedButton(
//                     onPressed: () {
//                       Navigator.push(
//                         context,
//                         MaterialPageRoute(builder: (context) => TestScreen()),
//                       );
//                     },
//                     child: Text(AppStringKeys.login.tr),
//                   ),
//                 ),
//                 ElevatedButton(
//                   onPressed: () async {
//                     await CacheHelper.saveData(
//                       key: CacheHelperKeys.langKey,
//                       value: CacheHelperKeys.keyAR,
//                     );
//                     await Get.updateLocale(AppStringKeys.localeAR);
//                     CacheData.lang = CacheHelperKeys.keyAR;
//                   },
//                   child: Text('register'),
//                 ),
//               ],
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }


 