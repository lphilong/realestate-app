import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../../constants/constants.dart';
import '../models/properties_model.dart';

Widget buildImage(String urlImage, int index) => Container(
      margin: const EdgeInsets.symmetric(horizontal: 10),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(10),
        child: CachedNetworkImage(
          width: double.infinity,
          imageUrl: urlImage,
          fit: BoxFit.cover,
          placeholder: (context, url) => const Center(
            child: CircularProgressIndicator(),
          ),
        ),
      ),
    );

Widget buildIndicator(Props property, int activeIndex) =>
    AnimatedSmoothIndicator(
      activeIndex: activeIndex,
      count: property.picProperties!.length,
      effect: const ScrollingDotsEffect(
        dotWidth: 10,
        dotHeight: 10,
        activeDotColor: Pallete.lightBlue,
        dotColor: Colors.black12,
      ),
    );
