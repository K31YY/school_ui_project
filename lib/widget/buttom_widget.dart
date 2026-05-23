import 'package:flutter/material.dart';
import 'package:flutter_first_project/config/theme/theme_style.dart';

class ButtonWidget extends StatefulWidget {
  final VoidCallback onTap;
  final String? title;
  final double? width;
  final double? height;
  final bool? outline;
  final bool? enable;
  final Color? backgroundColor;
  final Widget? child;
  final int? delayDuration;
  final FocusNode? focusNode;
  const ButtonWidget({
    super.key,
    required this.onTap,
    this.title,
    this.width,
    this.height,
    this.enable,
    this.backgroundColor,
    this.outline = false,
    this.child,
    this.delayDuration,
    this.focusNode,
  });

  @override
  State<ButtonWidget> createState() => _ButtonWidgetState();
}

class _ButtonWidgetState extends State<ButtonWidget>
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

  FocusNode focusNode = FocusNode();

  final bool _isButtonPressed = false;

  @override
  Widget build(BuildContext context) {
    return widget.enable == false
        ? Container(
            height: widget.height ?? 50,
            width: widget.width ?? double.infinity,
            alignment: Alignment.center,
            padding: const EdgeInsets.only(left: 20, right: 20),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              color: AppTheme.primarySwatch.shade100.withValues(alpha: 0.3),
            ),
            child: const SizedBox(
              height: 25,
              width: 25,
              child: CircularProgressIndicator(),
            ),
          )
        : MouseRegion(
            cursor: SystemMouseCursors.click,
            child: GestureDetector(
              onTap: widget.delayDuration != null
                  ? _isButtonPressed == false
                        ? null
                        : () async {
                            await _controller.forward().then((_) {
                              _controller.reverse();
                            });
                            widget.onTap();
                          }
                  : () async {
                      await _controller.forward().then((_) {
                        _controller.reverse();
                      });
                      widget.onTap();
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
                  height: widget.height ?? 50,
                  width: widget.width ?? double.infinity,
                  alignment: Alignment.center,
                  padding: const EdgeInsets.only(left: 20, right: 20),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(
                      color: widget.outline == true
                          ? Theme.of(context).primaryColor
                          : Colors.transparent,
                    ),
                    color: widget.outline == true
                        ? Colors.transparent
                        : widget.backgroundColor ?? AppTheme.primarySwatch,
                  ),
                  child:
                      widget.child ??
                      Text(
                        widget.title ?? '',
                        textAlign: TextAlign.center,
                        style: AppTextStyle.bold14(
                          color: widget.outline == true
                              ? AppTheme.primarySwatch
                              : Colors.white,
                        ),
                      ),
                ),
              ),
            ),
          );
  }
}
