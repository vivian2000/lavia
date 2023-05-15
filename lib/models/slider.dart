import 'package:la_via/constants.dart';

class Slider {
  final String sliderImageUrl;
  final String sliderHeading;
  final String sliderSubHeading;

  Slider(
      {required this.sliderImageUrl,
        required this.sliderHeading,
        required this.sliderSubHeading});
}

final sliderArrayList = [
  Slider(
      sliderImageUrl: 'images/slider_1.png',
      sliderHeading: Constants.SLIDER_HEADING_1,
      sliderSubHeading: Constants.SLIDER_DESC_1),
  Slider(
      sliderImageUrl: 'images/slider_2.png',
      sliderHeading: Constants.SLIDER_HEADING_2,
      sliderSubHeading: Constants.SLIDER_DESC_2),
  Slider(
      sliderImageUrl: 'images/slider_3.png',
      sliderHeading: Constants.SLIDER_HEADING_3,
      sliderSubHeading: Constants.SLIDER_DESC_3),
];