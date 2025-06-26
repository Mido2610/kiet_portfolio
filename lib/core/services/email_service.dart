import 'package:emailjs/emailjs.dart' as emailjs;
import 'package:flutter/material.dart';

class EmailService {
  static const String _serviceId = 'service_varezm7';
  static const String _templateId = 'template_9ilmvyl';
  static const String _publicKey = 'QNZoT27CnFHgZrG6N';
  static const String _privateKey = 'r04ySolP1UUMmNxKUuuh2';

  static Future<bool> sendContactEmail({
    required String name,
    required String email,
    required String subject,
    required String message,
  }) async {
    try {
      emailjs.init(
        emailjs.Options(publicKey: _publicKey, privateKey: _privateKey),
      );

      final templateParams = {
        'name': name,
        'email': email,
        'title': subject,
        'message': message,
      };

      // Gửi email
      final response = await emailjs.send(
        _serviceId,
        _templateId,
        templateParams,
      );

      return response.status == 200;
    } catch (error) {
      if (error is emailjs.EmailJSResponseStatus) {
        debugPrint('🚨 EmailJS error ${error.status}: ${error.text}');
      }

      return false;
    }
  }
}


/*
HƯỚNG DẪN SETUP EMAILJS:

1. Đăng ký tài khoản EmailJS tại: https://www.emailjs.com/
2. Tạo Email Service (Gmail/Outlook)
3. Tạo Email Template với các biến:
   - {{name}}
   - {{email}} 
   - {{title}}
   - {{message}}
4. Lấy Service ID, Template ID, và Public Key
5. Cập nhật file .env

TEMPLATE EMAIL HIỆN TẠI:
Subject: {{title}}

A message by {{name}} has been received. Kindly respond at your earliest convenience.

Email: {{email}}

Subject Title: {{title}}

{{name}}

{{message}}

API TEST COMMAND:
emailjs.send("service_varezm7","template_9ilmvyl",{
  title: "Kiet test",
  name: "Kiet",
  email: "kiet0933362664@gmail.com",
  message: "TESTESTSETESTESTSETes",
});
*/