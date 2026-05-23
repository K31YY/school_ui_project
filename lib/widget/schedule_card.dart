import 'package:flutter/material.dart';
import 'package:flutter_first_project/config/theme/theme_style.dart';

class ScheduleCardWidget extends StatefulWidget {
  final String time;
  final String subject;
  final String teacher;
  final String duration;
  final void Function()? onTap;

  const ScheduleCardWidget({
    super.key,
    required this.time,
    required this.subject,
    required this.teacher,
    required this.duration,
    required this.onTap,
  });

  @override
  State<ScheduleCardWidget> createState() => _ScheduleCardWidgetState();
}

class _ScheduleCardWidgetState extends State<ScheduleCardWidget>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  final Duration _animationDuration = const Duration(milliseconds: 300);
  final Tween<double> _tween = Tween<double>(begin: 1.0, end: 0.95);

  @override
  void initState() {
    _controller = AnimationController(vsync: this, duration: _animationDuration)
      ..addListener(() {
        setState(() {});
      });
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
        onTap: () async {
          await _controller.forward().then((_) {
            _controller.reverse();
          });
          widget.onTap!();
        },
        child: ScaleTransition(
          scale: _tween.animate(
            CurvedAnimation(
              parent: _controller,
              curve: Curves.easeOut,
              reverseCurve: Curves.easeIn,
            ),
          ),
          child: Container(
            padding: const EdgeInsets.all(16),
            margin: EdgeInsets.only(bottom: 10),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(28),
              border: Border.all(
                color: AppTheme.primarySwatch.withValues(alpha: 0.2),
                width: 2,
              ),
            ),
            child: Row(
              spacing: 20,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  widget.time,
                  style: AppTextStyle.regular18(
                    color: AppTheme.secondarySwatch[900]?.withValues(
                      alpha: 0.6,
                    ),
                  ),
                ),
                Container(
                  color: AppTheme.primarySwatch.withValues(alpha: 0.2),
                  width: 1,
                  height: 58,
                ),
                Expanded(
                  child: Column(
                    spacing: 6,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        widget.subject,
                        style: TextStyle(
                          color: AppTheme.secondarySwatch[900],
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        widget.teacher,
                        style: TextStyle(
                          color: AppTheme.secondarySwatch[900],
                          fontSize: 14,
                        ),
                      ),
                    ],
                  ),
                ),
                _progressIndicator(widget.duration),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _progressIndicator(String text) {
    List durationValue = [0.5, 0.3, 0.2, 0.1, 1, 0.2];
    return Column(
      children: [
        Stack(
          alignment: Alignment.center,
          children: [
            CircularProgressIndicator(
              value: durationValue[0],
              backgroundColor: AppTheme.primarySwatch.withValues(alpha: 0.2),
              color: AppTheme.primarySwatch,
              constraints: BoxConstraints(minHeight: 68, minWidth: 68),
              strokeWidth: 8,
              strokeCap: StrokeCap.round,
            ),
            Text(text, style: const TextStyle(color: Colors.black)),
          ],
        ),
      ],
    );
  }
}
