// =========================================================
// ملف اختبارات الواجهة (Widget Test) لتطبيق النخبة
// يتأكد من ظهور البيانات الأساسية وتبديل الشاشات دون أخطاء
// =========================================================

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:elite_team_app/main.dart'; // استيراد الملف الرئيسي للتطبيق

void main() {
  testWidgets('اختبار التحقق من عرض بيانات العضوية والشاشة الرئيسية', (WidgetTester tester) async {
    // 1. تشغيل التطبيق بداخل بيئة الاختبار
    await tester.pumpWidget(const EliteTeamApp());

    // الانتظار حتى اكتمال بناء الشاشة واستعادة اللغة
    await tester.pumpAndSettle();

    // 2. التحقق من ظهور اسم العضو ورقم العضوية
    expect(find.text('وليد أحمد حسين'), findsOneWidget);
    expect(find.text('رقم العضوية: 820863369'), findsOneWidget);

    // 3. التحقق من وجود أيقونات الخدمات
    expect(find.byIcon(Icons.health_and_safety), findsOneWidget);
    expect(find.byIcon(Icons.account_balance_wallet), findsOneWidget);
  });
}
