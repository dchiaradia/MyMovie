import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:get/get.dart';
import 'package:movie2/app/core/shared/stored_data.dart';
import 'package:movie2/app/core/widgets/myText/my_text_widget.dart';
import '../../../core/widgets/myLoading/my_loading_widget.dart';
import '../../domain/entities/movieModel.dart';
import '../controllers/home_controller.dart';

class HomePage extends GetView<HomeController> {
  HomePage({Key? key}) : super(key: key);

  @override
  final HomeController controller = Get.find();

  StoredData storedData = Get.find(); //LISTAGEM DE VARIAVEIS GLOBAIS

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const MyText.h2Medium(
            'Ultimos Lançamentos',
            color: Colors.white,
          ),
          backgroundColor: Colors.black,
          foregroundColor: Colors.white,
        ),
        backgroundColor: Color.fromARGB(255, 31, 31, 31),
        body: Obx(() {
          return (controller.loading.value)
              ? const MyLoading()
              : createScreen();
        }));
  }

  Widget createScreen() {
    return Column(
      children: [
        const SizedBox(
          height: 30,
        ),
        Expanded(
            child: ListView.builder(
          itemCount: controller.lstMovies.length,
          itemBuilder: (context, index) {
            return makeMovieTile(context, controller.lstMovies[index]);
          },
        )),
      ],
    );
  }

  Widget makeMovieTile(BuildContext context, Movie model) {
    return GestureDetector(
      onTap: () {
        print(model.toString());
        //Get.to(() => MovieDetailPage());
        //Get.offAll(MovieDetailPage());
        Get.toNamed('/movie_detail', arguments: model);
      },
      child: Container(
          padding: EdgeInsets.all(18),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                flex: 0,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 8,
                    ),
                    CachedNetworkImage(
                      height: 128,
                      imageUrl:
                          'https://image.tmdb.org/t/p/original${model.poster_path}',
                      placeholder: (context, url) => Center(
                        child: CircularProgressIndicator(),
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                  child: Padding(
                padding: EdgeInsets.all(8),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    MyText.h3Medium(
                      model.title.toString(),
                      color: Colors.white,
                    ),
                    RatingBar.builder(
                      initialRating: (model.vote_average == null)
                          ? 1.0
                          : double.parse(model.vote_average.toString()) / 2,
                      minRating: 1,
                      itemSize: 15,
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
                    SizedBox(
                      height: 16,
                    ),
                    Text(
                      model.overview.toString(),
                      maxLines: 6,
                      style: TextStyle(color: Colors.grey, fontSize: 12),
                    ),
                  ],
                ),
              )),
              SizedBox(
                height: 50,
              ),
              Divider(),
            ],
          )),
    );
  }
}
