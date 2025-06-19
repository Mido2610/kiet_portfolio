// import 'package:flutter/material.dart';
// import 'package:flutter_hooks/flutter_hooks.dart';
// import 'package:hooks_riverpod/hooks_riverpod.dart';
// import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
// import 'package:kiet_portfolio/core/themes/app_colors.dart';
// import 'package:kiet_portfolio/data/models/experience_model.dart';
// import 'package:kiet_portfolio/presentation/state_management/state/portfolio_state.dart';
// import '../../../core/utils/responsive_utils.dart';
// import '../cards/experience_timeline_card.dart';
// import '../animations/fade_in_up.dart';

// class WorkExperienceSection extends HookConsumerWidget {
//   const WorkExperienceSection({super.key});

//   @override
//   Widget build(BuildContext context, WidgetRef ref) {
//     final portfolioState = ref.watch(portfolioStateProvider);
//     final animationController = useAnimationController(
//       duration: const Duration(milliseconds: 1500),
//     );

//     useEffect(() {
//       animationController.forward();
//       return null;
//     }, []);

//     return Container(
//       width: double.infinity,
//       padding: ResponsiveUtils.getSectionPadding(context),
//       child: Column(
//         children: [
//           FadeInUp(
//             delay: const Duration(milliseconds: 200),
//             child: _buildSectionHeader(context),
//           ),
//           const SizedBox(height: 60),
//           if (portfolioState.isLoading)
//             const Center(
//               child: CircularProgressIndicator(color: AppColors.accent),
//             )
//           else
//             _buildExperienceTimeline(context, portfolioState.experiences),
//         ],
//       ),
//     );
//   }

//   Widget _buildSectionHeader(BuildContext context) {
//     return Column(
//       children: [
//         Text(
//           'Work Experience',
//           style: TextStyle(
//             fontSize: ResponsiveUtils.getResponsiveFontSize(
//               context,
//               mobile: 32,
//               tablet: 40,
//               desktop: 48,
//             ),
//             fontWeight: FontWeight.bold,
//             color: AppColors.textPrimary,
//           ),
//           textAlign: TextAlign.center,
//         ),
//         const SizedBox(height: 16),
//         Container(
//           width: 80,
//           height: 4,
//           decoration: BoxDecoration(
//             gradient: const LinearGradient(
//               colors: [AppColors.accent, AppColors.accentLight],
//             ),
//             borderRadius: BorderRadius.circular(2),
//           ),
//         ),
//         const SizedBox(height: 24),
//         Container(
//           constraints: const BoxConstraints(maxWidth: 600),
//           child: Text(
//             'My professional journey and the experiences that shaped my skills in Flutter development.',
//             style: TextStyle(
//               fontSize: ResponsiveUtils.getResponsiveFontSize(
//                 context,
//                 mobile: 16,
//                 tablet: 18,
//                 desktop: 18,
//               ),
//               color: AppColors.textSecondary,
//               height: 1.6,
//             ),
//             textAlign: TextAlign.center,
//           ),
//         ),
//       ],
//     );
//   }

//   Widget _buildExperienceTimeline(
//     BuildContext context,
//     List<Experience> experiences,
//   ) {
//     if (ResponsiveUtils.isMobile(context)) {
//       return _buildMobileTimeline(experiences);
//     }
//     return _buildDesktopTimeline(experiences);
//   }

//   Widget _buildMobileTimeline(List<Experience> experiences) {
//     return AnimationLimiter(
//       child: Column(
//         children:
//             experiences.asMap().entries.map((entry) {
//               final index = entry.key;
//               final experience = entry.value;

//               return AnimationConfiguration.staggeredList(
//                 position: index,
//                 duration: const Duration(milliseconds: 600),
//                 child: SlideAnimation(
//                   verticalOffset: 50.0,
//                   child: FadeInAnimation(
//                     child: Padding(
//                       padding: const EdgeInsets.only(bottom: 24),
//                       child: ExperienceTimelineCard(
//                         experience: experience,
//                         isLeft: false,
//                         showConnector: index < experiences.length - 1,
//                       ),
//                     ),
//                   ),
//                 ),
//               );
//             }).toList(),
//       ),
//     );
//   }

//   Widget _buildDesktopTimeline(List<Experience> experiences) {
//     return Stack(
//       children: [
//         // Timeline Line
//         Positioned(
//           left: 0,
//           right: 0,
//           child: Center(
//             child: Container(
//               width: 2,
//               height: experiences.length * 300.0,
//               decoration: BoxDecoration(
//                 gradient: const LinearGradient(
//                   colors: [AppColors.accent, AppColors.accentLight],
//                   begin: Alignment.topCenter,
//                   end: Alignment.bottomCenter,
//                 ),
//                 borderRadius: BorderRadius.circular(1),
//               ),
//             ),
//           ),
//         ),
//         // Experience Cards
//         Column(
//           children:
//               experiences.asMap().entries.map((entry) {
//                 final index = entry.key;
//                 final experience = entry.value;
//                 final isLeft = index % 2 == 0;

//                 return AnimationConfiguration.staggeredList(
//                   position: index,
//                   duration: const Duration(milliseconds: 600),
//                   child: SlideAnimation(
//                     horizontalOffset: isLeft ? -50.0 : 50.0,
//                     child: FadeInAnimation(
//                       child: Container(
//                         height: 280,
//                         margin: const EdgeInsets.only(bottom: 20),
//                         child: ExperienceTimelineCard(
//                           experience: experience,
//                           isLeft: isLeft,
//                           showConnector: true,
//                         ),
//                       ),
//                     ),
//                   ),
//                 );
//               }).toList(),
//         ),
//       ],
//     );
//   }
// }