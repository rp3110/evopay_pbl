import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:gool_goal_app/utils/image_assets.dart';

///[WidgetImageSlider] is widget responsible to show banner in home screen
/// * [_current] is responsible to show indicator below banner in home screen
/// * [_controller] is Carousel Controller
class WidgetImageSlider extends StatefulWidget {
  const WidgetImageSlider({Key? key}) : super(key: key);

  @override
  State<WidgetImageSlider> createState() => _WidgetImageSliderState();
}

class _WidgetImageSliderState extends State<WidgetImageSlider> {
  final ValueNotifier<int> _current = ValueNotifier<int>(0);
  final CarouselController _controller = CarouselController();

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
        valueListenable: _current,
        builder: (context, values, Widget? child) {
          return Column(
            children: [
              CarouselSlider.builder(
                itemCount: 3,
                itemBuilder:
                    (BuildContext context, int itemIndex, int pageViewIndex) {
                  return Image.asset(ImagePath.appLogo,
                      fit: BoxFit.cover,
                      height: 180,
                      width: MediaQuery.of(context).size.width);
                },
                carouselController: _controller,
                options: CarouselOptions(
                  height: 180,
                  aspectRatio: 3 / 2,
                  onPageChanged: (index, reason) {
                    _current.value = index;
                  },
                  viewportFraction: 1,
                  initialPage: 0,
                  enableInfiniteScroll: true,
                  reverse: false,
                  autoPlay: true,
                  autoPlayInterval: const Duration(seconds: 3),
                  autoPlayAnimationDuration: const Duration(milliseconds: 800),
                  autoPlayCurve: Curves.fastLinearToSlowEaseIn,
                  enlargeCenterPage: false,
                  scrollDirection: Axis.horizontal,
                ),
              ),
            ],
          );
        });
  }
}
