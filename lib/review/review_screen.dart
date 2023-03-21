


import 'package:flutter/material.dart';
import 'package:food_review/base_module/presentation/component/bounce.dart';
import 'package:food_review/base_module/presentation/component/custom_text_field.dart';
import 'package:food_review/base_module/presentation/core/constants/app_constans.dart';
import 'package:food_review/base_module/presentation/core/constants/theme_assets.dart';
import 'package:food_review/base_module/presentation/core/vaalues/style.dart';
import 'package:food_review/sign_in/sign_in.dart';
import 'package:google_sign_in/google_sign_in.dart';

import 'package:hive_flutter/adapters.dart';

class ReviewScreen extends StatefulWidget {
  const ReviewScreen({Key? key}) : super(key: key);

  @override
  State<ReviewScreen> createState() => _ReviewScreenState();
}

class _ReviewScreenState extends State<ReviewScreen> {
  TextEditingController nameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController fssiCodeController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  TextEditingController shopNameController = TextEditingController();
  TextEditingController shopNumberController = TextEditingController();
  TextEditingController cityController = TextEditingController();
  TextEditingController pinController = TextEditingController();
  TextEditingController districtController = TextEditingController();
  TextEditingController landmarkController = TextEditingController();
  TextEditingController stateController = TextEditingController();



  final _formKey = GlobalKey<FormState>();

  final _form_data_box = Hive.box("form_data_box");
  List<Map<String, dynamic>> _items =[];

  @override
  void initState() {
    _refreshItem();
    super.initState();
  }
  final GoogleSignIn googleSignIn = GoogleSignIn();
  
  void _refreshItem(){
    final data = _form_data_box.keys.map((key)  {
      final item = _form_data_box.get(key);
      return {"key":key,"name":item["name"], "phone":item['phone'],"email":item["email"],"fssi":item["fssi"],
        "description":item["description"],
        "shopName":item["shopName"], "shopNo":item["shopNo"],  "city":item["city"],  "pin":item["pin"], "district":item["district"],


        "landMark":item["landMark"],  "state":item["state"]};
    }).toList();
    setState((){
      _items = data.reversed.toList();

    });
  }

Future<void>createItem(Map<String,dynamic> newItem) async{
  await _form_data_box.add(newItem);
  print("amount data${_form_data_box.length}");
  _refreshItem();
}
  final _userDataBox = Hive.box('user_data_box');
void signOut(){
    googleSignIn.disconnect();
    _userDataBox.clear();
    Future.delayed(
        const Duration(seconds: 2),
            () => Navigator.pushReplacement(
            context,
            MaterialPageRoute(
                builder: (context) => const SignIn(

                ))));
}





  @override
  Widget build(BuildContext context) {
    var size =MediaQuery.of(context).size;
    return 
      SafeArea(
        child: Scaffold(
        body:

        Padding(
          padding: const EdgeInsets.symmetric(horizontal: AppConstants.defaultPadding,vertical: AppConstants.defaultPadding),
          child: SingleChildScrollView(

            child:
            _items.isEmpty?
            Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  const Text("Hey",style: Style.hey, ),

                  const SizedBox(height: AppConstants.defaultPadding/2,),

                  const Text("Please Add Some Details" ,style: Style.hey,),
                  const SizedBox(height: AppConstants.defaultPadding *2,),
                  const Text("Name",style: Style.subheading),
                  const SizedBox(height: AppConstants.defaultPadding/2,),
                  CustomTextField(
                    controller: nameController,
                    hintText: "Enter Your Name",
                    validator:  (value) {
                      if (value!.isEmpty) {
                        return "enter name";
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: AppConstants.defaultPadding,),
                  const Text("Phone", style: Style.subheading),
                  const SizedBox(height: AppConstants.defaultPadding/2,),
                  CustomTextField(
                    validator:  (value) {
                      if (value!.length < 10 ) {
                        return "enter valid phone number";
                      }
                      return null;
                    },

                    keyboardType: TextInputType.phone,
                    controller: phoneController,
                    hintText: "Enter Your phone",
                  ),
                  const SizedBox(height: AppConstants.defaultPadding,),
                  const Text("Email", style: Style.subheading),
                  const SizedBox(height: AppConstants.defaultPadding/2,),
                  CustomTextField(
                    validator: (value) {
                      if(value == null || value.isEmpty || !value.contains('@') || !value.contains('.')){
                        return 'Invalid Email';
                      }
                      return null;
                    },
                    // validateEmail,
                    controller: emailController,
                    hintText: "Enter Your email",
                  ),
                  const SizedBox(height: AppConstants.defaultPadding,),
                  const Text("FSSi Code", style: Style.subheading),
                  const SizedBox(height: AppConstants.defaultPadding/2,),
                  CustomTextField(
                    controller: fssiCodeController,
                    hintText: "Enter FSSI Code",
                    validator:   (value) {
                      if (value!.length < 5 ) {
                        return "enter valid fssICode";
                      }
                      return null;
                    },
                  ),

                  const SizedBox(height: AppConstants.defaultPadding,),
                  const Text("Description", style: Style.subheading),
                  const SizedBox(height: AppConstants.defaultPadding/2,),
                  CustomTextField(
                    maxLines: 4,

                    controller: descriptionController,
                    hintText: "Description",
                    validator:   (value) {
                      if (value!.isEmpty ) {
                        return "enter description";
                      }
                      return null;
                    },
                  ),

                  const SizedBox(height: AppConstants.defaultPadding,),
                  const Text("Address", style: Style.subheading),
                  const SizedBox(height: AppConstants.defaultPadding/2,),
                  //
                  SizedBox(
                    width: MediaQuery.of(context).size.width,
                    child:Column(
                      children: [
                        CustomTextField(
                          controller: shopNameController,
                          hintText: "Shop Name",
                          validator:  (value) {
                            if (value!.isEmpty) {
                              return "Enter Shop Name";
                            }
                            return null;
                          },
                        ),
                        const SizedBox(height: AppConstants.defaultPadding,),

                        SizedBox(width: MediaQuery.of(context).size.width,

                          child: Row(
                            children: [
                              SizedBox(
                                height: 25,
                                width: size.width *0.35,
                                child: const Text(
                                  "Shop No",style: Style.subheading
                                )
                              ),
                              const Spacer(),
                              SizedBox(
                                  height: 25,
                                  width: size.width *0.35,
                                  child: const Text(
                                      "City",style: Style.subheading
                                  )
                              ),
                            ],
                          ),
                        ),

                        // SizedBox(height: AppConstants.defaultPadding/2,),


                        SizedBox(width: MediaQuery.of(context).size.width,

                        child: Row(
                          children: [
                            SizedBox(
                              // height: 50,
                              width: size.width *0.38,
                              child: CustomTextField(
                                keyboardType: TextInputType.phone,
                                validator:  (value) {
                                  if (value!.isEmpty) {
                                    return "Enter Shop Number";
                                  }
                                  return null;
                                },
                                controller: shopNumberController,
                                hintText: "Shop Number",
                              ),
                            ),
                            const Spacer(),
                            SizedBox(
                              // height: 50,
                              width: size.width *0.38,
                              child: CustomTextField(
                                validator:  (value) {
                                  if (value!.isEmpty) {
                                    return "Enter City";
                                  }
                                  return null;
                                },
                                controller: cityController,
                                hintText: "City",
                              ),
                            ),
                          ],
                        ),
                        ),


                        const SizedBox(height: AppConstants.defaultPadding/2,),

                      ],
                    ),
                  ),



                  const SizedBox(height: AppConstants.defaultPadding/2,),

                  SizedBox(width: MediaQuery.of(context).size.width,

                    child: Row(
                      children: [
                        SizedBox(
                            height: 25,
                            width: size.width *0.35,
                            child: const Text(
                                "PIN",style: Style.subheading
                            )
                        ),
                        const Spacer(),
                        SizedBox(
                            height: 25,
                            width: size.width *0.35,
                            child: const Text(
                                "District",style: Style.subheading
                            )
                        ),
                      ],
                    ),
                  ),


                  SizedBox(width: MediaQuery.of(context).size.width,

                    child: Row(
                      children: [
                        SizedBox(
                          // height: 50,
                          width: size.width *0.38,
                          child: CustomTextField(

                            validator:  (value) {
                              if (value!.isEmpty) {
                                return "Enter Pin";
                              }
                              return null;
                            },
                            keyboardType: TextInputType.phone,
                            controller: pinController,
                            hintText: "PIN",
                          ),
                        ),
                        const Spacer(),
                        SizedBox(
                          // height: 50,
                          width: size.width *0.38,
                          child: CustomTextField(
                            validator:  (value) {
                              if (value!.isEmpty) {
                                return "Enter District";
                              }
                              return null;
                            },
                            controller: districtController,
                            hintText: "District",
                          ),
                        ),
                      ],
                    ),
                  ),

                  const SizedBox(height: AppConstants.defaultPadding,),

                  SizedBox(width: MediaQuery.of(context).size.width,

                    child: Row(
                      children: [
                        SizedBox(
                            height: 25,
                            width: size.width *0.35,
                            child: const Text(
                                "Landmark",style: Style.subheading
                            )
                        ),
                        const Spacer(),
                        SizedBox(
                            height: 25,
                            width: size.width *0.35,
                            child: const Text(
                                "State",style: Style.subheading
                            )
                        ),
                      ],
                    ),
                  ),
                  SizedBox(width: MediaQuery.of(context).size.width,

                    child: Row(
                      children: [
                        SizedBox(
                          // height: 50,
                          width: size.width *0.38,
                          child: CustomTextField(
                            validator:  (value) {
                              if (value!.isEmpty) {
                                return "Enter LandMark";
                              }
                              return null;
                            },
                            // keyboardType: TextInputType.phone,
                            controller: landmarkController,
                            hintText: "LandMark",
                          ),
                        ),
                        const Spacer(),
                        SizedBox(
                          // height: 50,
                          width: size.width *0.38,
                          child: CustomTextField(
                            validator:  (value) {
                              if (value!.isEmpty) {
                                return "Enter State";
                              }
                              return null;
                            },
                            controller: stateController,
                            hintText: "State",
                          ),
                        ),
                      ],
                    ),
                  ),

                  const SizedBox(height: AppConstants.defaultPadding*1.5,),
                  Bouncing(
                    child: InkWell(
                      onTap: ()async{
                        if(_formKey.currentState!.validate()) {
                          createItem({
                            "name": nameController.text,
                            "phone": phoneController.text,
                            "email": emailController.text,
                            "fssi": fssiCodeController.text,
                            "description": descriptionController.text,
                            "shopName": shopNameController.text,
                            "shopNo": shopNumberController.text,
                            "city": cityController.text,
                            "pin": pinController.text,
                            "district": districtController.text,
                            "landMark": landmarkController.text,
                            "state": stateController.text
                          });
                        }

                      },
                      child: Container(
                        padding: const EdgeInsets.symmetric(vertical: 12,horizontal: 8),
                        width: MediaQuery.of(context).size.width,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: CommonColors.colorGreen,
                        ),

                        child: const Center(child: Text("Submit Review")),
                      ),
                    ),
                  ),
                  const SizedBox(height: AppConstants.defaultPadding,)

                  // SizedBox(
                  //   height:400 ,
                  //   child: ListView.builder(
                  //       itemCount: _items.length,
                  //       itemBuilder: (context,index){
                  //         final currentItem = _items[index];
                  //         return Card(
                  //           child:Column(
                  //             children: [
                  //               Text(currentItem['name'].toString()),
                  //               SizedBox(height: 10,),
                  //               Text(currentItem['phone'].toString()),
                  //               SizedBox(height: 10,),
                  //               // Text(data)
                  //             ],
                  //           ),
                  //         );
                  //       }),
                  // )


                ],
              ),
            )
                  : ListView.builder(
              shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: _items.length,
                itemBuilder: (context,index){
                  final currentItem = _items[index];
                  return
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Center(
                          child: Padding(
                            padding: const EdgeInsets.symmetric(vertical: 15),
                            child: Card(
                              elevation: 2.0,
                            child:Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 15,vertical: 10),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [

                                  Center(
                                    child: Column(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      crossAxisAlignment: CrossAxisAlignment.center,
                                      children: [
                                        Container(
                                          height: 80,
                                          width: 80,
                                          decoration: BoxDecoration(

                                            borderRadius: BorderRadius.circular(10),
                                            // shape: BoxShape.circle,
                                            image: const DecorationImage(
                                              image: AssetImage(ThemeAssets.logo,),fit: BoxFit.cover
                                            )
                                          ),
                                        ),

                                        // const SizedBox(height: 20,),
                                        // Text(currentItem['shopName'].toString().toUpperCase(),style: Style.heading),
                                      ],
                                    ),

                                  ),
                                  const SizedBox(height: AppConstants.defaultPadding,),




                                  Text("Name : ${currentItem['name']}",style: Style.subheading),
                                  const SizedBox(height: AppConstants.defaultPadding,),
                                  Text("Phone : ${currentItem['phone']}",style: Style.subheading),
                                  const SizedBox(height: AppConstants.defaultPadding,),
                                  Text("Email : ${currentItem['email']}",style: Style.subheading),
                                  const SizedBox(height: AppConstants.defaultPadding,),
                                  Text("FSSI : ${currentItem['fssi']}",style: Style.subheading),
                                  const SizedBox(height: AppConstants.defaultPadding,),
                                  Text("Description : ${currentItem['description']}",style: Style.subheading),
                                  const SizedBox(height: AppConstants.defaultPadding,),
                                  Text("ShopName : ${currentItem['shopName']}",style: Style.subheading),
                                  const SizedBox(height: AppConstants.defaultPadding,),

                                  Text("City : ${currentItem['city']}",style: Style.subheading),
                                  const SizedBox(height: AppConstants.defaultPadding,),
                                  Text("PIN : ${currentItem['pin']}",style: Style.subheading),
                                  const SizedBox(height: AppConstants.defaultPadding,),

                                  Text("Description : ${currentItem['description']}",style: Style.subheading),
                                  const SizedBox(height: AppConstants.defaultPadding,),
                                  Text("District : ${currentItem['district']}",style: Style.subheading),
                                  const SizedBox(height: AppConstants.defaultPadding,),

                                  Text("LandMark : ${currentItem['landMark']}",style: Style.subheading),
                                  const SizedBox(height: AppConstants.defaultPadding,),
                                  Text("State : ${currentItem['state']}",style: Style.subheading),
                                  const SizedBox(height: AppConstants.defaultPadding,),

                                  Text("Thank you ${currentItem['name']} for the review",style: Style.thanks,),
                                  const SizedBox(height: AppConstants.defaultPadding,)





                                  // Text(data)
                                ],
                              ),
                            ),
                  ),
                          ),
                        ),

                        // SizedBox(height: AppConstants.defaultPadding/2,),
                        
                        Bouncing(
                          child: InkWell(
                            onTap: (){

                              signOut();
                            },
                            child:
                            Container(
                              height: 45,
                              width: 100,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: CommonColors.colorGreen
                              ),
                              child: const Center(child: Text("SignOut",style: Style.darkColorText,)),
                            ),
                          ),
                        )
                      ],
                    );
                }),



          ),
        ),
    ),
      );
  }
}
