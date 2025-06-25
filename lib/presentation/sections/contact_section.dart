import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:kiet_portfolio/presentation/providers/contact_provider.dart';
import 'package:kiet_portfolio/presentation/state_management/state/contact_state.dart';
import '../../core/themes/app_colors.dart';
import '../../core/utils/responsive_helper.dart';
import '../../core/utils/common.dart';
import '../widgets/common/glass_container.dart';
import '../animations/fade_in_up.dart';

class ContactSection extends HookConsumerWidget {
  const ContactSection({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final nameController = useTextEditingController();
    final emailController = useTextEditingController();
    final subjectController = useTextEditingController();
    final messageController = useTextEditingController();
    final formKey = useMemoized(() => GlobalKey<FormState>());

    final contactState = ref.watch(contactProvider);
    final contactNotifier = ref.read(contactProvider.notifier);

    // Listen to state changes
    ref.listen<ContactState>(contactProvider, (previous, next) {
      if (next.isSuccess) {
        // Clear form after successful send
        nameController.clear();
        emailController.clear();
        subjectController.clear();
        messageController.clear();

        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Email sent successfully! 🎉'),
            backgroundColor: AppColors.accent,
            duration: Duration(seconds: 3),
          ),
        );

        // Reset state after showing success
        Future.delayed(const Duration(seconds: 1), () {
          contactNotifier.resetState();
        });
      }

      if (next.errorMessage != null) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(next.errorMessage!),
            backgroundColor: Colors.red,
            duration: const Duration(seconds: 3),
          ),
        );
      }
    });

    Future<void> sendEmail() async {
      if (!formKey.currentState!.validate()) return;

      await contactNotifier.sendContactEmail(
        name: nameController.text,
        email: emailController.text,
        subject: subjectController.text,
        message: messageController.text,
      );
    }

    return Container(
      width: double.infinity,
      constraints: const BoxConstraints(minHeight: 100),
      padding: ResponsiveHelper.getResponsivePadding(context),
      child: Column(
        children: [
          FadeInUp(
            delay: const Duration(milliseconds: 200),
            child: Text(
              l10n(context).getInTouch,
              style: TextStyle(
                fontSize: ResponsiveHelper.getResponsiveFontSize(
                  context,
                  mobile: 32,
                  tablet: 40,
                  desktop: 48,
                ),
                fontWeight: FontWeight.bold,
                color: AppColors.textPrimary,
              ),
            ),
          ),
          const SizedBox(height: 20),
          FadeInUp(
            delay: const Duration(milliseconds: 400),
            child: Container(
              constraints: const BoxConstraints(maxWidth: 600),
              child: Text(
                l10n(context).messageDescription,
                style: const TextStyle(
                  fontSize: 18,
                  color: AppColors.textSecondary,
                  height: 1.6,
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ),
          const SizedBox(height: 40),
          FadeInUp(
            delay: const Duration(milliseconds: 600),
            child: Container(
              constraints: const BoxConstraints(maxWidth: 800),
              child: GlassContainer(
                padding:
                    ResponsiveHelper.isMobile(context)
                        ? const EdgeInsets.all(20)
                        : const EdgeInsets.all(32),
                child: Form(
                  key: formKey,
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Expanded(
                            child: TextFormFieldWidget(
                              controller: nameController,
                              label: 'Your Name',
                              hint: 'Enter your full name',
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Please enter your name';
                                }
                                return null;
                              },
                            ),
                          ),
                          const SizedBox(width: 16),
                          Expanded(
                            child: TextFormFieldWidget(
                              controller: emailController,
                              label: 'Email Address',
                              hint: 'Enter your email',
                              keyboardType: TextInputType.emailAddress,
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Please enter your email';
                                }
                                if (!RegExp(
                                  r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$',
                                ).hasMatch(value)) {
                                  return 'Please enter a valid email';
                                }
                                return null;
                              },
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 20),
                      TextFormFieldWidget(
                        controller: subjectController,
                        label: 'Subject',
                        hint: 'What is this message about?',
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter a subject';
                          }
                          return null;
                        },
                      ),
                      const SizedBox(height: 20),
                      TextFormFieldWidget(
                        controller: messageController,
                        label: 'Message',
                        hint: 'Tell me about your project or question...',
                        maxLines: 6,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter your message';
                          }
                          if (value.length < 10) {
                            return 'Message should be at least 10 characters long';
                          }
                          return null;
                        },
                      ),
                      const SizedBox(height: 32),
                      SizedBox(
                        width: double.infinity,
                        child: ElevatedButton(
                          onPressed: contactState.isLoading ? null : sendEmail,
                          style: ElevatedButton.styleFrom(
                            backgroundColor: AppColors.accent,
                            foregroundColor: AppColors.primary,
                            padding: const EdgeInsets.symmetric(vertical: 16),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                            elevation: 0,
                          ),
                          child:
                              contactState.isLoading
                                  ? const SizedBox(
                                    height: 20,
                                    width: 20,
                                    child: CircularProgressIndicator(
                                      strokeWidth: 2,
                                      valueColor: AlwaysStoppedAnimation<Color>(
                                        AppColors.primary,
                                      ),
                                    ),
                                  )
                                  : const Text(
                                    'Send Message',
                                    style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(height: 80),
        ],
      ),
    );
  }
}

class TextFormFieldWidget extends StatelessWidget {
  final TextEditingController controller;
  final String label;
  final String hint;
  final TextInputType? keyboardType;
  final int? maxLines;
  final String? Function(String?)? validator;

  const TextFormFieldWidget({
    required this.controller,
    required this.label,
    required this.hint,
    this.keyboardType,
    this.maxLines,
    this.validator,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: const TextStyle(
            color: AppColors.textPrimary,
            fontSize: 16,
            fontWeight: FontWeight.w600,
          ),
        ),
        const SizedBox(height: 8),
        TextFormField(
          controller: controller,
          keyboardType: keyboardType,
          maxLines: maxLines,
          validator: validator,
          style: const TextStyle(color: AppColors.textPrimary, fontSize: 16),
          decoration: InputDecoration(
            hintText: hint,
            hintStyle: TextStyle(
              color: AppColors.textSecondary.withValues(alpha: 0.7),
              fontSize: 14,
            ),
            filled: true,
            fillColor: AppColors.surface.withValues(alpha: 0.3),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: BorderSide(
                color: AppColors.textSecondary.withValues(alpha: 0.3),
              ),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: BorderSide(
                color: AppColors.textSecondary.withValues(alpha: 0.3),
              ),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: const BorderSide(color: AppColors.accent, width: 2),
            ),
            errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: const BorderSide(color: Colors.red),
            ),
            contentPadding: const EdgeInsets.symmetric(
              horizontal: 16,
              vertical: 12,
            ),
          ),
        ),
      ],
    );
  }
}