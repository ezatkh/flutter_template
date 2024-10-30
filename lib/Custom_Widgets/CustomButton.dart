import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  final bool isLoading;
  final Color color; // لون الخلفية للزر
  final Color textColor; // لون النص

  const CustomButton({
    required this.text,
    required this.onPressed,
    this.isLoading = false,
    this.color = const Color(0xFFC62828), // لون افتراضي للزر
    this.textColor = Colors.white, // لون النص الافتراضي
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    // عرض الزر بحجم يتناسب مع حجم الشاشة
    double buttonWidth = ScreenUtil().screenWidth * 0.7; // 70% من عرض الشاشة

    return Center(
      child: SizedBox(
        width: buttonWidth, // العرض المحدد للزر
        child: ElevatedButton(
          onPressed: isLoading ? null : onPressed, // تعطيل الزر عند التحميل
          style: ElevatedButton.styleFrom(
            backgroundColor: color, // استخدام لون الزر المخصص
            foregroundColor: textColor, // استخدام لون النص المخصص
            padding: EdgeInsets.symmetric(vertical: 12.0.h), // الحشوة
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20.r), // الحواف الدائرية
            ),
            elevation: 4, // العمق
            textStyle: theme.textTheme.labelLarge?.copyWith(
              fontWeight: FontWeight.bold,
              fontSize: 16.sp, // حجم الخط
              fontFamily: 'NotoSansUI',
            ),
          ),
          child: isLoading
              ? const SizedBox(
            height: 24, width: 24,
            child: CircularProgressIndicator(
              strokeWidth: 2, color: Colors.white,
            ),
          )
              : Text(
            text,
            style: TextStyle(color: textColor), // تطبيق لون النص المخصص
          ),
        ),
      ),
    );
  }
}
