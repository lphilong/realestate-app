import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import '../../../constants/constants.dart';
import '../../../constants/controllers.dart';
import '../models/properties_model.dart';
import '../widgets/propdetail_widget.dart';
import 'chat_screen.dart';

class PropertyDetail extends StatefulWidget {
  final Props property;

  const PropertyDetail({Key? key, required this.property}) : super(key: key);

  @override
  _PropertyDetailState createState() => _PropertyDetailState();
}

class _PropertyDetailState extends State<PropertyDetail> {
  int activeIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Pallete.appBar,
        iconTheme: const IconThemeData(color: Pallete.lightBlue),
        actions: [
          IconButton(
              onPressed: () {
                homeController.clearChat();
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => ChatScreen(
                              senders: widget.property,
                            )));
              },
              icon: const Icon(
                Icons.insert_comment_outlined,
                color: Pallete.lightBlue,
              ))
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            ListTile(
              title: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      const Text(
                        'ID: ',
                        style: AppFonts.h6,
                      ),
                      Text(
                        widget.property.id.toString(),
                        style: AppFonts.h2,
                      ),
                    ],
                  )
                ],
              ),
              subtitle: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  const SizedBox(
                    height: 15,
                  ),
                  Column(
                    children: [
                      CarouselSlider.builder(
                        itemBuilder: (context, index, realIndex) {
                          final urlImage =
                              widget.property.picProperties![index];
                          return buildImage(urlImage!, index);
                        },
                        itemCount: widget.property.picProperties!.length,
                        options: CarouselOptions(
                          autoPlay: false,
                          enlargeCenterPage: true,
                          aspectRatio: 2,
                          viewportFraction: 1,
                          enableInfiniteScroll: false,
                          onPageChanged: (index, reason) =>
                              setState(() => activeIndex = index),
                        ),
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      buildIndicator(widget.property, activeIndex)
                    ],
                  )
                ],
              ),
            ),
            ListTile(
              title: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  const Text(
                    'Price: ',
                    style: AppFonts.h6,
                  ),
                  Text(
                    widget.property.priceSale.toString(),
                    style: AppFonts.h11,
                  ),
                  const SizedBox(
                    width: 5,
                  ),
                  Text(
                    widget.property.currency.toString(),
                    style: AppFonts.h15,
                  )
                ],
              ),
              trailing: Text(
                widget.property.status.toString(),
                style: AppFonts.h10,
              ),
            ),
            ListTile(
              title: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  Text(
                    'Address: ',
                    style: AppFonts.h6,
                  ),
                  SizedBox(
                    height: 10,
                  )
                ],
              ),
              subtitle: Text(
                widget.property.address1.toString(),
                textAlign: TextAlign.justify,
                style: AppFonts.h2,
              ),
            ),
            ListTile(
              title: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  const Text(
                    'Property type: ',
                    style: AppFonts.h6,
                  ),
                  Text(
                    widget.property.typeName.toString(),
                    style: AppFonts.h2,
                  )
                ],
              ),
            ),
            SizedBox(
              width: 360,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          const Text(
                            'Bedroom: ',
                            style: AppFonts.h6,
                          ),
                          Text(
                            widget.property.beds.toString(),
                            style: AppFonts.h2,
                          )
                        ],
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      Row(
                        children: [
                          const Text(
                            'Terrace: ',
                            style: AppFonts.h6,
                          ),
                          Text(
                            widget.property.terraceSpace.toString(),
                            style: AppFonts.h2,
                          )
                        ],
                      )
                    ],
                  ),
                  const SizedBox(
                    width: 100,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          const Text(
                            'Bathroom: ',
                            style: AppFonts.h6,
                          ),
                          Text(
                            widget.property.baths.toString(),
                            style: AppFonts.h2,
                          )
                        ],
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      Row(
                        children: [
                          const Text(
                            'Garden: ',
                            style: AppFonts.h6,
                          ),
                          Text(
                            widget.property.gardenSpace.toString(),
                            style: AppFonts.h2,
                          )
                        ],
                      )
                    ],
                  )
                ],
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            ListTile(
              title: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  Text(
                    'Description: ',
                    style: AppFonts.h6,
                  ),
                  SizedBox(
                    height: 10,
                  )
                ],
              ),
              subtitle: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    widget.property.description.toString(),
                    style: AppFonts.h2,
                    textAlign: TextAlign.justify,
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
