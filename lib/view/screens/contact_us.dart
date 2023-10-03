import 'package:flutter_faq/flutter_faq.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:untitled6/main.dart';
import 'package:untitled6/provider/contact_us_provider.dart';
import 'package:untitled6/utilities/colors.dart';
import 'package:untitled6/view/base/custom_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ContactUs extends StatefulWidget {
  const ContactUs({super.key});

  @override
  State<ContactUs> createState() => _ContactUsState();
}

class _ContactUsState extends State<ContactUs> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final _emailRegex = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{3}$');

  @override
  void initState() {
    Provider.of<ContactUsProvider>(context,listen: false).getContactUs();
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffF5F0E6),
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage("lib/assets/images/shrine_bg.png"),
            fit: BoxFit.cover,
          ),
        ),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Stack(
                children: <Widget>[
                  Image.asset(
                    'lib/assets/images/shrine.png',
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                  Positioned(
                    top: 80.h,
                    left: 14.w,
                    //give the values according to your requirement
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                            padding: EdgeInsets.all(3.r),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8.r),
                              color: Colors.white,
                            ),
                            child: Center(
                              child: IconButton(
                                  style: const ButtonStyle(),
                                  icon: Icon(
                                    Icons.arrow_back_ios,
                                    size: 20.sp,
                                  ),
                                  onPressed: () {
                                    Navigator.pop(context);
                                  }),
                            )),
                        SizedBox(
                          width: 250.w,
                        ),
                        Align(
                          alignment: Alignment.topRight,
                          child: CustomText(
                            text: "اتصل بنا",
                            fontSize: 24.sp,
                            fontWeight: FontWeight.w400,
                            color: Colors.white,
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ),
              Consumer<ContactUsProvider>(builder: (context, providerContactUs, child) {
                if(providerContactUs.loading){
                  return Center(child: CircularProgressIndicator(),);
                }
                else if(providerContactUs.ContactUs !=null ){
                  return  Container(
                    width: double.infinity,
                    height: 600.h,
                    padding: EdgeInsets.symmetric(horizontal: 18.w),
                    child: SingleChildScrollView(
                      child: Form(key: _formKey,
                        child: Column(
                          children: [
                            SizedBox(height: 25.h),
                            TextFormField(
                              validator: (value){
                                if(value == null || value.isEmpty){
                                  return 'يرجى تقديم الاسم الكامل';
                                }
                              },
                              controller: providerContactUs.nameController,
                              decoration: InputDecoration(
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(
                                      10.0), // Set the desired border radius
                                ),
                                labelText: 'الاسم الكامل',
                                labelStyle: TextStyle(
                                    fontFamily: 'gesndbook',
                                    fontSize: 16.sp,
                                    fontWeight: FontWeight.w400,
                                    color: const Color(0xff979797)),
                                hintText: 'مثلا محمد قاسم',
                                contentPadding: EdgeInsets.fromLTRB(32.w, 18.h, 0.0,
                                    18.h), // 15 units of left padding
                              ),
                              style:
                              GoogleFonts.poppins(color: const Color(0xff263238)),
                            ),
                            SizedBox(height: 19.h),
                            TextFormField(
                              controller: providerContactUs.emailController,
                              validator: (value){
                                if(value == null || value.isEmpty){
                                  return 'توفير البريد الإلكتروني';
                                }else if (!_emailRegex.hasMatch(value)) {
                                  return 'يرجى إدخال عنوان بريد إلكتروني صالح';
                                }
                              },
                              decoration: InputDecoration(
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(
                                      10.0), // Set the desired border radius
                                ),

                                labelText: 'الايميل',
                                labelStyle: TextStyle(
                                    fontFamily: 'gesndbook',
                                    fontSize: 16.sp,
                                    fontWeight: FontWeight.w400,
                                    color: const Color(0xff979797)),
                                hintText: 'K********i.ux@gmail.com',
                                contentPadding: EdgeInsets.fromLTRB(32.w, 18.h, 0.0,
                                    18.h), // 15 units of left padding
                              ),
                              style:
                              GoogleFonts.poppins(color: const Color(0xff263238)),
                            ),
                            SizedBox(height: 19.h),
                            TextFormField(
                              controller: providerContactUs.messageController,
                              maxLines: 5,
                              validator: (value){
                                if(value == null || value.isEmpty){
                                  return 'من فضلك اكتب شيا';
                                }
                              },
                              decoration: InputDecoration(
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(
                                      10.0), // Set the desired border radius
                                ),
                                labelText: 'رسالة',

                                labelStyle: TextStyle(
                                    fontFamily: 'gesndbook',
                                    fontSize: 16.sp,
                                    fontWeight: FontWeight.w400,
                                    color: const Color(0xff979797)),
                                hintText: 'من فضلك اكتب شيا',
                                contentPadding: EdgeInsets.fromLTRB(32.w, 18.h, 0.0,
                                    18.h), // 15 units of left padding
                              ),
                              style:
                              GoogleFonts.poppins(color: const Color(0xff263238)),
                            ),
                            SizedBox(height: 19.h),
                            providerContactUs.ButtonLoading? CircularProgressIndicator():ElevatedButton(

                              onPressed: () {
                                if(_formKey.currentState!.validate()){
                                  providerContactUs.postContactUsMessage();
                                }

                                // Add your onPressed logic here
                                // Navigator.push(context,MaterialPageRoute(builder: (context) => Mainscreen()));
                              },
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Color(0xFF8E1839),
                                // Replace with your desired hex color code
                                minimumSize: Size(315.w, 52.h),
                                // Set the desired width and height
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(
                                      10.0), // Set the desired border radius
                                ),
                                elevation:
                                0.0, // Set elevation to 0 to remove the shadow
                              ),
                              child: Center(
                                child: Text(
                                  'تسجيل الدخول',
                                  style: TextStyle(
                                    fontFamily: 'gesndbook',
                                    fontWeight: FontWeight.w600,
                                    fontSize: 16.sp, // Adjust the font size as needed
                                    color: Colors.white, // Text color
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 30.h,
                            ),
                            Consumer<ContactUsProvider>(
                              builder: (context, contactus, child) {
                                return contactus.ContactUs !=0?
                                Column(
                                  children: [
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      children: [
                                        CustomText(
                                          text: "${contactus.ContactUs.contacInfo?.phoneNumber1}",
                                          color: Color(0xff979797),
                                        ),
                                        SizedBox(
                                          width: 10.h,
                                        ),
                                        Icon(
                                          Icons.phone,
                                          size: 24.sp,
                                          color: kPrimaryColor,
                                        )
                                      ],
                                    ),
                                    SizedBox(
                                      height: 5.h,
                                    ),
                                    // Row(
                                    //   mainAxisAlignment: MainAxisAlignment.end,
                                    //   children: [
                                    //     CustomText(
                                    //       text: "${contactus.ContactUs.contacInfo?.phoneNumber2}",
                                    //       color: Color(0xff979797),
                                    //     ),
                                    //     SizedBox(
                                    //       width: 10.h,
                                    //     ),
                                    //     Icon(
                                    //       Icons.phone,
                                    //       size: 24.sp,
                                    //       color: kPrimaryColor,
                                    //     )
                                    //   ],
                                    // ),
                                    // SizedBox(
                                    //   height: 5.h,
                                    // ),
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      children: [
                                        CustomText(
                                          text: "${contactus.ContactUs.contacInfo?.email}",
                                          color: Color(0xff979797),
                                        ),
                                        SizedBox(
                                          width: 10.h,
                                        ),
                                        Icon(
                                          Icons.email,
                                          size: 24.sp,
                                          color: kPrimaryColor,
                                        )
                                      ],
                                    ),
                                    // SizedBox(
                                    //   height: 5.h,
                                    // ),
                                    // Row(
                                    //   mainAxisAlignment: MainAxisAlignment.end,
                                    //   children: [
                                    //     CustomText(
                                    //       text: "${contactus.ContactUs.contacInfo?.address}",
                                    //       color: Color(0xff979797),
                                    //     ),
                                    //     SizedBox(
                                    //       width: 10.h,
                                    //     ),
                                    //     Icon(
                                    //       Icons.home,
                                    //       size: 24.sp,
                                    //       color: kPrimaryColor,
                                    //     )
                                    //   ],
                                    // ),
                                  ],
                                ):CircularProgressIndicator();
                              },
                            )
                          ],
                        ),
                      ),
                    ),
                  );
                }
                else {
                  return  Center(child: Text('No Data Found '),);
                }

              },),

            ],
          ),
        ),
      ),
    );
  }
}