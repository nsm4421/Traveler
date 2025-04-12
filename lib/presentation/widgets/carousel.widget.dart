import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:module/shared/shared.export.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class NetworkImageCarouselWidget extends StatefulWidget {
  const NetworkImageCarouselWidget(this._images,
      {super.key,
      this.imageMaxHeight,
      this.borderRadius = 12,
      this.horizontalMargin = 8,
      this.dotSize = 12,
      this.showIndicator = true});

  final List<String> _images;
  final double borderRadius;
  final double horizontalMargin;
  final double? imageMaxHeight;
  final double dotSize;

  final bool showIndicator;

  @override
  State<NetworkImageCarouselWidget> createState() =>
      _NetworkImageCarouselWidgetState();
}

class _NetworkImageCarouselWidgetState extends State<NetworkImageCarouselWidget>
    with DebounceMixin {
  late PageController _pageController;

  @override
  void initState() {
    super.initState();
    _pageController = PageController();
  }

  @override
  void dispose() {
    super.dispose();
    _pageController.dispose();
  }

  _handleSwipeImage(int index) async => debounce(() async {
        await _pageController.animateToPage(
          index,
          duration: 300.durationInMilli,
          curve: Curves.easeInOut,
        );
      });

  @override
  Widget build(BuildContext context) {
    if (widget._images.isEmpty) {
      return const SizedBox.shrink();
    }
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        ConstrainedBox(
          constraints:
              BoxConstraints(maxHeight: widget.imageMaxHeight ?? context.width),
          child: PageView.builder(
              controller: _pageController,
              itemCount: widget._images.length,
              itemBuilder: (context, index) {
                return Container(
                    margin: EdgeInsets.symmetric(
                        horizontal: widget.horizontalMargin),
                    decoration: BoxDecoration(
                        borderRadius:
                            BorderRadius.circular(widget.borderRadius),
                        color: Colors.black,
                        image: DecorationImage(
                          fit: BoxFit.cover,
                          image:
                              CachedNetworkImageProvider(widget._images[index]),
                        )));
              }),
        ),
        if (widget.showIndicator && widget._images.length > 1)
          Padding(
            padding: EdgeInsets.symmetric(vertical: widget.dotSize),
            child: Center(
              child: SmoothPageIndicator(
                controller: _pageController,
                count: widget._images.length,
                onDotClicked: _handleSwipeImage,
                effect: WormEffect(
                  dotHeight: widget.dotSize,
                  dotWidth: widget.dotSize,
                  activeDotColor: context.colorScheme.primary,
                  dotColor: context.colorScheme.tertiary.withAlpha(50),
                  type: WormType.thinUnderground,
                ),
              ),
            ),
          )
      ],
    );
  }
}
