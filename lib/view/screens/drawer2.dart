import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Drawer2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: GestureDetector(
            onTap: (){
              Navigator.pop(context);
            },
            child: Icon(Icons.arrow_back_outlined,size:20,color: Colors.white,)),
        title: Text(
          'أهداف المنصَّة',
          style: TextStyle(
            fontSize: 20.sp,
            fontFamily: 'gesndbook',
            color: Colors.white,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding:  EdgeInsets.symmetric(horizontal: 10.w,vertical: 10.h),
          child: Card(
            elevation: 2,
            child: Padding(
              padding:  EdgeInsets.symmetric(horizontal: 5.w,vertical: 0.h),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.end,// Align text to the right
                children: <Widget>[
                  Directionality(
                    textDirection: TextDirection.rtl, // Set text direction to right-to-left
                    child: Text(
                     "- توفير بيئةٍ تعليميَّةٍ تفاعُليَّة، تتوافرُ فيها المادَّة السَّمعيَّة والبصريَّة والمقروءة الَّتي تُساعدُ طلبة العلم على تلقّي العلم بسهولةٍ ويُسر.",
                      style: TextStyle(
                        fontSize: 14.sp,
                        fontFamily: 'gesndbook',
                        color: Color(0xff979797),
                      ),
                    ),
                  ),
                  SizedBox(height: 20.h,),
                  Directionality(
                    textDirection: TextDirection.rtl,
                    child: Text(
                      "- تحقيق رؤية مُجَمَّع الشَّيخ عبدالله الأنصاريّ للقرآن الكريم وعلومه الَّتي ترمي إلى نشر العلوم الشَّرعيَّة بهدف نشر الدَّعوة الإسلاميَّة على نحوٍ يتَّسمُ بالموضوعيَّة والتَّوسُّط.",
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
                      "	- تمكين طلبة العلم الشَّرعيّ من التَّعلُّم على أيدي أساتذة مُختَّصِّين، يجمعونَ إلى معرفتهم بالعلوم الشَّرعيَّة تكوينًا أكاديميًّا وفكرًا علميًّا مُعتدلًا",
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
                      "- تيسيرُ عمليَّات التَّواصُل بينَ رُكَني العمليَّة التَّعليميَّة [الطَّالب والأستاذ] من ناحية، وإدارة مُجَمَّع الشَّيخ عبدالله الأنصاريّ للقرآن الكريم وعلومه من ناحيةٍ أخرى",
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
                     "- النُّهوض بمركز الدّراسات الإسلاميَّة الَّذي يُشرفُ عليه مُجَمَّع الشَّيخ عبدالله الأنصاريّ للقرآن الكريم وعلومه، ليصيرَ في مصافّ المراكز المُتقدّمة للعُلُوم الشَّرعيَّة في المنطقة العربيَّة",
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
                    "	- إيجاد حَلْقة وصلٍ بينَ العُلُوم الشَّرعيَّة والواقع المُعاصر، بهدف تعريف أولي الأمر بالأحكام الشَّرعيَّة لمُستجدَّات العصر استنادًا إلى أصول الفقه وقواعده وضوابط الاستنباط ومقاصد الشَّريعة الإسلاميَّة المُستمدَّة من القرآن الكريم والسُّنَّة النَّبويَّة",
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
