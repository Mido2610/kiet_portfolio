// import 'package:flutter/material.dart';
// import 'package:flutter_hooks/flutter_hooks.dart';
// import 'package:hooks_riverpod/hooks_riverpod.dart';
// import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
// import 'package:kiet_portfolio/presentation/animations/fade_in_up.dart';
// import 'package:kiet_portfolio/presentation/state_management/state/portfolio_state.dart';
// import '../../../core/themes/app_colors.dart';
// import '../../../core/utils/responsive_utils.dart';
// import '../../../data/models/project_model.dart';
// import '../cards/project_card.dart';

// class FeaturedProjectsSection extends HookConsumerWidget {
//   const FeaturedProjectsSection({super.key});

//   @override
//   Widget build(BuildContext context, WidgetRef ref) {
//     final portfolioState = ref.watch(portfolioStateProvider);
//     final selectedFilter = useState(ProjectFilter.all);
//     final animationController = useAnimationController(
//       duration: const Duration(milliseconds: 1500),
//     );

//     final isVisible = useState(false);

//     useEffect(() {
//       void onVisibilityChanged() {
//         if (!isVisible.value) {
//           isVisible.value = true;
//           animationController.forward();
//         }
//       }

//       WidgetsBinding.instance.addPostFrameCallback((_) {
//         onVisibilityChanged();
//       });

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
//           const SizedBox(height: 48),
//           FadeInUp(
//             delay: const Duration(milliseconds: 400),
//             child: _buildProjectFilters(selectedFilter),
//           ),
//           const SizedBox(height: 64),
//           if (portfolioState.isLoading)
//             const Center(
//               child: CircularProgressIndicator(color: AppColors.accent),
//             )
//           else
//             _buildProjectsGrid(
//               context,
//               _getFilteredProjects(
//                 portfolioState.projects,
//                 selectedFilter.value,
//               ),
//               animationController,
//             ),
//           const SizedBox(height: 48),
//           FadeInUp(
//             delay: const Duration(milliseconds: 800),
//             child: _buildViewAllProjectsButton(context),
//           ),
//         ],
//       ),
//     );
//   }

//   Widget _buildSectionHeader(BuildContext context) {
//     return Column(
//       children: [
//         Text(
//           'Featured Projects',
//           style: Theme.of(context).textTheme.headlineMedium?.copyWith(
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
//         _buildSectionDivider(),
//         const SizedBox(height: 24),
//         Container(
//           constraints: const BoxConstraints(maxWidth: 700),
//           child: Text(
//             'Here are some of my recent projects that showcase my skills and passion for development. Each project represents a unique challenge and learning experience.',
//             style: Theme.of(context).textTheme.bodyLarge?.copyWith(
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

//   Widget _buildSectionDivider() {
//     return Container(
//       width: 80,
//       height: 4,
//       decoration: BoxDecoration(
//         gradient: const LinearGradient(
//           colors: [AppColors.accent, AppColors.accentLight],
//         ),
//         borderRadius: BorderRadius.circular(2),
//       ),
//     );
//   }

//   Widget _buildProjectFilters(ValueNotifier<ProjectFilter> selectedFilter) {
//     final filters = ProjectFilter.values;

//     return SingleChildScrollView(
//       scrollDirection: Axis.horizontal,
//       child: Row(
//         mainAxisAlignment: MainAxisAlignment.center,
//         children:
//             filters.map((filter) {
//               final isSelected = selectedFilter.value == filter;

//               return Padding(
//                 padding: const EdgeInsets.symmetric(horizontal: 8),
//                 child: _buildFilterChip(
//                   filter.displayName,
//                   isSelected,
//                   () => selectedFilter.value = filter,
//                 ),
//               );
//             }).toList(),
//       ),
//     );
//   }

//   Widget _buildFilterChip(String label, bool isSelected, VoidCallback onTap) {
//     return HookBuilder(
//       builder: (context) {
//         final hoverController = useAnimationController(
//           duration: const Duration(milliseconds: 200),
//         );

//         final hoverScale = useAnimation(
//           Tween<double>(begin: 1.0, end: 1.05).animate(
//             CurvedAnimation(parent: hoverController, curve: Curves.easeInOut),
//           ),
//         );

//         return MouseRegion(
//           onEnter: (_) => hoverController.forward(),
//           onExit: (_) => hoverController.reverse(),
//           child: Transform.scale(
//             scale: hoverScale,
//             child: GestureDetector(
//               onTap: onTap,
//               child: AnimatedContainer(
//                 duration: const Duration(milliseconds: 300),
//                 padding: const EdgeInsets.symmetric(
//                   horizontal: 24,
//                   vertical: 12,
//                 ),
//                 decoration: BoxDecoration(
//                   gradient:
//                       isSelected
//                           ? const LinearGradient(
//                             colors: [AppColors.accent, AppColors.accentLight],
//                           )
//                           : null,
//                   color: isSelected ? null : AppColors.surface,
//                   borderRadius: BorderRadius.circular(25),
//                   border: Border.all(
//                     color:
//                         isSelected
//                             ? Colors.transparent
//                             : AppColors.accent.withAlpha((0.3 * 255).round()),
//                     width: 1,
//                   ),
//                   boxShadow:
//                       isSelected
//                           ? [
//                             BoxShadow(
//                               color: AppColors.accent.withAlpha(
//                                 (0.3 * 255).round(),
//                               ),
//                               blurRadius: 15,
//                               offset: const Offset(0, 5),
//                             ),
//                           ]
//                           : null,
//                 ),
//                 child: Text(
//                   label,
//                   style: TextStyle(
//                     color:
//                         isSelected ? AppColors.primary : AppColors.textPrimary,
//                     fontSize: 14,
//                     fontWeight: FontWeight.w600,
//                   ),
//                 ),
//               ),
//             ),
//           ),
//         );
//       },
//     );
//   }

//   Widget _buildProjectsGrid(
//     BuildContext context,
//     List<Project> projects,
//     AnimationController controller,
//   ) {
//     final isMobile = ResponsiveUtils.isMobile(context);
//     final isTablet = ResponsiveUtils.isTablet(context);

//     int crossAxisCount = 1;
//     if (isTablet) crossAxisCount = 2;
//     if (!isMobile && !isTablet) crossAxisCount = 3;

//     return AnimationLimiter(
//       child: GridView.builder(
//         shrinkWrap: true,
//         physics: const NeverScrollableScrollPhysics(),
//         gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
//           crossAxisCount: crossAxisCount,
//           crossAxisSpacing: isMobile ? 16 : 24,
//           mainAxisSpacing: isMobile ? 16 : 24,
//           childAspectRatio: isMobile ? 0.8 : 0.85,
//         ),
//         itemCount: projects.length,
//         itemBuilder: (context, index) {
//           return AnimationConfiguration.staggeredGrid(
//             position: index,
//             duration: const Duration(milliseconds: 600),
//             columnCount: crossAxisCount,
//             child: SlideAnimation(
//               verticalOffset: 50.0,
//               child: FadeInAnimation(
//                 child: ProjectShowcaseCard(
//                   project: projects[index],
//                   onTap:
//                       () => _navigateToProjectDetail(context, projects[index]),
//                 ),
//               ),
//             ),
//           );
//         },
//       ),
//     );
//   }

//   Widget _buildViewAllProjectsButton(BuildContext context) {
//     return HookBuilder(
//       builder: (context) {
//         final buttonController = useAnimationController(
//           duration: const Duration(milliseconds: 200),
//         );

//         final buttonScale = useAnimation(
//           Tween<double>(begin: 1.0, end: 0.95).animate(buttonController),
//         );

//         return GestureDetector(
//           onTapDown: (_) => buttonController.forward(),
//           onTapUp: (_) => buttonController.reverse(),
//           onTapCancel: () => buttonController.reverse(),
//           onTap: () => _navigateToAllProjects(context),
//           child: Transform.scale(
//             scale: buttonScale,
//             child: Container(
//               padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
//               decoration: BoxDecoration(
//                 border: Border.all(color: AppColors.accent, width: 2),
//                 borderRadius: BorderRadius.circular(30),
//                 boxShadow: [
//                   BoxShadow(
//                     color: AppColors.accent.withAlpha((0.2 * 255).round()),
//                     blurRadius: 10,
//                     offset: const Offset(0, 5),
//                   ),
//                 ],
//               ),
//               child: Row(
//                 mainAxisSize: MainAxisSize.min,
//                 children: [
//                   Text(
//                     'View All Projects',
//                     style: TextStyle(
//                       color: AppColors.accent,
//                       fontSize: 16,
//                       fontWeight: FontWeight.w600,
//                     ),
//                   ),
//                   const SizedBox(width: 8),
//                   Icon(Icons.arrow_forward, color: AppColors.accent, size: 20),
//                 ],
//               ),
//             ),
//           ),
//         );
//       },
//     );
//   }

//   List<Project> _getFilteredProjects(
//     List<Project> projects,
//     ProjectFilter filter,
//   ) {
//     switch (filter) {
//       case ProjectFilter.all:
//         return projects.where((p) => p.isFeatured).take(6).toList();
//       case ProjectFilter.mobileApps:
//         return projects
//             .where(
//               (p) => p.category == ProjectCategory.mobileApp && p.isFeatured,
//             )
//             .toList();
//       case ProjectFilter.webApps:
//         return projects
//             .where((p) => p.category == ProjectCategory.webApp && p.isFeatured)
//             .toList();
//       case ProjectFilter.uiUx:
//         return projects
//             .where((p) => p.category == ProjectCategory.uiUx && p.isFeatured)
//             .toList();
//       case ProjectFilter.backend:
//         return projects
//             .where((p) => p.category == ProjectCategory.backend && p.isFeatured)
//             .toList();
//       case ProjectFilter.fullStack:
//         return projects
//             .where(
//               (p) => p.category == ProjectCategory.fullStack && p.isFeatured,
//             )
//             .toList();
//     }
//   }

//   void _navigateToProjectDetail(BuildContext context, Project project) {
//     // Navigation logic
//     Navigator.of(context).pushNamed('/project-detail', arguments: project);
//   }

//   void _navigateToAllProjects(BuildContext context) {
//     // Navigation logic
//     Navigator.of(context).pushNamed('/projects');
//   }
// }