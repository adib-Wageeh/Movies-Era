import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../../../../../core/utils/assets_class.dart';
import '../../../../../core/utils/service_locator.dart';
import '../../../../home_page/data/models/movie_model.dart';
import '../../../../home_page/presentation/view/widgets/vertical_list_view_item.dart';
import '../../../data/repos/search_repo_impl.dart';
import '../../view_model/search_bloc/search_cubit.dart';


class SearchViewProvider extends StatelessWidget {
  const SearchViewProvider({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider<SearchCubit>(
        create: (context) => SearchCubit(searchRepo: getIt.get<SearchRepoImpl>()),
      child: const SearchViewBody(),
    );
  }
}



class SearchViewBody extends StatelessWidget {
  const SearchViewBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Column(
        children: [
          CustomTextField(onChange: (text){
            BlocProvider.of<SearchCubit>(context).searchForMovie(text);
          }),
          BlocBuilder<SearchCubit,SearchState>(builder:(context,state){

            if(state is SearchLoading){
              return const Center( child: CircularProgressIndicator(),);
            }else if(state is SearchError){
              return Expanded(child: Center( child: Text(state.error),));
            }else if(state is SearchLoaded){
              return Expanded(child: SearchVerticalListView(movies: state.movies,));
            }
            return const Expanded(child: Center( child: Text("Search Now.."),));

          }
          )
        ],

      ),
    );
  }
}

class CustomTextField extends StatelessWidget {
  final void Function(String)? onChange;
  const CustomTextField({required this.onChange,Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
      onChanged: onChange,
      decoration: InputDecoration(
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: const BorderSide(color: Assets.kSearchPageIcon,
          ),
        ),
        hintText: "Search",
        suffixIcon: const Icon(
          FontAwesomeIcons.magnifyingGlass,
          color: Assets.kSearchPageIcon,
        ),
      ),

    );
  }
}

class SearchVerticalListView extends StatelessWidget {
  final List<Movie> movies;
  const SearchVerticalListView({required this.movies,Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(itemBuilder: (context,index){
      return VerticalListViewItem(movie: movies[index],);
    },
    itemCount: movies.length,
    );
  }
}
