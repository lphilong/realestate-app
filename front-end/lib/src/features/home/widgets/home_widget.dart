import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../../../constants/constants.dart';
import '../../../constants/controllers.dart';
import '../models/properties_model.dart';
import '../screens/prop_detail.dart';

class HomeWidget extends StatefulWidget {
  const HomeWidget({Key? key}) : super(key: key);

  @override
  _HomeWidget createState() => _HomeWidget();
}

class _HomeWidget extends State<HomeWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [Color(0xFFf85187), Color(0xFF3ac3cb)]),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Column(
          children: [
            Expanded(
              child: FutureBuilder<List<Props>>(
                  future: homeController.getProps(),
                  builder: (context, AsyncSnapshot<List<Props>> snapshot) {
                    if (homeController.propsList.isEmpty) {
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    } else {
                      List<Props> properties = homeController.propsList;
                      return ListView.builder(
                          padding: const EdgeInsets.all(5),
                          itemCount: properties.length,
                          itemBuilder: (context, index) {
                            int reverseIndex = properties.length - 1 - index;
                            Props property = properties[reverseIndex];
                            return Card(
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(15)),
                              elevation: 5,
                              margin: const EdgeInsets.symmetric(
                                  vertical: 5, horizontal: 5),
                              child: ListTile(
                                title: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          property.priceSale.toString(),
                                          style: AppFonts.h11,
                                        ),
                                        const SizedBox(
                                          width: 5,
                                        ),
                                        Text(
                                          property.currency.toString(),
                                          style: AppFonts.h15,
                                        ),
                                      ],
                                    ),
                                    Text(
                                      property.status.toString(),
                                      style: AppFonts.h10,
                                    ),
                                    const SizedBox(
                                      width: 5,
                                    ),
                                    IconButton(
                                        onPressed: () {},
                                        icon: const Icon(
                                          Icons.more_horiz_outlined,
                                          color: Colors.black,
                                        ))
                                  ],
                                ),
                                subtitle: Column(
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        SizedBox(
                                          width: 150,
                                          height: 200,
                                          child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceAround,
                                            children: [
                                              Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.start,
                                                children: [
                                                  const Text(
                                                    'Commission: ',
                                                    style: AppFonts.h2,
                                                  ),
                                                  Flexible(
                                                      child: Text(
                                                    property.commission
                                                        .toString(),
                                                    overflow:
                                                        TextOverflow.ellipsis,
                                                    style: AppFonts.h2,
                                                  )),
                                                  const Text(
                                                    '%',
                                                    style: AppFonts.h2,
                                                  )
                                                ],
                                              ),
                                              Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                children: <Widget>[
                                                  ClipRRect(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            10),
                                                    child: CachedNetworkImage(
                                                      imageUrl: property
                                                          .picProperties!
                                                          .elementAt(0)
                                                          .toString(),
                                                      width: 145,
                                                      height: 90,
                                                      fit: BoxFit.fill,
                                                    ),
                                                  )
                                                ],
                                              ),
                                              Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.start,
                                                children: [
                                                  const Icon(
                                                    Icons.grid_on,
                                                    color: Colors.black,
                                                  ),
                                                  const SizedBox(
                                                    width: 7,
                                                  ),
                                                  Text(
                                                    property.dimension
                                                        .toString(),
                                                    style: AppFonts.h2,
                                                  )
                                                ],
                                              ),
                                              Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment.start,
                                                    children: [
                                                      const Icon(
                                                        Icons
                                                            .bedroom_parent_outlined,
                                                        color: Colors.black,
                                                      ),
                                                      const SizedBox(
                                                        width: 7,
                                                      ),
                                                      Text(
                                                        property.beds
                                                            .toString(),
                                                        style: AppFonts.h2,
                                                      )
                                                    ],
                                                  ),
                                                  Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment.end,
                                                    children: [
                                                      const Icon(
                                                        Icons.bathroom_outlined,
                                                        color: Colors.black,
                                                      ),
                                                      const SizedBox(
                                                        width: 7,
                                                      ),
                                                      Text(
                                                        property.baths
                                                            .toString(),
                                                        style: AppFonts.h2,
                                                      )
                                                    ],
                                                  )
                                                ],
                                              )
                                            ],
                                          ),
                                        ),
                                        SizedBox(
                                          width: 170,
                                          height: 200,
                                          child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              const SizedBox(
                                                width: 7,
                                              ),
                                              Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.start,
                                                children: [
                                                  const SizedBox(
                                                    width: 4,
                                                  ),
                                                  const Text(
                                                    'ID   ',
                                                    style: AppFonts.h2,
                                                  ),
                                                  Text(
                                                    property.id.toString(),
                                                    style: AppFonts.h2,
                                                  )
                                                ],
                                              ),
                                              Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.start,
                                                children: [
                                                  SizedBox(
                                                    height: 40,
                                                    child: Column(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .center,
                                                      children: const [
                                                        Icon(
                                                          Icons
                                                              .apartment_outlined,
                                                          color: Colors.black,
                                                        )
                                                      ],
                                                    ),
                                                  ),
                                                  const SizedBox(
                                                    width: 7,
                                                  ),
                                                  SizedBox(
                                                    width: 130,
                                                    height: 40,
                                                    child: Column(
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .center,
                                                      children: [
                                                        Text(
                                                          property.typeName
                                                              .toString(),
                                                          style: AppFonts.h2,
                                                          maxLines: 2,
                                                          overflow: TextOverflow
                                                              .ellipsis,
                                                        )
                                                      ],
                                                    ),
                                                  )
                                                ],
                                              ),
                                              Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.start,
                                                children: [
                                                  SizedBox(
                                                    height: 40,
                                                    child: Column(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .center,
                                                      children: const [
                                                        Icon(
                                                          Icons
                                                              .apartment_outlined,
                                                          color: Colors.black,
                                                        )
                                                      ],
                                                    ),
                                                  ),
                                                  const SizedBox(
                                                    width: 7,
                                                  ),
                                                  SizedBox(
                                                    width: 130,
                                                    height: 40,
                                                    child: Column(
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .center,
                                                      children: [
                                                        Text(
                                                          property.subtypeName
                                                              .toString(),
                                                          style: AppFonts.h2,
                                                          maxLines: 2,
                                                          overflow: TextOverflow
                                                              .ellipsis,
                                                        )
                                                      ],
                                                    ),
                                                  )
                                                ],
                                              ),
                                              Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.start,
                                                children: [
                                                  SizedBox(
                                                    height: 40,
                                                    child: Column(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .center,
                                                      children: const [
                                                        Icon(
                                                          Icons
                                                              .location_on_outlined,
                                                          color: Colors.black,
                                                        )
                                                      ],
                                                    ),
                                                  ),
                                                  const SizedBox(
                                                    width: 7,
                                                  ),
                                                  SizedBox(
                                                    width: 120,
                                                    height: 40,
                                                    child: Column(
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .center,
                                                      children: [
                                                        Text(
                                                          property.address1
                                                              .toString(),
                                                          style: AppFonts.h2,
                                                          maxLines: 2,
                                                          overflow: TextOverflow
                                                              .ellipsis,
                                                        )
                                                      ],
                                                    ),
                                                  )
                                                ],
                                              )
                                            ],
                                          ),
                                        )
                                      ],
                                    ),
                                  ],
                                ),
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => PropertyDetail(
                                                property: property,
                                              )));
                                },
                              ),
                            );
                          });
                    }
                  }),
            )
          ],
        ),
      ),
    );
  }
}
