import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:get/get.dart';
import 'package:movie2/app/core/widgets/myText/my_text_widget.dart';
import '../../../core/widgets/myLoading/my_loading_widget.dart';
import '../controllers/movie_detail_controller.dart';

import 'package:youtube_player_iframe/youtube_player_iframe.dart';

class MovieDetailPage extends GetView<MovieDetailController> {
  MovieDetailPage({Key? key}) : super(key: key);

  @override
  final MovieDetailController controller = Get.find();

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return Scaffold(
        appBar: AppBar(
          title: MyText.h3Medium(controller.model.title.toString()),
          backgroundColor: Colors.black,
          foregroundColor: Colors.white,
        ),
        backgroundColor: Colors.black,
        body: (controller.loading.value) ? const MyLoading() : createScreen(),
      );
    });
  }

  Widget createScreen() {
    return Container(
      height: Get.size.height,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: Image.network(
            'https://image.tmdb.org/t/p/original${controller.model.poster_path}',
          ).image,
          fit: BoxFit.fitHeight,
          colorFilter:
              ColorFilter.mode(Colors.black.withOpacity(0.5), BlendMode.dstIn),
        ),
      ),
      child: Stack(
        children: [
          Container(
            height: Get.size.height,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Colors.black.withOpacity(1),
                  Colors.black.withOpacity(0),
                  Colors.black.withOpacity(0.5),
                  Colors.black.withOpacity(1),
                ],
              ),
            ),
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 100,
                    ),
                    Center(
                        child: SizedBox(
                      height: Get.size.height * 0.5,
                      child: Hero(
                        tag: controller.model.id.toString(),
                        child: CachedNetworkImage(
                          imageUrl:
                              'https://image.tmdb.org/t/p/original${controller.model.poster_path}',
                        ),
                      ),
                    )),
                    SizedBox(
                      height: 32,
                    ),
                    MyText.h1Medium(
                      controller.model.title.toString(),
                      color: Colors.white,
                    ),
                    SizedBox(
                      height: 24,
                    ),

                    MyText.h2Medium(
                      "Sinopse",
                      color: Colors.white,
                    ),
                    MyText.h3Regular(controller.model.overview.toString(),
                        color: Colors.grey[300]),
                    SizedBox(
                      height: 32,
                    ),
                    ...trailerGroup(),
                    SizedBox(
                      height: 24,
                    ),

                    MyText.h2Medium(
                      "Elenco",
                      color: Colors.white,
                    ),
                    createElencoList(),
                    SizedBox(
                      height: 32,
                    ),

                    ...watchIn(
                        controller.provider.value.flatrate, "Assista em"),
                    ...watchIn(controller.provider.value.buy, "Compre em"),
                    ...watchIn(controller.provider.value.rent, "Alugue em"),
                    //controller.lstAssistaEm,
                  ],
                ),
              ),
            ),
          ),
          Positioned(
            top: 30,
            right: 20,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                RatingBar.builder(
                  initialRating:
                      (controller.model.vote_average!.toDouble() / 2),
                  minRating: 1,
                  itemSize: 25,
                  direction: Axis.horizontal,
                  allowHalfRating: true,
                  itemCount: 5,
                  itemPadding: EdgeInsets.symmetric(horizontal: 4.0),
                  itemBuilder: (context, _) => Icon(
                    Icons.star,
                    color: Colors.amber,
                  ),
                  onRatingUpdate: (rating) {},
                ),
                MyText.h4Regular(
                  'Votos: ${controller.model.vote_count.toString()}',
                  color: Colors.white,
                )
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget createElencoList() {
    return SizedBox(
      height: 290,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: controller.lstElenco.length,
        itemBuilder: (BuildContext context, int index) {
          return Stack(
            children: [
              Container(
                margin: EdgeInsets.all(8),
                padding: EdgeInsets.all(2),
                alignment: Alignment.topLeft,
                constraints: BoxConstraints(minWidth: 180, maxWidth: 180),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Container(
                      decoration: BoxDecoration(color: Colors.black),
                      child: Center(
                          child: MyText.h4Regular(
                        controller.lstElenco[index].original_name.toString(),
                        color: Colors.white,
                      )),
                    ),
                    Container(
                      decoration: BoxDecoration(color: Colors.black),
                      child: Center(
                          child: MyText.h5Regular(
                        controller.lstElenco[index].character.toString(),
                        color: Colors.white,
                      )),
                    ),
                  ],
                ),
                decoration: BoxDecoration(
                    image: DecorationImage(
                      image: Image.network(
                        'https://image.tmdb.org/t/p/original${controller.lstElenco[index].profile_path}',
                      ).image,
                      fit: BoxFit.fitHeight,
                    ),
                    color: Colors.white,
                    border: Border.all(color: Color(0x0ffEEEEEE)),
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(15),
                      topRight: Radius.circular(15),
                    )),
              ),
              Center(),
            ],
          );
        },
      ),
    );
  }

  watchIn(List? lstProvedores, String textHeader) {
    if (lstProvedores == null) {
      return [Container()];
    }
    if (lstProvedores.isEmpty) {
      return [Container()];
    }

    return [
      MyText.h2Medium(
        textHeader,
        color: Colors.white,
      ),
      SizedBox(
        height: 150,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: lstProvedores.length,
          itemBuilder: (BuildContext context, int index) {
            return Stack(
              children: [
                Container(
                  margin: EdgeInsets.all(8),
                  padding: EdgeInsets.all(1),
                  alignment: Alignment.topLeft,
                  constraints: BoxConstraints(minWidth: 80, maxWidth: 100),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Container(
                        decoration: BoxDecoration(color: Colors.black),
                        child: Center(
                            child: MyText.h4Regular(
                          lstProvedores[index].provider_name.toString(),
                          color: Colors.white,
                        )),
                      ),
                    ],
                  ),
                  decoration: BoxDecoration(
                      image: DecorationImage(
                        image: Image.network(
                          'https://image.tmdb.org/t/p/original${lstProvedores[index].logo_path}',
                        ).image,
                        fit: BoxFit.fitHeight,
                      ),
                      color: Colors.white,
                      border: Border.all(color: Color(0x0ffEEEEEE)),
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(15),
                        topRight: Radius.circular(15),
                      )),
                ),
                Center(),
              ],
            );
          },
        ),
      ),
      SizedBox(
        height: 35,
      )
    ];
  }

  trailerGroup() {
    return (controller.youtubeController == null)
        ? []
        : [
            MyText.h2Medium(
              "Trailer",
              color: Colors.white,
            ),
            SizedBox(
              height: 24,
            ),
            YoutubePlayerIFrame(
              controller: controller.youtubeController,
              aspectRatio: 16 / 9,
            ),
          ];
  }
}
