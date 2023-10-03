import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:untitled6/utilities/app_constant.dart';

class Drawer1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: Icon(
              Icons.arrow_back_outlined,
              size: 20,
              color: Colors.white,
            )),
        title: Text(
          'سياسة الخصوصيَّة',
          style: TextStyle(
            fontSize: 20.sp,
            fontFamily: 'gesndbook',
            color: Colors.white,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(5.r),
          child: Card(
            elevation: 2,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 10.h),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment:
                    CrossAxisAlignment.end, // Align text to the right
                children: <Widget>[
                  Directionality(
                    textDirection: TextDirection
                        .rtl, // Set text direction to right-to-left
                    child: Text(
                      "حِرصًا من إدارة مُجَمَّع الشَّيخ عبدالله الأنصاريّ للقرآن الكريم وعلومه على تحقيق أهداف المنصَّة، والتزامًا منَّا بأخلاقيَّات النَّشر العلميّ فإنَّ سياسةَ الخصوصيَّة تقومُ على:",
                      style: TextStyle(
                        fontSize: 16.sp,
                        fontFamily: 'gesndbook',
                        color: Color(0xff979797),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20.h,
                  ),
                  Directionality(
                    textDirection: TextDirection.rtl,
                    child: Text(
                      "-حماية خصوصية مستخدمي المنصة، والمحافظة على سرية بياناتهم.",
                      style: TextStyle(
                        fontSize: 12.sp,
                        fontFamily: 'gesndbook',
                        color: Color(0xff979797),
                      ),
                    ),
                  ),
                  Directionality(
                    textDirection: TextDirection.rtl,
                    child: Text(
                      "-التأكد من هوية المستخدمين، وتمكينهم من الاستخدام الآمن للمادة المتاحة.",
                      style: TextStyle(
                        fontSize: 12.sp,
                        fontFamily: 'gesndbook',
                        color: Color(0xff979797),
                      ),
                    ),
                  ),
                  Directionality(
                    textDirection: TextDirection.rtl,
                    child: Text(
                      "-التواصل مع مستخدمي المنصة بفاعلية حال حدوث مشكلات ترتبط بكيفية الدخول.",
                      style: TextStyle(
                        fontSize: 12.sp,
                        fontFamily: 'gesndbook',
                        color: Color(0xff979797),
                      ),
                    ),
                  ),
                  Directionality(
                    textDirection: TextDirection.rtl,
                    child: Text(
                      "-يعني ذلك أن المجمع يلتزم بعدم مشاركة أو إفشاء بيانات المستخدمين للغير دون إذنهم.",
                      style: TextStyle(
                        fontSize: 12.sp,
                        fontFamily: 'gesndbook',
                        color: Color(0xff979797),
                      ),
                    ),
                  ),
                  Directionality(
                    textDirection: TextDirection.rtl,
                    child: Text(
                      "-يجب على المنصة اتخاذ إجراءات أمنية مناسبة للحفاظ على سرية المعلومات والبيانات الشخصية للمستخدمين، مثل تشفير البيانات وتطبيق إجراءات أمان قوية.",
                      style: TextStyle(
                        fontSize: 12.sp,
                        fontFamily: 'gesndbook',
                        color: Color(0xff979797),
                      ),
                    ),
                  ),
                  Directionality(
                    textDirection: TextDirection.rtl,
                    child: Text(
                      "-التأكد من هوية المستخدمين وتمكينهم من الاستخدام الآمن للمادة المتاحة:",
                      style: TextStyle(
                        fontSize: 12.sp,
                        fontFamily: 'gesndbook',
                        color: Color(0xff979797),
                      ),
                    ),
                  ),
                  Directionality(
                    textDirection: TextDirection.rtl,
                    child: Text(
                      "-يمكن أن يتضمن هذا تقديم معلومات دخول دقيقة وآمنة للمستخدمين، مثل اسم المستخدم وكلمة المرور.",
                      style: TextStyle(
                        fontSize: 12.sp,
                        fontFamily: 'gesndbook',
                        color: Color(0xff979797),
                      ),
                    ),
                  ),
                  Directionality(
                    textDirection: TextDirection.rtl,
                    child: Text(
                      "-يجب أن يتم التحقق من هوية المستخدمين في حالة الوصول إلى مواد تعليمية أو محتوى حصري عبر توفير إجراءات مثل تسجيل الدخول المتعدد العوامل (Two-Factor Authentication) للمستخدمين.",
                      style: TextStyle(
                        fontSize: 12.sp,
                        fontFamily: 'gesndbook',
                        color: Color(0xff979797),
                      ),
                    ),
                  ),
                  Directionality(
                    textDirection: TextDirection.rtl,
                    child: Text(
                      "-التواصل مع مستخدمي المنصة بفاعلية في حالة حدوث مشكلات ترتبط بكيفية الدخول:",
                      style: TextStyle(
                        fontSize: 12.sp,
                        fontFamily: 'gesndbook',
                        color: Color(0xff979797),
                      ),
                    ),
                  ),
                  Directionality(
                    textDirection: TextDirection.rtl,
                    child: Text(
                      "-يشير هذا إلى وجود آليات للتواصل مع المستخدمين عند وجود مشكلات تتعلق بعمليات تسجيل الدخول أو الوصول إلى المنصة.",
                      style: TextStyle(
                        fontSize: 12.sp,
                        fontFamily: 'gesndbook',
                        color: Color(0xff979797),
                      ),
                    ),
                  ),
                  Directionality(
                    textDirection: TextDirection.rtl,
                    child: Text(
                      AppConstant.privacypolicy,
                      style: TextStyle(
                        fontSize: 12.sp,
                        fontFamily: 'gesndbook',
                        color: Color(0xff979797),
                      ),
                    ),
                  ),
                  Directionality(
                    textDirection: TextDirection.rtl,
                    child: Text(
                      "-يمكن أن تشمل هذه الآليات إمكانية التواصل مع فريق دعم فني أو توفير وسائل للتواصل مثل البريد الإلكتروني أو أرقام هواتف الدعم.",
                      style: TextStyle(
                        fontSize: 12.sp,
                        fontFamily: 'gesndbook',
                        color: Color(0xff979797),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
