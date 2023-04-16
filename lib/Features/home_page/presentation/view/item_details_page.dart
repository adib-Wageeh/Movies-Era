import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_era_app/Features/home_page/data/models/movie_model.dart';
import 'package:movies_era_app/Features/home_page/data/repos/home_repo_impl.dart';
import 'package:movies_era_app/Features/home_page/presentation/view/widgets/details_page_widgets/ItemNameDetailsPage.dart';
import 'package:movies_era_app/Features/home_page/presentation/view/widgets/details_page_widgets/bottom_container_details_page.dart';
import 'package:movies_era_app/Features/home_page/presentation/view/widgets/details_page_widgets/details_page_appbar.dart';
import 'package:movies_era_app/Features/home_page/presentation/view/widgets/details_page_widgets/details_page_image.dart';
import 'package:movies_era_app/Features/home_page/presentation/view/widgets/item_data_row.dart';
import '../../../../core/utils/service_locator.dart';
import '../../../../core/utils/styles.dart';
import '../manager/simular_movies_bloc/similar_movies_cubit.dart';


class ItemDetailsPage extends StatelessWidget {

  final Movie movie;

  const ItemDetailsPage({required this.movie, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SimilarMoviesCubit(homeRepo: getIt.get<HomeRepositoryImpl>())..getSimilarMovies(movie),
      child: Scaffold(
        body: SafeArea(
          child:
      CustomScrollView(

            physics: const BouncingScrollPhysics(),
            slivers: [

              SliverFillRemaining(
                hasScrollBody: false,
                child: Column(
                  children: [
                    const DetailsPageAppBar(),
                    DetailsPageImage(movie: movie),
                    DetailsPageItemName(movie: movie),
                    const SizedBox(height: 8,),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          width: 60,
                          height: 30,
                          decoration: BoxDecoration(color: Colors.grey.shade700,borderRadius: BorderRadius.circular(8)),
                          child: Center(
                            child: Text(movie.releaseDate!.split("-")[0],style: Styles.textStyle16.copyWith(
                                color: Colors.white
                            )),
                          ),
                        ),
                        const SizedBox(width: 7,),
                        ItemDataRow(movie: movie),
                      ],
                    ),
                    const SizedBox(height: 10,),
                    //const CustomSplitButton(),
                    Expanded(
                      child: Container(
                        width: double.infinity,
                        height: double.infinity,
                        decoration: const BoxDecoration(color: Color(0xff1B1B1B),
                        borderRadius: BorderRadius.only(topLeft: Radius.circular(16),
                        topRight: Radius.circular(16),
                        )
                        ),
                        child: Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 24.0,vertical: 10),
                              child: Text(
                                movie.overview??"No Overview Available"
                              ),
                            ),
                            const SizedBox(height: 70,),
                            const DetailsPageBottomContainer()
                          ],
                        ),

                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}









