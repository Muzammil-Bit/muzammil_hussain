import 'dart:ui';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:muzammil_hussain/view/router/routes.dart';
import 'package:muzammil_hussain/view/widgets/app_button.dart';
import 'package:visibility_detector/visibility_detector.dart';

import '../../../../extensions/context_ext.dart';
import '../../../widgets/section_title.dart';

class ExperienceView extends StatefulWidget {
  const ExperienceView({super.key});

  @override
  State<ExperienceView> createState() => _ExperienceViewState();
}

class _ExperienceViewState extends State<ExperienceView>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  bool _isVisible = false;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 800));
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return VisibilityDetector(
      key: const Key('skills-section'),
      onVisibilityChanged: (info) {
        if (info.visibleFraction > 0.2 && !_isVisible) {
          setState(() => _isVisible = true);
          _controller.forward();
        }
      },
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SectionTitle(
            backgroundText: "SKILLS",
            foreGroundText: "EXPERTISE",
            subTitle: "EXPERIENCE",
          ),
          const SizedBox(height: 100),
          Container(
            constraints: const BoxConstraints(maxWidth: 1200),
            padding:
                EdgeInsets.symmetric(horizontal: context.isMobile ? 20 : 0),
            child: context.isMobile
                ? Column(
                    children: [
                      _buildMobileDevCard(0),
                      const SizedBox(height: 20),
                      _buildBackendCard(1),
                      const SizedBox(height: 20),
                      _buildToolsCard(2),
                    ],
                  )
                : Table(
                    columnWidths: const {
                      0: FlexColumnWidth(3),
                      1: FixedColumnWidth(30),
                      2: FlexColumnWidth(2),
                    },
                    defaultVerticalAlignment: TableCellVerticalAlignment.fill,
                    children: [
                      TableRow(
                        children: [
                          _buildMobileDevCard(0),
                          const SizedBox(),
                          Column(
                            children: [
                              _buildBackendCard(1),
                              const SizedBox(height: 30),
                              _buildToolsCard(2),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
          ),
          const SizedBox(height: 80),
          AppButton(
            onTap: () => context.go(Routes.experience),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  "View Full Resume",
                  style: Theme.of(context).textTheme.labelSmall,
                ),
                const SizedBox(width: 8),
                const Icon(Icons.arrow_forward, color: Colors.white)
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildMobileDevCard(int index) {
    return _AnimatedEntry(
      controller: _controller,
      index: index,
      child: _SpotlightCard(
        height: context.isMobile ? null : double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Container(
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: Theme.of(context)
                        .colorScheme
                        .secondary
                        .withOpacity(0.1),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Icon(
                    Icons.phone_android_rounded,
                    color: Theme.of(context).colorScheme.secondary,
                    size: 32,
                  ),
                ),
                const SizedBox(width: 15),
                Expanded(
                  child: AutoSizeText(
                    "Mobile Development",
                    style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                    maxLines: 1,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 30),
            Text(
              "Building high-performance, beautiful mobile applications is my primary expertise. I specialize in Flutter to create seamless cross-platform experiences.",
              style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                    color: Colors.white70,
                    height: 1.6,
                  ),
            ),
            const SizedBox(height: 30),
            Wrap(
              spacing: 12,
              runSpacing: 12,
              children: [
                "Flutter",
                "Dart",
                "Clean Architecture",
                "Bloc & Cubit",
                "Provider",
                "MVVM",
                "Method Channels",
                "CI/CD / Fastlane",
                "Unit & Widget Testing",
                "Performance Optimization",
              ].map((s) => _SkillChip(label: s)).toList(),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildBackendCard(int index) {
    return _AnimatedEntry(
      controller: _controller,
      index: index,
      child: _SpotlightCard(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              children: [
                Container(
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: Theme.of(context)
                        .colorScheme
                        .secondary
                        .withOpacity(0.1),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Icon(
                    Icons.cloud_queue_rounded,
                    color: Theme.of(context).colorScheme.secondary,
                    size: 24,
                  ),
                ),
                const SizedBox(width: 15),
                Expanded(
                  child: AutoSizeText(
                    "Backend & Cloud",
                    style: Theme.of(context).textTheme.titleLarge?.copyWith(
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                    maxLines: 1,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),
            Wrap(
              spacing: 10,
              runSpacing: 10,
              children: [
                "Firebase",
                "Cloud Functions",
                "Node.js",
                "REST APIs",
                "GraphQL",
                "PHP & Laravel",
                "MySQL",
              ].map((s) => _SkillChip(label: s)).toList(),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildToolsCard(int index) {
    return _AnimatedEntry(
      controller: _controller,
      index: index,
      child: _SpotlightCard(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              children: [
                Container(
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: Theme.of(context)
                        .colorScheme
                        .secondary
                        .withOpacity(0.1),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Icon(
                    Icons.build_circle_outlined,
                    color: Theme.of(context).colorScheme.secondary,
                    size: 24,
                  ),
                ),
                const SizedBox(width: 15),
                Expanded(
                  child: AutoSizeText(
                    "Tools & DevOps",
                    style: Theme.of(context).textTheme.titleLarge?.copyWith(
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                    maxLines: 1,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),
            Wrap(
              spacing: 10,
              runSpacing: 10,
              children: [
                "Git & GitHub",
                "Jira",
                "Figma",
                "Postman",
                "Scrum / Agile",
                "VS Code",
                "Xcode",
              ].map((s) => _SkillChip(label: s)).toList(),
            ),
          ],
        ),
      ),
    );
  }
}

class _AnimatedEntry extends StatelessWidget {
  final AnimationController controller;
  final int index;
  final Widget child;

  const _AnimatedEntry({
    required this.controller,
    required this.index,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    // Stagger delay based on index
    final double start = (index * 0.2).clamp(0.0, 1.0);
    final double end = (start + 0.6).clamp(0.0, 1.0);

    return FadeTransition(
      opacity: CurvedAnimation(
        parent: controller,
        curve: Interval(start, end, curve: Curves.easeOut),
      ),
      child: SlideTransition(
        position: Tween<Offset>(
          begin: const Offset(0, 0.2),
          end: Offset.zero,
        ).animate(CurvedAnimation(
          parent: controller,
          curve: Interval(start, end, curve: Curves.easeOutCubic),
        )),
        child: child,
      ),
    );
  }
}

class _SpotlightCard extends StatefulWidget {
  final Widget child;
  final double? height;

  const _SpotlightCard({required this.child, this.height});

  @override
  State<_SpotlightCard> createState() => _SpotlightCardState();
}

class _SpotlightCardState extends State<_SpotlightCard> {
  Offset _mousePos = Offset.zero;
  bool _isHovering = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => _isHovering = true),
      onExit: (_) => setState(() => _isHovering = false),
      onHover: (event) {
        setState(() {
          _mousePos = event.localPosition;
        });
      },
      child: Container(
        height: widget.height,
        // Make sure the container fills availability if no height set
        constraints: const BoxConstraints(minHeight: 200),
        decoration: BoxDecoration(
          color: Theme.of(context).cardColor.withOpacity(0.2),
          borderRadius: BorderRadius.circular(24),
          border: Border.all(
            color: Colors.white.withOpacity(0.08),
            width: 1,
          ),
        ),
        clipBehavior: Clip.antiAlias,
        child: Stack(
          children: [
            // Spotlight Effect
            if (!_isHovering && context.isMobile == false) ...[
              // Optional: Idle animation or keep it subtle
            ],
            // Active Spotlight
            Positioned.fill(
              child: CustomPaint(
                painter: _SpotlightPainter(
                  position: _mousePos,
                  color: Theme.of(context).colorScheme.secondary,
                  opacity: _isHovering ? 0.25 : 0.0,
                ),
              ),
            ),

            // Content
            Padding(
              padding: const EdgeInsets.all(32),
              child: widget.child,
            ),
          ],
        ),
      ),
    );
  }
}

class _SpotlightPainter extends CustomPainter {
  final Offset position;
  final Color color;
  final double opacity;

  _SpotlightPainter({
    required this.position,
    required this.color,
    required this.opacity,
  });

  @override
  void paint(Canvas canvas, Size size) {
    if (opacity <= 0) return;

    final paint = Paint()
      ..shader = RadialGradient(
        colors: [
          color.withOpacity(opacity),
          Colors.transparent,
        ],
        stops: const [0.0, 1.0],
      ).createShader(Rect.fromCircle(center: position, radius: 400));

    canvas.drawRect(Rect.fromLTWH(0, 0, size.width, size.height), paint);
  }

  @override
  bool shouldRepaint(_SpotlightPainter oldDelegate) {
    return oldDelegate.position != position ||
        oldDelegate.opacity != opacity ||
        oldDelegate.color != color;
  }
}

class _SkillChip extends StatefulWidget {
  final String label;

  const _SkillChip({required this.label});

  @override
  State<_SkillChip> createState() => _SkillChipState();
}

class _SkillChipState extends State<_SkillChip> {
  bool isHovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => isHovered = true),
      onExit: (_) => setState(() => isHovered = false),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        decoration: BoxDecoration(
          color: isHovered
              ? Theme.of(context).colorScheme.secondary
              : Colors.white.withOpacity(0.05),
          borderRadius: BorderRadius.circular(30),
          border: Border.all(
            color: isHovered
                ? Theme.of(context).colorScheme.secondary
                : Colors.white.withOpacity(0.1),
            width: 1,
          ),
        ),
        child: Text(
          widget.label,
          style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                color: isHovered ? Colors.white : Colors.white70,
                fontWeight: isHovered ? FontWeight.bold : FontWeight.normal,
                fontSize: 13,
              ),
        ),
      ),
    );
  }
}
