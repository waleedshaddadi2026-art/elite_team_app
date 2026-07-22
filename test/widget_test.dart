// =========================================================
// ملف اختبارات الواجهة (Widget Test) لتطبيق النخبة
// يختبر تشغيل التطبيق والتحقق من اسم العضو ورقم العضوية
// =========================================================

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:elite_team_app/main.dart'; // استيراد تطبيق النخبة الرئيسي

void main() {
  testWidgets('اختبار التحقق من الشاشة الرئيسية وقائمة الخدمات', (WidgetTester tester) async {
    // تهيئة mock لقيم SharedPreferences قبل بناء الواجهة
    SharedPreferences.setMockInitialValues({ 'locale_code': 'ar' });

    // 1. بناء التطبيق داخل بيئة الاختبار
    await tester.pumpWidget(const EliteTeamApp());

    // الانتظار لحين اكتمال إعداد الرسوم والترجمة
    await tester.pumpAndSettle();

    // 2. التحقق من عرض بيانات العضوية المعتمدة
    expect(find.text('وليد أحمد حسين'), findsOneWidget);
    expect(find.text('رقم العضوية: 820863369'), findsOneWidget);

    // 3. التحقق من وجود أزرار الخدمات
    expect(find.byIcon(Icons.health_and_safety), findsOneWidget);
    expect(find.byIcon(Icons.account_balance_wallet), findsOneWidget);
  });
}
