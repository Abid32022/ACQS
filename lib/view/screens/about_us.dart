import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:untitled6/utilities/colors.dart';


class AboutUs extends StatefulWidget {
  const AboutUs({super.key});

  @override
  State<AboutUs> createState() => _AboutUsState();
}

class _AboutUsState extends State<AboutUs> {
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
                    child: Container(
                        height: 36.h,
                        width: 36.w,
                        padding: EdgeInsets.only(left: 2),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8.r),
                          color: Colors.white,
                        ),
                        child: Center(
                          child: IconButton(
                              style: const ButtonStyle(
                              ),
                              icon: Icon(
                                Icons.arrow_back_ios,
                                size: 20.sp,
                              ),
                              onPressed: () {
                                Navigator.pop(context);
                              }),
                        )),
                  ),
                ],
              ),
              SizedBox(height: 36.h,),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 13.w, ),
                child: Container(
                  width: 366.w,
                  // height: 435.h,
                  // padding: EdgeInsets.symmetric(vertical: 20.h),
                  decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.25),
                        // Shadow color
                        spreadRadius: 0,
                        // Spread radius
                        blurRadius: 4,
                        // Blur radius
                        offset: const Offset(2, 2), // Offset of the shadow
                      ),
                    ],
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(8.r),
                    border:
                    Border.all(color: const Color(0x1a000000), width: 1.r),
                  ),
                  child: Padding(
                    padding: EdgeInsets.fromLTRB(22.w, 45.h, 22.w, 76.95.h),
                    child: Stack(
                      children: [
                        // Positioned(
                        //     right: 0,
                        //     left: 0,
                        //     top: 80,
                        //     child: Image.asset("lib/assets/vectors/img_2.png",height: 308.h,width: 125.w,)),
                        Container(
                          child: Column(
                            children: [
                              // Image.asset("lib/assets/images/mosquelogo.png"),
                              Padding(
                                padding:  EdgeInsets.symmetric(horizontal: 10.h),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Image.asset(
                                      "lib/assets/images/logo.png",
                                      width: 14.w,
                                      height: 32.h,
                                    ),

                                    Align(
                                      alignment: Alignment.centerRight,
                                      child: Text(
                                        'عن التطبيق الالكتروني',
                                        style: TextStyle(
                                          fontSize: 24.sp,
                                          color: kPrimaryColor,
                                          fontWeight: FontWeight.w400,
                                          fontFamily: 'gesndbook',
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(
                                height: 30.h,
                              ),
                              Text(
                                "منصة تعليمية مجانية تتبع مجمع الشيخ عبدالله الأنصاري في قطر هي موقع إلكتروني أو تطبيق تعليمي يقدم مجموعة شاملة من الموارد التعليمية والمعرفية في مجال العلوم القرآنية والإسلامية. تهدف هذه المنصة إلى توفير فرص التعلم والتثقيف بشكل مجاني ومتاح للجميع. تشمل خدماتها محاضرات: تقدم المنصة مجموعة من المحاضرات المبسطة والمفصلة حول مواضيع متعددة في العلوم القرآنية والإسلامية. يمكن للمستخدمين الاستماع إلى هذه المحاضرات واستفادة من الشروحات والتوجيهات المقدمة.:",

                                textAlign: TextAlign.right,
                                style: TextStyle(
                                  fontSize: 12.sp,
                                  color: Colors.black,
                                  fontWeight: FontWeight.w400,
                                  fontFamily: 'gesndbook',
                                ),
                              ),

                              // SizedBox(
                              //   height: 10.h,
                              // ),
                              SizedBox(
                                height: 10.h,
                              ),
                              Text(
                                "دورات تعليمية: توفر المنصة دورات تعليمية متخصصة تغطي مجموعة متنوعة من المواضيع الدينية والقرآنية. يمكن للمتعلمين الاشتراك في هذه الدورات واستكمالها عبر الإنترنت.",
                                // "متعددة في العلوم القرآنية والإسلامية. يمكن للمستخدمين الاستماع إلى هذه المحاضرات واستفادة من الشروحات والتوجيهات المقدمة",
                                textAlign: TextAlign.right,
                                style: TextStyle(
                                  fontSize: 12.sp,
                                  color: Colors.black,
                                  fontWeight: FontWeight.w400,
                                  fontFamily: 'gesndbook',
                                ),
                              ),
                              SizedBox(
                                height: 10.h,
                              ),
                              Text(
                                "محاضرات: تقدم المنصة مجموعة من المحاضرات المبسطة والمفصلة حول مواضيع متعددة في العلوم القرآنية والإسلامية. يمكن للمستخدمين الاستماع إلى هذه المحاضرات واستفادة من الشروحات والتوجيهات المقدمة",
                                textAlign: TextAlign.right,
                                style: TextStyle(
                                  fontSize: 12.sp,
                                  color: Colors.black,
                                  fontWeight: FontWeight.w400,
                                  fontFamily: 'gesndbook',
                                ),
                              ),

                              SizedBox(
                                height: 10.h,
                              ),
                              Text(
                                "كتب مجانية: توفر المنصة مكتبة رقمية تحتوي على مجموعة من الكتب والمصادر الدينية المجانية. يمكن للمستخدمين تنزيل هذه الكتب والاستفادة منها في أبحاثهم ودراستهم.",
                                // 'تيسيرُ عمليَّات التَّواصُل بينَ رُكَني العمليَّة التَّعليميَّة [الطَّالب والأستاذ] من ناحية، وإدارة مُجَمَّع الشَّيخ عبدالله الأنصاريّ للقرآن الكريم وعلومه من ناحيةٍ أخرى',
                                textAlign: TextAlign.right,
                                style: TextStyle(
                                  fontSize: 12.sp,
                                  color: Colors.black,
                                  fontWeight: FontWeight.w400,
                                  fontFamily: 'gesndbook',
                                ),
                              ),

                              SizedBox(
                                height: 10.h,
                              ),
                              Text(
                                "",
                                // "النُّهوض بمركز الدّراسات الإسلاميَّة الَّذي يُشرفُ عليه مُجَمَّع الشَّيخ عبدالله الأنصاريّ للقرآن الكريم وعلومه، ليصيرَ في مصافّ المراكز المُتقدّمة للعُلُوم الشَّرعيَّة في المنطقة العربيَّة.",
                                textAlign: TextAlign.right,
                                style: TextStyle(
                                  fontSize: 12.sp,
                                  color: Colors.black,
                                  fontWeight: FontWeight.w400,
                                  fontFamily: 'gesndbook',
                                ),
                              ),
                              SizedBox(
                                height: 10.h,
                              ),
                              Text(
                                "",
                                // "إيجاد حَلْقة وصلٍ بينَ العُلُوم الشَّرعيَّة والواقع المُعاصر، بهدف تعريف أولي الأمر بالأحكام الشَّرعيَّة لمُستجدَّات العصر استنادًا إلى أصول الفقه وقواعده وضوابط الاستنباط ومقاصد الشَّريعة الإسلاميَّة المُستمدَّة من القرآن الكريم والسُّنَّة النَّبويَّة.",
                                textAlign: TextAlign.right,
                                style: TextStyle(
                                  fontSize: 12.sp,
                                  color: Colors.black,
                                  fontWeight: FontWeight.w400,
                                  fontFamily: 'gesndbook',
                                ),
                              ),

                            ],

                          ),
                        ),

                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(height: 20.h,),

            ],
          ),
        ),
      ),
    );
  }
}