import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:task/ui/kit/task_images.dart';

class VolumeSlider extends StatefulWidget {
  final double value;
  final ValueChanged<double> onChanged;

  const VolumeSlider({
    Key key,
    @required this.value,
    @required this.onChanged,
  }) : super(key: key);

  @override
  _TaskSliderState createState() => _TaskSliderState();
}

class _TaskSliderState extends State<VolumeSlider> {
  @override
  Widget build(BuildContext context) {
    final thumbSize = 28.0;
    final sliderPadding = 8.0;

    return LayoutBuilder(
      builder: (_, constraints) {
        final offsetX = (constraints.maxWidth - sliderPadding * 2 - thumbSize) *
                widget.value +
            sliderPadding;

        final offsetY = sliderPadding;

        return Stack(
          children: [
            Row(
              children: [
                Expanded(
                  child: CupertinoSlider(
                    activeColor: Colors.white,
                    value: widget.value,
                    onChanged: widget.onChanged,
                  ),
                ),
              ],
            ),
            IgnorePointer(
              ignoring: true,
              child: Transform.translate(
                offset: Offset(
                  offsetX,
                  offsetY,
                ),
                child: Container(
                  width: 28,
                  height: 28,
                  child: Center(
                    child: SvgPicture.asset(
                      TaskImages.volumeSliderThumb,
                      width: 17,
                      height: 14,
                    ),
                  ),
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}
