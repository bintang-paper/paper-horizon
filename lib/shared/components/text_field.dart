import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show TextInputFormatter;
import 'package:paper_horizon/core/extensions/string_ext.dart';
import 'package:paper_horizon/shared/components/rich_text.dart';
import 'package:paper_horizon/shared/ds/aurora.dart';

enum HorizonTextFieldTypeEnum {
  outline;

  double get padding {
    return switch (this) {
      HorizonTextFieldTypeEnum.outline => AuroraSpacing.lg,
    };
  }
}

class HorizonTextField extends StatefulWidget {
  const HorizonTextField({
    super.key,

    /// additional parameter
    this.label,
    this.labelStyle = AuroraTextStyle.bodySemiboldM,
    this.suffixLabel,
    this.suffixLabelStyle = AuroraTextStyle.bodyM,
    this.leadingLabelIcon,
    this.trailingLabelIcon,
    this.required = false,
    this.type = HorizonTextFieldTypeEnum.outline,
    this.onFocusChange,
    this.onControllerChanged,

    /// [TextFormField] default parameter
    this.controller,
    this.focusNode,
    this.keyboardType,
    this.textCapitalization = TextCapitalization.none,
    this.textInputAction,
    this.style,
    this.textDirection,
    this.textAlign = TextAlign.start,
    this.textAlignVertical = TextAlignVertical.top,
    this.autoFocus = false,
    this.readOnly = false,
    this.obscureText = false,
    this.maxLines = 1,
    this.minLines = 1,
    this.expands = false,
    this.maxLength,
    this.enabled = true,
    this.contentPadding,
    this.onEditingComplete,
    this.onTap,
    this.onTapOutside,
    this.onChanged,
    this.onFieldSubmitted,
    this.onSaved,
    this.autoValidateMode = AutovalidateMode.onUserInteraction,
    this.validator,
    this.inputFormatters,

    /// decoration parameter
    this.hint,
    this.hintStyle,
    this.helper,
    this.helperStyle,
    this.error,
    this.errorStyle,
    this.prefixIcon,
    this.suffixIcon,
    this.prefixIconConstraints = const BoxConstraints(),
    this.suffixIconConstraints = const BoxConstraints(),
    this.fillColor = AuroraColors.surfaceLightDefault,
    this.borderColor = AuroraColors.borderDefault,
    this.enabledBorderColor = AuroraColors.borderDefault,
    this.disabledBorderColor = AuroraColors.darkGrey30,
    this.focusedBorderColor = AuroraColors.lightBrand50,
    this.errorBorderColor = AuroraColors.stateDangerTextLight,
    this.focusedErrorBorderColor = AuroraColors.stateDangerTextLight,
  });

  /// additional parameter
  final String? label;
  final TextStyle labelStyle;
  final String? suffixLabel;
  final TextStyle suffixLabelStyle;
  final Widget? leadingLabelIcon;
  final Widget? trailingLabelIcon;
  final bool required;
  final HorizonTextFieldTypeEnum type;
  final ValueChanged<bool>? onFocusChange;
  final VoidCallback? onControllerChanged;

  /// [TextFormField] default parameter
  final TextEditingController? controller;
  final FocusNode? focusNode;
  final TextInputType? keyboardType;
  final TextCapitalization textCapitalization;
  final TextInputAction? textInputAction;
  final TextStyle? style;
  final TextDirection? textDirection;
  final TextAlign textAlign;
  final TextAlignVertical? textAlignVertical;
  final bool autoFocus;
  final bool readOnly;
  final bool obscureText;
  final int maxLines;
  final int minLines;
  final bool expands;
  final int? maxLength;
  final bool enabled;
  final EdgeInsets? contentPadding;
  final VoidCallback? onEditingComplete;
  final VoidCallback? onTap;
  final ValueChanged<PointerDownEvent>? onTapOutside;
  final ValueChanged<String>? onChanged;
  final ValueChanged<String>? onFieldSubmitted;
  final ValueChanged<String?>? onSaved;
  final AutovalidateMode autoValidateMode;
  final String? Function(String?)? validator;
  final List<TextInputFormatter>? inputFormatters;

  /// decoration parameter
  final String? hint;
  final TextStyle? hintStyle;
  final String? helper;
  final TextStyle? helperStyle;
  final String? error;
  final TextStyle? errorStyle;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final BoxConstraints prefixIconConstraints;
  final BoxConstraints suffixIconConstraints;
  final Color? fillColor;
  final Color borderColor;
  final Color enabledBorderColor;
  final Color disabledBorderColor;
  final Color focusedBorderColor;
  final Color errorBorderColor;
  final Color focusedErrorBorderColor;

  @override
  State<HorizonTextField> createState() => HorizonTextFieldState();
}

class HorizonTextFieldState extends State<HorizonTextField> {
  late final GlobalKey<FormState> _textFieldKey;

  late ValueNotifier<bool> _isFocus;
  late ValueNotifier<bool> isError;
  late ScrollController _scrollController;

  @override
  void initState() {
    super.initState();
    _textFieldKey = GlobalKey<FormState>();

    _isFocus = ValueNotifier<bool>(false);
    isError = ValueNotifier<bool>(false);
    _scrollController = ScrollController();

    // Listen to controller changes for programmatic updates
    widget.controller?.addListener(_onControllerTextChanged);
  }

  void _onControllerTextChanged() {
    // Only trigger when controller changes programmatically (not user typing)
    // User typing triggers onChanged callback, so we skip if field is focused
    final bool isFocused = widget.focusNode?.hasFocus ?? _isFocus.value;

    if (widget.onControllerChanged != null && !isFocused) {
      final String value = widget.controller?.text ?? '';
      final String? errorResult = widget.validator?.call(value);
      isError.value = errorResult != null;
      widget.onControllerChanged?.call();
    }
  }

  @override
  void dispose() {
    widget.controller?.removeListener(_onControllerTextChanged);
    _isFocus.dispose();
    isError.dispose();
    super.dispose();
  }

  bool validateTextField() {
    return _textFieldKey.currentState?.validate() ?? false;
  }

  double get _lPadding {
    return widget.contentPadding?.left ?? widget.type.padding;
  }

  double get _rPadding {
    return widget.contentPadding?.right ?? widget.type.padding;
  }

  InputBorder _border(Color color) {
    return switch (widget.type) {
      HorizonTextFieldTypeEnum.outline => OutlineInputBorder(
        borderSide: BorderSide(color: color),
        borderRadius: const BorderRadius.all(Radius.circular(AuroraRadius.lg)),
      ),
    };
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        if (widget.label.isNotNull) ...<Widget>[
          Row(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              if (widget.leadingLabelIcon != null) ...<Widget>[
                SizedBox.square(dimension: 20, child: widget.leadingLabelIcon),
                const SizedBox(width: AuroraSpacing.sm),
              ],
              ValueListenableBuilder<bool>(
                valueListenable: _isFocus,
                builder: (_, bool hasFocus, _) {
                  return ValueListenableBuilder<bool>(
                    valueListenable: isError,
                    builder: (_, bool hasError, _) {
                      return Text(
                        '${widget.label}',
                        style: widget.labelStyle.apply(
                          color: hasError
                              ? AuroraColors.stateDangerTextLight
                              : hasFocus
                              ? AuroraColors.lightBrand50
                              : AuroraColors.textSecondary,
                        ),
                      );
                    },
                  );
                },
              ),
              if (widget.suffixLabel.isNotNull)
                Text(
                  widget.suffixLabel!,
                  style: widget.suffixLabelStyle.secondary,
                ),
              if (widget.required)
                Text(' *', style: AuroraTextStyle.bodySemiboldM.dangerLight),
              if (widget.trailingLabelIcon != null) ...<Widget>[
                const SizedBox(width: AuroraSpacing.sm),
                SizedBox.square(dimension: 20, child: widget.trailingLabelIcon),
              ],
            ],
          ),
          const SizedBox(height: AuroraSpacing.xs),
        ],
        Focus(
          focusNode: widget.focusNode,
          onFocusChange: (bool hasFocus) {
            _isFocus.value = hasFocus;
            widget.onFocusChange?.call(hasFocus);
          },
          child: RawScrollbar(
            controller: _scrollController,
            thickness: 4,
            thumbVisibility: true,
            trackVisibility: true,
            thumbColor: AuroraColors.lightBrand50,
            trackColor: AuroraColors.actionDisabledBg,
            trackBorderColor: AuroraColors.darkGrey30,
            radius: const Radius.circular(10),
            trackRadius: const Radius.circular(10),
            child: SingleChildScrollView(
              controller: _scrollController,
              child: Form(
                key: _textFieldKey,
                child: TextFormField(
                  controller: widget.controller,
                  buildCounter:
                      (
                        BuildContext context, {
                        required int currentLength,
                        required bool isFocused,
                        required int? maxLength,
                      }) => null,
                  decoration: InputDecoration(
                    enabled: widget.enabled,
                    isDense: true,
                    contentPadding: EdgeInsets.only(
                      top: widget.contentPadding?.top ?? 14,
                      bottom: widget.contentPadding?.bottom ?? 14,
                    ),
                    prefix: widget.prefixIcon != null
                        ? null
                        : SizedBox(width: _lPadding),
                    prefixIcon: widget.prefixIcon == null
                        ? null
                        : Padding(
                            padding: EdgeInsets.only(
                              left: _lPadding,
                              right: _lPadding / 2,
                            ),
                            child: widget.prefixIcon,
                          ),
                    prefixIconConstraints: widget.prefixIconConstraints,
                    suffixIcon: widget.suffixIcon == null
                        ? null
                        : Padding(
                            padding: EdgeInsets.only(
                              left: _rPadding / 2,
                              right: _rPadding,
                            ),
                            child: widget.suffixIcon,
                          ),
                    suffixIconConstraints: widget.suffixIconConstraints,
                    hintText: widget.hint,
                    hintStyle: widget.hintStyle ?? AuroraTextStyle.bodyM.muted,
                    hintMaxLines: 1,
                    errorText: widget.error,
                    errorStyle:
                        widget.errorStyle ?? AuroraTextStyle.bodyS.dangerLight,
                    errorMaxLines: 2,
                    filled: widget.fillColor != null,
                    fillColor: widget.fillColor,
                    border: _border(widget.borderColor),
                    enabledBorder: _border(widget.enabledBorderColor),
                    disabledBorder: _border(widget.disabledBorderColor),
                    errorBorder: _border(widget.errorBorderColor),
                    focusedBorder: _border(widget.focusedBorderColor),
                    focusedErrorBorder: _border(widget.focusedErrorBorderColor),
                  ),
                  keyboardType: widget.keyboardType,
                  textCapitalization: widget.textCapitalization,
                  textInputAction: widget.textInputAction,
                  style: widget.style ?? AuroraTextStyle.bodyM.primary,
                  textDirection: widget.textDirection,
                  textAlign: widget.textAlign,
                  textAlignVertical: widget.textAlignVertical,
                  autofocus: widget.autoFocus,
                  readOnly: widget.readOnly,
                  obscureText: widget.obscureText,
                  autocorrect: false,
                  smartDashesType: SmartDashesType.disabled,
                  smartQuotesType: SmartQuotesType.disabled,
                  maxLines: widget.maxLines,
                  minLines: widget.minLines,
                  expands: widget.expands,
                  maxLength: widget.maxLength,
                  enabled: widget.enabled,
                  onEditingComplete: widget.onEditingComplete,
                  onTap: widget.onTap,
                  onTapOutside: (PointerDownEvent v) {
                    widget.onTapOutside?.call(v);
                    FocusManager.instance.primaryFocus?.unfocus();
                  },
                  onChanged: (String v) {
                    isError.value = widget.validator?.call(v) != null;
                    widget.onChanged?.call(v);
                  },
                  onFieldSubmitted: widget.onFieldSubmitted,
                  onSaved: widget.onSaved,
                  autovalidateMode: widget.autoValidateMode,
                  validator: widget.validator,
                  inputFormatters: widget.inputFormatters,
                  spellCheckConfiguration:
                      const SpellCheckConfiguration.disabled(),
                ),
              ),
            ),
          ),
        ),
        if (widget.helper != null) ...<Widget>[
          const SizedBox(height: AuroraSpacing.xs),
          HorizonRichText(
            widget.helper!,
            style: widget.helperStyle ?? AuroraTextStyle.bodyS.secondary,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
        ],
      ],
    );
  }
}
