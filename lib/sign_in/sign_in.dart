


import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:food_review/base_module/presentation/component/bounce.dart';
import 'package:food_review/base_module/presentation/core/constants/app_constans.dart';
import 'package:food_review/base_module/presentation/core/vaalues/style.dart';
import 'package:food_review/review/review_screen.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:hive/hive.dart';

import '../base_module/presentation/core/constants/theme_assets.dart';

class SignIn extends StatefulWidget {
  const SignIn({Key? key}) : super(key: key);

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  final _userDataBox = Hive.box('user_data_box');
  GoogleSignInAccount? _currentUser;
  // GoogleSignIn googleSignIn = GoogleSignIn(
  //   // Optional clientId
  //   // clientId: '479882132969-9i9aqik3jfjd7qhci1nqf0bm2g71rm1u.apps.googleusercontent.com',
  //   scopes: <String>[
  //     'email',
  //     'https://www.googleapis.com/auth/contacts.readonly',
  //   ],
  // );



  @override
  void initState() {
    super.initState();
    // _googleSignIn.onCurrentUserChanged.listen((GoogleSignInAccount? account) {
    //   setState(() {
    //     _currentUser = account;
    //   });
    //   // if (_currentUser != null) {
    //   //   _handleGetContact(_currentUser!);
    //   // }
    // });
    // _googleSignIn.signInSilently();
  }
  final GoogleSignIn googleSignIn = GoogleSignIn();
  Future<void> _signInWithGoogle() async {
    try {
      final GoogleSignInAccount? googleSignInAccount = await googleSignIn.signIn();
      final GoogleSignInAuthentication googleSignInAuthentication = await googleSignInAccount!.authentication;

      final OAuthCredential credential = GoogleAuthProvider.credential(
        accessToken: googleSignInAuthentication.accessToken,
        idToken: googleSignInAuthentication.idToken,
      );
      final response = await FirebaseAuth.instance.signInWithCredential(credential);

     if ( response.user != null ){
       _userDataBox.put('token', response.credential!.accessToken);

       Future.delayed(
           const Duration(seconds: 2),
               () => Navigator.pushReplacement(
               context,
               MaterialPageRoute(
                   builder: (context) => const ReviewScreen(

                   ))));
     }
    } catch (error) {
      print(error);
    }
  }

  // Future<void>SignIn()async{
  //   try {
  //     await _googleSignIn.signIn();
  //     print("aaaaa");
  //     print(_currentUser!.email);
  //     print("bbbb");
  //   }catch(e){
  //     print("Error signin $e");
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    var size =MediaQuery.of(context).size;

    return  Scaffold(

      body: Stack(

        children: [
          SizedBox(height: size.height,
          width: size.width,
          child: Image.asset(ThemeAssets.food,fit: BoxFit.cover),),
          SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15,vertical: 12),
              child: Center(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [



                    // SizedBox(
                    //     height: size.height * 0.60 ,
                    //     width: size.width,
                    //     child:Image.asset(ThemeAssets.food,fit: BoxFit.cover)
                    //   // SvgPicture.asset(ThemeAssets.splashscreenbackground,fit: BoxFit.fill, color:Colors.white.withOpacity(0.10)),
                    // ),
                     SizedBox(height: size.height *0.32,),


                    const Text("PARTNER WITH US",style: Style.heading),
                    const SizedBox(height: AppConstants.defaultPadding,),
                    const Text("FOR FOOD REVIEW PLATFORM", style: Style.heading),
                    const SizedBox(height: AppConstants.defaultPadding,),
                    const Text("Let's start survey", style: Style.heading),


                    SizedBox(height: size.height *0.17,),
                    //
                    //
                    Bouncing(

                      child: InkWell(
                        onTap: (){
                          _signInWithGoogle();
                          // SignIn();

                        },
                        child: Container(
                          height: 50,
                          width: MediaQuery.of(context).size.width,

                          decoration: BoxDecoration(
                              color: CommonColors.colorGreen,
                            borderRadius: BorderRadius.circular(10)
                          ),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                height: 30,
                                width: 30,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  image: const DecorationImage(
                                    image:  AssetImage(ThemeAssets.googleIcon),fit: BoxFit.cover
                                  )
                                ),

                              ),
                              const SizedBox(width: 7,),
                              const Text("Continue with google")
                            ],
                          )
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),],
      ),
      // ),
      // bottomNavigationBar:Padding(
      //   padding: const EdgeInsets.symmetric(vertical: 2,horizontal: 15),
      //   child: SizedBox(
      //     height: 120,
      //     child: Column(
      //       mainAxisAlignment: MainAxisAlignment.center,
      //       crossAxisAlignment: CrossAxisAlignment.center,
      //       children: [
      //         InkWell(
      //           onTap: (){
      //             _signInWithGoogle();
      //             // SignIn();
      //
      //           },
      //           child: Container(
      //               height: 50,
      //               width: MediaQuery.of(context).size.width,
      //
      //               decoration: BoxDecoration(
      //                   color: CommonColors.colorGreen,
      //                   borderRadius: BorderRadius.circular(10)
      //               ),
      //               child: Row(
      //                 crossAxisAlignment: CrossAxisAlignment.center,
      //                 mainAxisAlignment: MainAxisAlignment.center,
      //                 children: [
      //                   Container(
      //                     height: 30,
      //                     width: 30,
      //                     decoration: BoxDecoration(
      //                         borderRadius: BorderRadius.circular(10),
      //                         image: const DecorationImage(
      //                             image:  AssetImage(ThemeAssets.googleIcon),fit: BoxFit.cover
      //                         )
      //                     ),
      //
      //                   ),
      //                   const SizedBox(width: 7,),
      //                   const Text("Continue with google",style: Style.subheading,)
      //                 ],
      //               )
      //           ),
      //         ),
      //         // SizedBox(height: 40,)
      //       ],
      //     ),
      //   ),
      // ) ,
    );
  }
}
