# 📧 EmailJS Setup Guide for Portfolio

Hướng dẫn setup EmailJS để gửi email trực tiếp từ portfolio của bạn.

## 🚀 Bước 1: Tạo EmailJS Account

1. Truy cập [EmailJS.com](https://www.emailjs.com/)
2. Click **"Sign Up Free"**
3. Đăng ký với email của bạn

## 📨 Bước 2: Add Email Service

1. Trong Dashboard, click **"Add New Service"**
2. Chọn **Gmail** (hoặc email provider bạn dùng)
3. Connect với Gmail account:
   - Click **"Connect Account"**
   - Đăng nhập Gmail
   - Cho phép EmailJS access
4. **Service ID** sẽ được tạo tự động (ví dụ: `service_abc123`)

## 📝 Bước 3: Create Email Template

1. Click **"Email Templates"** → **"Create New Template"**
2. Setup template như sau:

### Template Settings:
- **Template Name**: `Portfolio Contact Form`
- **Template ID**: Sẽ tự động tạo (ví dụ: `template_xyz789`)

### Email Content:
```
To: kietnguyen.dev@gmail.com
Subject: Portfolio Contact: {{subject}}

From: {{from_name}} <{{from_email}}>
Subject: {{subject}}

Message:
{{message}}

---
Sent from Portfolio Contact Form
```

### Template Variables:
- `{{from_name}}` - Tên người gửi
- `{{from_email}}` - Email người gửi  
- `{{subject}}` - Chủ đề
- `{{message}}` - Nội dung tin nhắn

## 🔑 Bước 4: Get API Keys

1. Vào **"Account"** → **"General"**
2. Copy **"Public Key"** (ví dụ: `user_abcXYZ123`)
3. Note lại:
   - **Service ID**: `service_abc123`
   - **Template ID**: `template_xyz789`  
   - **Public Key**: `user_abcXYZ123`

## 🔧 Bước 5: Enable API for Flutter

⚠️ **QUAN TRỌNG**: Mặc định EmailJS chặn API calls từ non-browser apps

1. Vào **"Account"** → **"Security"**
2. **Uncheck** ☐ "Use private key"
3. **Check** ☑️ "Allow EmailJS API for non-browser applications"

## 📱 Bước 6: Update Flutter Code

Mở file `lib/core/services/email_service.dart` và thay thế:

```dart
static const String _serviceId = 'service_abc123'; // Thay bằng Service ID của bạn
static const String _templateId = 'template_xyz789'; // Thay bằng Template ID của bạn  
static const String _publicKey = 'user_abcXYZ123'; // Thay bằng Public Key của bạn
```

## ✅ Bước 7: Test

1. Chạy app: `flutter run -d chrome`
2. Vào Contact section
3. Điền form và bấm **"Send Message"**
4. Kiểm tra email `kietnguyen.dev@gmail.com`

## 💰 Pricing

- **Free Plan**: 200 emails/tháng
- **Personal**: $15/tháng - 1000 emails
- **Business**: $50/tháng - 10000 emails

## 🔧 Troubleshooting

### ❌ "API calls disabled for non-browser applications"
**Giải pháp**: Enable API trong Account → Security (Bước 5)

### ❌ "Service not found"  
**Giải pháp**: Kiểm tra Service ID trong Account → Email Services

### ❌ "Template not found"
**Giải pháp**: Kiểm tra Template ID trong Email Templates

### ❌ Email không nhận được
**Giải pháp**: 
- Kiểm tra Spam folder
- Verify email template variables
- Check EmailJS Dashboard → History

## 🎉 Kết quả

Sau khi setup xong:
- User điền contact form → Email gửi **trực tiếp** đến bạn
- Không cần mở email client
- Real-time notification
- Professional email formatting

---

**Lưu ý**: Nhớ thay email `kietnguyen.dev@gmail.com` trong EmailService bằng email thật của bạn! 