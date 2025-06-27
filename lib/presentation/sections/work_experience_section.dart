import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:visibility_detector/visibility_detector.dart';
import 'package:kiet_portfolio/presentation/cards/experience_timeline_card.dart';
import 'package:kiet_portfolio/core/themes/app_colors.dart';
import 'package:kiet_portfolio/core/utils/responsive_utils.dart';
import 'package:kiet_portfolio/core/utils/common.dart';
import '../providers/work_expericen_provider.dart';
import '../animations/parallax_widget.dart';

class WorkExperienceSection extends HookConsumerWidget {
  const WorkExperienceSection({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final experiences = ref.watch(sortedExperiencesProvider);
    final visibleItems = ref.watch(experienceVisibilityProvider);
    
    final animationController = useAnimationController(
      duration: const Duration(milliseconds: 2000),
    );
    
    final pulseController = useAnimationController(
      duration: const Duration(milliseconds: 1500),
    );

    final titleController = useAnimationController(
      duration: const Duration(milliseconds: 800),
    );

    final scrollController = useScrollController();
    final scrollOffset = useState(0.0);

    useEffect(() {
      void listener() {
        scrollOffset.value = scrollController.offset;
      }
      scrollController.addListener(listener);
      return () => scrollController.removeListener(listener);
    }, [scrollController]);

    useEffect(() {
      Future.delayed(const Duration(milliseconds: 200), () {
        titleController.forward();
      });
      
      Future.delayed(const Duration(milliseconds: 600), () {
        animationController.forward();
      });
      
      // Pulse animation loop
      pulseController.repeat(reverse: true);
      
      return () {
        pulseController.dispose();
        titleController.dispose();
      };
    }, []);

    final lineGrowRatio = experiences.isEmpty ? 0.0 : visibleItems.length / experiences.length;
    final isMobile = ResponsiveUtils.isMobile(context);
    
    // Animation values
    final titleSlideAnimation = Tween<Offset>(
      begin: const Offset(0, -0.5),
      end: Offset.zero,
    ).animate(CurvedAnimation(
      parent: titleController,
      curve: Curves.elasticOut,
    ));

    final titleOpacityAnimation = Tween<double>(
      begin: 0.0,
      end: 1.0,
    ).animate(CurvedAnimation(
      parent: titleController,
      curve: Curves.easeOut,
    ));

    final lineGradientAnimation = Tween<double>(
      begin: 0.0,
      end: 1.0,
    ).animate(CurvedAnimation(
      parent: animationController,
      curve: Curves.easeInOut,
    ));

    final pulseAnimation = Tween<double>(
      begin: 0.8,
      end: 1.2,
    ).animate(CurvedAnimation(
      parent: pulseController,
      curve: Curves.easeInOut,
    ));

    return Container(
      width: double.infinity,
      padding: ResponsiveUtils.getSectionPadding(context),
      child: Stack(
        children: [
          // Floating particles background
          Positioned.fill(
            child: FloatingParticlesWidget(
              particleCount: 15,
              particleColor: AppColors.accentLight,
              minSize: 1.0,
              maxSize: 3.0,
              animationDuration: const Duration(seconds: 15),
            ),
          ),
          
          Column(
            children: [
          // Animated Title
          AnimatedBuilder(
            animation: titleController,
            builder: (context, child) {
              return SlideTransition(
                position: titleSlideAnimation,
                child: FadeTransition(
                  opacity: titleOpacityAnimation,
                  child: Column(
                    children: [
                      Text(
                        l10n(context).workExperience,
                        style: TextStyle(
                          fontSize: ResponsiveUtils.getResponsiveFontSize(
                            context,
                            mobile: 32,
                            tablet: 40,
                            desktop: 48,
                          ),
                          fontWeight: FontWeight.bold,
                          color: AppColors.textPrimary,
                        ),
                      ),
                      const SizedBox(height: 8),
                      Container(
                        height: 4,
                        width: 80,
                        decoration: BoxDecoration(
                          gradient: const LinearGradient(
                            colors: [AppColors.accent, AppColors.accentLight],
                          ),
                          borderRadius: BorderRadius.circular(2),
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
          const SizedBox(height: 60),

          // Timeline Container with enhanced effects
          if (experiences.isNotEmpty)
            SizedBox(
              height: experiences.length * (isMobile ? 420.0 : 500.0),
              child: Stack(
                children: [
                  // Background gradient overlay
                  Container(
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [
                          AppColors.accent.withAlpha((0.05 * 255).round()),
                          Colors.transparent,
                          AppColors.accentLight.withAlpha((0.03 * 255).round()),
                        ],
                        stops: const [0.0, 0.5, 1.0],
                      ),
                    ),
                  ),

                  // Animated Timeline Line
                  Align(
                    alignment: Alignment.topCenter,
                    child: AnimatedBuilder(
                      animation: Listenable.merge([animationController, lineGradientAnimation]),
                      builder: (context, child) {
                        return Stack(
                          children: [
                            // Base line
                            Container(
                              width: isMobile ? 4 : 6,
                              height: experiences.length * (isMobile ? 420.0 : 500.0),
                              decoration: BoxDecoration(
                                color: AppColors.accent.withAlpha((0.2 * 255).round()),
                                borderRadius: BorderRadius.circular(3),
                              ),
                            ),
                            
                            // Animated growing line
                            AnimatedContainer(
                              duration: const Duration(milliseconds: 800),
                              curve: Curves.easeOutCubic,
                              width: isMobile ? 4 : 6,
                              height: (experiences.length * (isMobile ? 420.0 : 500.0)) * lineGrowRatio,
                              decoration: BoxDecoration(
                                gradient: LinearGradient(
                                  colors: [
                                    AppColors.accent,
                                    AppColors.accentLight,
                                    AppColors.accent.withAlpha((0.8 * 255).round()),
                                  ],
                                  begin: Alignment.topCenter,
                                  end: Alignment.bottomCenter,
                                  stops: [
                                    0.0,
                                    0.5 + (0.3 * lineGradientAnimation.value),
                                    1.0,
                                  ],
                                ),
                                borderRadius: BorderRadius.circular(3),
                                boxShadow: [
                                  BoxShadow(
                                    color: AppColors.accent.withAlpha((0.4 * 255).round()),
                                    blurRadius: 12,
                                    spreadRadius: 2,
                                  ),
                                ],
                              ),
                            ),
                            
                            // Flowing gradient effect
                            if (lineGrowRatio > 0)
                              AnimatedBuilder(
                                animation: pulseAnimation,
                                builder: (context, child) {
                                  return Positioned(
                                    top: ((experiences.length * (isMobile ? 420.0 : 500.0)) * lineGrowRatio) - 24,
                                    left: isMobile ? -10 : -12,
                                    child: Container(
                                      width: isMobile ? 24 : 30,
                                      height: isMobile ? 24 : 30,
                                      decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        gradient: RadialGradient(
                                          colors: [
                                            AppColors.accent.withAlpha((0.8 * 255).round()),
                                            AppColors.accentLight.withAlpha((0.6 * 255).round()),
                                            Colors.transparent,
                                          ],
                                        ),
                                      ),
                                      transform: Matrix4.identity()
                                        ..scale(pulseAnimation.value),
                                    ),
                                  );
                                },
                              ),
                          ],
                        );
                      },
                    ),
                  ),

                  // Experience Cards
                  ListView.builder(
                    controller: scrollController,
                    itemCount: experiences.length,
                    physics: const NeverScrollableScrollPhysics(),
                    itemBuilder: (context, index) {
                      final isLeft = index % 2 == 0;
                      final experience = experiences[index];
                      final delay = index * 200.0;

                      return VisibilityDetector(
                        key: Key('exp_$index'),
                        onVisibilityChanged: (info) {
                          if (info.visibleFraction > 0.3) {
                            Future.delayed(Duration(milliseconds: delay.toInt()), () {
                              ref
                                  .read(experienceVisibilityProvider.notifier)
                                  .markVisible(index);
                            });
                          }
                        },
                        child: AnimatedContainer(
                          duration: Duration(milliseconds: 600 + delay.toInt()),
                          curve: Curves.elasticOut,
                          transform: Matrix4.identity()
                            ..translate(
                              visibleItems.contains(index) 
                                ? 0.0 
                                : (isLeft ? -150.0 : 150.0),
                              0.0,
                            ),
                          child: AnimatedOpacity(
                            opacity: visibleItems.contains(index) ? 1.0 : 0.0,
                            duration: Duration(milliseconds: 800 + delay.toInt()),
                            curve: Curves.easeOut,
                            child: TweenAnimationBuilder<double>(
                              duration: Duration(milliseconds: 1000 + delay.toInt()),
                              tween: Tween<double>(
                                begin: 0.85,
                                end: visibleItems.contains(index) ? 1.0 : 0.85,
                              ),
                              curve: Curves.elasticOut,
                              builder: (context, scale, child) {
                                return Transform.scale(
                                  scale: scale,
                                  child: Padding(
                                    padding: EdgeInsets.symmetric(
                                      vertical: isMobile ? 35 : 40,
                                      horizontal: isMobile ? 16 : 24,
                                    ),
                                    child: Stack(
                                      children: [
                                        // Enhanced floating particles effect
                                        if (visibleItems.contains(index))
                                          ...List.generate(5, (particleIndex) {
                                            return TweenAnimationBuilder<double>(
                                              duration: Duration(
                                                milliseconds: 2500 + (particleIndex * 400),
                                              ),
                                              tween: Tween<double>(begin: 0.0, end: 1.0),
                                              builder: (context, value, child) {
                                                return Positioned(
                                                  left: (particleIndex * 80.0) + (value * 60),
                                                  top: 15 + (particleIndex * 12.0) - (value * 25),
                                                  child: Opacity(
                                                    opacity: (1.0 - value) * 0.7,
                                                    child: Container(
                                                      width: isMobile ? 5 : 6,
                                                      height: isMobile ? 5 : 6,
                                                      decoration: BoxDecoration(
                                                        color: AppColors.accentLight,
                                                        shape: BoxShape.circle,
                                                        boxShadow: [
                                                          BoxShadow(
                                                            color: AppColors.accentLight.withAlpha((0.6 * 255).round()),
                                                            blurRadius: 6,
                                                            spreadRadius: 1,
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                  ),
                                                );
                                              },
                                            );
                                          }),
                                        
                                        // Main experience card
                                        ExperienceTimelineCard(
                                          experience: experience,
                                          isLeft: isLeft,
                                          showConnector: true,
                                        ),
                                      ],
                                    ),
                                  ),
                                );
                              },
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),
            ],
          ),
        ],
      ),
    );
  }
}