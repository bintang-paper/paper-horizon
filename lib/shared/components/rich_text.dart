import 'package:flutter/material.dart';
import 'package:paper_horizon/shared/ds/aurora.dart';

class HorizonRichText extends StatelessWidget {
  const HorizonRichText(
    this.text, {
    super.key,
    this.style,
    this.textAlign,
    this.overflow,
    this.maxLines,
  });

  final String text;
  final TextStyle? style;
  final TextAlign? textAlign;
  final TextOverflow? overflow;
  final int? maxLines;

  @override
  Widget build(BuildContext context) {
    final RegExp regex = RegExp('((?:<([A-Za-z]+)>)+)(.*?)(?:</[A-Za-z]+>)+');
    final Iterable<RegExpMatch> matches = regex.allMatches(text);

    final List<InlineSpan> children = <InlineSpan>[];
    int index = 0;

    for (final RegExpMatch match in matches) {
      final String initial = text.substring(index, match.start);
      if (initial.isNotEmpty) {
        children.add(TextSpan(text: initial));
      }

      final String? tags = match.group(1);
      if (tags != null) {
        TextStyle newStyle = style ?? AuroraTextStyle.bodyM.primary;

        if (tags.contains('<b>')) {
          newStyle = newStyle.copyWith(fontWeight: FontWeight.bold);
        }
        if (tags.contains('<i>')) {
          newStyle = newStyle.copyWith(fontStyle: FontStyle.italic);
        }
        if (tags.contains('<em>')) {
          newStyle = newStyle.copyWith(
            fontStyle: FontStyle.italic,
            fontWeight: FontWeight.normal,
          );
        }
        if (tags.contains('<u>')) {
          newStyle = newStyle.copyWith(decoration: TextDecoration.underline);
        }
        if (tags.contains('<link>')) {
          newStyle = newStyle.copyWith(
            color: AuroraColors.lightBrand50Old,
            decorationColor: AuroraColors.lightBrand50Old,
          );
        }

        children.add(
          TextSpan(text: match.group(3).toString(), style: newStyle),
        );
      }

      index = match.end;
    }

    final String end = text.substring(index, text.length);
    if (end.isNotEmpty) {
      children.add(TextSpan(text: end));
    }

    return Text.rich(
      TextSpan(children: children),
      style: style,
      textAlign: textAlign,
      overflow: overflow,
      maxLines: maxLines,
    );
  }
}
