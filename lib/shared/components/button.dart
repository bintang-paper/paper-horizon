import 'package:flutter/material.dart';
import 'package:paper_horizon/shared/ds/aurora.dart';

enum HorizonButtonType { primary }

enum HorizonButtonSize { large, small }

// TODO(team): revamp button type
class HorizonButton extends StatelessWidget {
  const HorizonButton({
    super.key,
    required this.text,
    this.leadingIcon,
    this.trailingIcon,
    this.loading = false,
    this.enabled = true,
    this.type = HorizonButtonType.primary,
    this.size = HorizonButtonSize.large,
    required this.onPressed,
    this.onDisabledPressed,
  });

  final String text;
  final Widget? leadingIcon;
  final Widget? trailingIcon;
  final bool loading;
  final bool enabled;
  final HorizonButtonType type;
  final HorizonButtonSize size;
  final VoidCallback onPressed;
  final VoidCallback? onDisabledPressed;

  @override
  Widget build(BuildContext context) {
    final _HorizonButton button = _HorizonButton(
      text: text,
      leadingIcon: leadingIcon,
      trailingIcon: trailingIcon,
      loading: loading,
      enabled: enabled,
      type: type,
      size: size,
      onPressed: onPressed,
      onDisabledPressed: onDisabledPressed,
    );

    return switch (size) {
      HorizonButtonSize.large => button,
      HorizonButtonSize.small => IntrinsicWidth(child: button),
    };
  }
}

class _HorizonButton extends StatelessWidget {
  const _HorizonButton({
    required this.text,
    required this.leadingIcon,
    required this.trailingIcon,
    required this.loading,
    required this.enabled,
    required this.type,
    required this.size,
    required this.onPressed,
    required this.onDisabledPressed,
  });

  final String text;
  final Widget? leadingIcon;
  final Widget? trailingIcon;
  final bool loading;
  final bool enabled;
  final HorizonButtonType type;
  final HorizonButtonSize size;
  final VoidCallback onPressed;
  final VoidCallback? onDisabledPressed;

  double get _borderRadius {
    return switch (type) {
      HorizonButtonType.primary => AuroraRadius.full,
    };
  }

  Color get _borderColor {
    return switch (type) {
      HorizonButtonType.primary =>
        enabled ? AuroraColors.darkNavy50 : AuroraColors.darkGrey30,
    };
  }

  Color get _backgroundColor {
    return switch (type) {
      HorizonButtonType.primary =>
        enabled ? AuroraColors.darkNavy50 : AuroraColors.actionDisabledBg,
    };
  }

  Color get _textColor {
    return switch (type) {
      HorizonButtonType.primary =>
        enabled ? AuroraColors.actionPrimaryFg : AuroraColors.darkGrey30,
    };
  }

  TextStyle get _textStyle {
    return AuroraTextStyle.bodySemiboldM.apply(color: _textColor);
  }

  @override
  Widget build(BuildContext context) {
    return TweenAnimationBuilder<Color?>(
      tween: ColorTween(begin: Colors.transparent, end: _backgroundColor),
      duration: const Duration(milliseconds: 200),
      curve: Curves.easeInOut,
      builder: (BuildContext context, Color? animatedBg, _) {
        return Material(
          color: animatedBg,
          shape: RoundedRectangleBorder(
            side: BorderSide(width: AuroraStroke.md, color: _borderColor),
            borderRadius: BorderRadius.all(Radius.circular(_borderRadius)),
          ),
          child: InkWell(
            borderRadius: BorderRadius.all(Radius.circular(_borderRadius)),
            onTap: enabled ? onPressed : onDisabledPressed,
            child: Container(
              height: 44,
              alignment: Alignment.center,
              padding: const EdgeInsets.symmetric(
                horizontal: AuroraSpacing.lg,
                // vertical: AuroraSpacing.md,
              ),
              child: _ButtonContent(
                text: text,
                textColor: _textColor,
                textStyle: _textStyle,
                leadingIcon: leadingIcon,
                trailingIcon: trailingIcon,
                loading: loading,
                size: size,
              ),
            ),
          ),
        );
      },
    );
  }
}

class _ButtonContent extends StatelessWidget {
  const _ButtonContent({
    required this.text,
    required this.textColor,
    required this.textStyle,
    required this.leadingIcon,
    required this.trailingIcon,
    required this.loading,
    required this.size,
  });

  final String text;
  final Color textColor;
  final TextStyle textStyle;
  final Widget? leadingIcon;
  final Widget? trailingIcon;
  final bool loading;
  final HorizonButtonSize size;

  @override
  Widget build(BuildContext context) {
    if (loading && size == HorizonButtonSize.large) {
      return SizedBox.square(
        dimension: 18,
        child: CircularProgressIndicator(color: textColor),
      );
    }

    return Row(
      mainAxisSize: MainAxisSize.min,
      spacing: 6,
      children: <Widget>[
        if (leadingIcon != null)
          SizedBox.square(dimension: 16, child: leadingIcon),
        Text(text, style: textStyle),
        if (trailingIcon != null)
          SizedBox.square(dimension: 16, child: trailingIcon),
      ],
    );
  }
}
