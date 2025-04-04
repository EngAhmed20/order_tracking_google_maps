import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:practical_google_maps_example/core/styling/app_colors.dart';

class HomeScr extends StatelessWidget {
  const HomeScr({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Home',
          style: TextStyle(
              fontSize: 30, fontWeight: FontWeight.bold, color: Colors.white),
        ),
        centerTitle: true,
        backgroundColor: AppColors.primaryColor,
        automaticallyImplyLeading: false,
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.h,vertical: 32.h),
        child: GridView(
          gridDelegate:
              SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2,mainAxisSpacing: 20.sp,crossAxisSpacing: 10.sp,),
          children: [
            InkWell(
              onTap: (){},
              borderRadius: BorderRadius.circular(10.r),
              radius: 10,
              child: Container(
                decoration: BoxDecoration(
                    color: AppColors.primaryColor,
                    borderRadius: BorderRadius.circular(10.r)),
                margin: EdgeInsets.all(4.sp),
                child: const Center(
                    child: Text(
                  'Orders',
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                      color: Colors.white),
                )),
              ),
            ),
            InkWell(
              onTap: (){},
              borderRadius: BorderRadius.circular(10.r),
              radius: 10,
              child: Container(
                decoration: BoxDecoration(
                    color: AppColors.primaryColor,
                    borderRadius: BorderRadius.circular(10.r)),
                margin: EdgeInsets.all(4.sp),
                child: const Center(
                    child: Text(
                      'Add Orders',
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w600,
                          color: Colors.white),
                    )),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
