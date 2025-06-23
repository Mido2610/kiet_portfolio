import 'package:emailjs/emailjs.dart' as emailjs;
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

class EmailService {
  static String get _serviceId => dotenv.env['EMAILJS_SERVICE_ID'] ?? '';
  static String get _templateId => dotenv.env['EMAILJS_TEMPLATE_ID'] ?? '';
  static String get _publicKey => dotenv.env['EMAILJS_PUBLIC_KEY'] ?? '';

  static Future<bool> sendContactEmail({
    required String name,
    required String email,
    required String subject,
    required String message,
  }) async {
    try {
      await emailjs.send(_serviceId, _templateId, {
        'from_name': name,
        'from_email': email,
        'subject': subject,
        'message': message,
        'to_email': 'ngtuankiet2610@gmail.com',
      }, emailjs.Options(publicKey: _publicKey));
      return true;
    } catch (error) {
      if (error is emailjs.EmailJSResponseStatus) {
        debugPrint('ERROR... ${error.status}: ${error.text}');
      }
      debugPrint('Error sending email: $error');
      return false;
    }
  }
}

/*
HƯỚNG DẪN SETUP EMAILJS:

1. Đăng ký tài khoản EmailJS tại: https://www.emailjs.com/
2. Tạo Email Service (Gmail/Outlook)
3. Tạo Email Template với các biến:
   - {{from_name}}
   - {{from_email}} 
   - {{subject}}
   - {{message}}
   - {{to_email}}
4. Lấy Service ID, Template ID, và Public Key
5. Thay thế các constant ở trên

TEMPLATE EMAIL SAMPLE:
Subject: Portfolio Contact: {{subject}}

From: {{from_name}} ({{from_email}})
Subject: {{subject}}

Message:
{{message}}

--
Sent from Portfolio Website
*/