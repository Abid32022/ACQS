import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';
import '../../utilities/colors.dart';
import '../base/custom_text.dart';



class VIEWPDF extends StatefulWidget {
  String path;
  VIEWPDF({Key? key,required this .path}) : super(key: key);

  @override
  State<VIEWPDF> createState() => _VIEWPDFState();
}

class _VIEWPDFState extends State<VIEWPDF> {
  @override
  Widget build(BuildContext context) {
    print('-----------------------------------${widget.path}');
    return Scaffold(

      appBar: AppBar(
        leadingWidth: double.infinity,
        toolbarHeight: 70,
        leading: Padding(
          padding: EdgeInsets.only(left: 10.w,right: 10.w,top: 20.h, bottom: 20.h),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                  height: 36.h,
                  width: 36.w,
                  padding: EdgeInsets.all(4).r,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(8.r)),
                  child: GestureDetector(
                      onTap: (){
                        Navigator.pop(context);
                      },
                      child: Center(
                          child: Icon(
                            Icons.arrow_back_ios_new_sharp,
                            size: 20.sp,
                            color: kPrimaryColor,
                          )))),
              CustomText(
                text: "عرض الكتاب",
                fontSize: 24.sp,
                fontWeight: FontWeight.w400,
              )
            ],
          ),
        ),
      ),
      body: Column(children: [

        /*SfPdfViewer.asset(
                'assets/time.pdf',
              )*/
        if(widget.path != null)
          Expanded(
              child:
              SfPdfViewer.network(
                  widget.path)),
        if(widget.path == null)
          const Center(
            child: Text(
              "File Not Found",
              style: TextStyle(fontWeight: FontWeight.w700,color: Colors.black),
            ),
          ),
      ],),
    );
  }
}