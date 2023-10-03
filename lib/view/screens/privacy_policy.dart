//
//
// import "package:flutter/material.dart";
// import "package:flutter_screenutil/flutter_screenutil.dart";
// import "package:provider/provider.dart";
// import "../../provider/policy_provider.dart";
//
//
// class PrivacyPolicyPage extends StatefulWidget {
//   @override
//   State<PrivacyPolicyPage> createState() => _PrivacyPolicyPageState();
// }
//
// class _PrivacyPolicyPageState extends State<PrivacyPolicyPage> {
//   @override
//   void initState() {
//     Provider.of<PrivacyProvider>(context,listen: false).getPrivacyPolicy();
//     // TODO: implement initState
//     super.initState();
//   }
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//           title: const Text('سياسة المنصة التعليمية',style: TextStyle(
//             fontSize: 20,
//             fontFamily: 'gesndbook',
//             color: Colors.white,
//           ))),
//
//       body: SingleChildScrollView(
//         physics: BouncingScrollPhysics(),
//         padding: EdgeInsets.all(16.0),
//         child: Card(
//             elevation: 2,
//
//             child: Consumer<PrivacyProvider>(builder: (context, provider, child) {
//               if(provider.loading){
//                 return const Center(child: CircularProgressIndicator());
//               } else if( provider.PrivacyPolicy != null )  {
//                 return Container(
//                   padding: EdgeInsets.all(10.r),
//                   child: Text("""" ${provider.PrivacyPolicy.data!.body!}"""
//                     // style: TextStyle(
//                     //   fontSize: 14.sp,
//                     //   fontFamily: 'gesndbook',
//                     //   color: Color(0xff979797),
//                     // ),
//                     // textAlign: TextAlign.right,
//                   ),
//                 );
//               }
//               else{
//                 return const Center(child: Text('Not found'),);
//               }
//
//             },)
//
//         ),
//       ),
//     );
//   }
// }

import "package:flutter/material.dart";
import "package:flutter_screenutil/flutter_screenutil.dart";

class PrivacyPolicyPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: const Text('سياسة المنصة التعليمية',style: TextStyle(
            fontSize: 20,
            fontFamily: 'gesndbook',
            color: Colors.white,
          ))),

      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: Card(
          elevation: 2,

          child: Container(
            padding: EdgeInsets.all(10.r),
            child: Text(
              '''
١. سياسة الخصوصية للتطبيق الإسلامي

نحن نعتز بخصوصية مستخدمي التطبيق الإسلامي، ونلتزم بحماية معلوماتهم الشخصية. يُرجى قراءة سياسة الخصوصية التالية لفهم كيفية جمع واستخدام المعلومات الشخصية التي نقوم بجمعها.

٢. المعلومات التي نجمعها:
   - عند استخدام التطبيق، نقوم بجمع المعلومات التي تقدمها طوعًا، مثل الاسم وعنوان البريد الإلكتروني، ومعلومات أخرى ذات صلة.

٣. كيفية استخدام المعلومات:
   - نستخدم المعلومات التي نجمعها لتحسين تجربتك مع التطبيق وتخصيص المحتوى والخدمات.
   - نحن لا نشارك معلومات المستخدمين مع أطراف ثالثة دون موافقتهم.

٤. الأمان:
   - نتخذ إجراءات أمان مناسبة لحماية المعلومات الشخصية ومنع الوصول غير المصرح به.

٥. التغييرات في سياسة الخصوصية:
   - نحتفظ بحق تحديث سياسة الخصوصية هذه، ويجب على المستخدمين مراجعتها بشكل دوري لمعرفة أحدث التغييرات.

٦. الاتصال بنا:
   - إذا كان لديك أي استفسار حول سياسة الخصوصية أو مخاوف أمان، يمكنك الاتصال بنا عبر البريد الإلكتروني: support@example.com.

تاريخ سريان سياسة الخصوصية: يناير 1، 2023
              ''',
              style: TextStyle(
                fontSize: 14.sp,
                fontFamily: 'gesndbook',
                color: Color(0xff979797),
              ),
              textAlign: TextAlign.right,
            ),
          ),
        ),
      ),
    );
  }
}
