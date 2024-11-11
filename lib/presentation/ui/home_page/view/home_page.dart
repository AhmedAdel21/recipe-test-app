import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:recipetestapp/app/di.dart';
import 'package:recipetestapp/domain/model/models.dart';
import 'package:recipetestapp/presentation/navigation/app_navigation_manager.dart';
import 'package:recipetestapp/presentation/navigation/app_router.dart';
import 'package:recipetestapp/presentation/styles/styles.dart';
import 'package:recipetestapp/presentation/ui/common/state_renderer/state_renderer_impl.dart';
import 'package:recipetestapp/presentation/ui/home_page/bloc/home_bloc.dart';
import 'package:recipetestapp/presentation/ui/recipe_details_page/bloc/recipe_details_page_bloc.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  PlatformAppBar get _appBar {
    return PlatformAppBar(
      backgroundColor: ColorConstants.white,
      title: Row(
        children: [
          Container(
            margin: const EdgeInsets.only(
                left: AppMarginConstants.m8, right: AppMarginConstants.m16),
            child: Image.asset(
              ImageAssets.appLogo,
              width: AppSizeConstants.s35,
              height: AppSizeConstants.s35,
            ),
          ),
          const Text(
            "Recipe App",
            style: TextStyle(color: ColorConstants.black),
          ),
        ],
      ),
      material: (context, platform) {
        return MaterialAppBarData(
          elevation: 0,
          leadingWidth: 80,
        );
      },
      cupertino: (context, platform) {
        return CupertinoNavigationBarData();
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return PlatformScaffold(
      appBar: _appBar,
      backgroundColor: ColorConstants.backGroundGreyColor,
      body: Padding(
        padding: const EdgeInsets.all(AppPaddingConstants.p12),
        child: BlocProvider(
          create: (context) => HomeBloc(),
          child: const _HomeContent(),
        ),
      ),
    );
  }
}

class _HomeContent extends StatefulWidget {
  const _HomeContent({super.key});

  @override
  State<_HomeContent> createState() => __HomeContentState();
}

class __HomeContentState extends State<_HomeContent> {
  late final HomeBloc _bloc;
  void _bind() {
    _bloc = context.read<HomeBloc>();
    _bloc.add(const HomeGetRecipes());
  }

  @override
  void initState() {
    super.initState();
    _bind();
  }

  bool isCurrentDialogShowing() => ModalRoute.of(context)?.isCurrent != true;

  void dismissDialog() {
    if (Navigator.canPop(context) && isCurrentDialogShowing()) {
      Navigator.of(context, rootNavigator: true).pop();
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<HomeBloc, HomeState>(
      listener: (context, state) {
        switch (state.state) {
          case HomeStateStatus.idle:
            dismissDialog();
            break;
          case HomeStateStatus.loadingState:
            {
              dismissDialog();
              LoadingState().showPopup(context, height: 200, width: 200);
            }
            break;
          case HomeStateStatus.failed:
            {
              dismissDialog();
              ErrorState(state.errorMessage)
                  .showPopup(context, height: 200, width: 200);
            }
            break;
          case HomeStateStatus.success:
            dismissDialog();
            break;
        }
      },
      child: GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2, // number of items in each row
          mainAxisSpacing: 8.0, // spacing between rows
          crossAxisSpacing: 8.0, // spacing between columns
          childAspectRatio: 0.65,
        ),
        padding: const EdgeInsets.all(8.0), // padding around the grid

        itemCount: _bloc.state.getListOfRecipe.length,
        itemBuilder: (context, index) {
          Recipe recipe = _bloc.state.getListOfRecipe[index];
          return BlocProvider(
            create: (context) => RecipeCubit(recipe),
            child: _RecipeCard(recipe: recipe),
          );
        },
      ),
    );
  }
}

class _RecipeCard extends StatelessWidget {
  const _RecipeCard({
    super.key,
    required this.recipe,
  });

  final Recipe recipe;

  @override
  Widget build(BuildContext context) => Stack(
        children: [
          GestureDetector(
            onTap: () =>
                DI.getItInstance<AppNavigationManager>().navigateToPage(
                      RoutesName.recipeDetails,
                      extra: context.read<RecipeCubit>().state,
                    ),
            child: Card(
              elevation: 4,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15)),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ClipRRect(
                    borderRadius:
                        const BorderRadius.vertical(top: Radius.circular(15)),
                    child: Image.network(
                      recipe.image,
                      height: 150,
                      width: double.infinity,
                      fit: BoxFit.cover,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Center(
                          child: Text(
                            recipe.name,
                            maxLines: 2,
                            softWrap: true,
                            overflow: TextOverflow.ellipsis,
                            style: const TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        // const Spacer(),
                        Row(
                          children: [
                            RatingBarIndicator(
                              rating: recipe.rating.toDouble(),
                              itemBuilder: (context, index) => const Icon(
                                Icons.star,
                                color: ColorConstants.ratingStarsColor,
                              ),
                              itemCount: 5,
                              itemSize: 20.0,
                              direction: Axis.horizontal,
                            ),
                            const SizedBox(width: 8),
                            Text(
                              recipe.rating.toStringAsFixed(1),
                              style: const TextStyle(fontSize: 16),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          BlocBuilder<RecipeCubit, Recipe>(
            builder: (context, state) {
              Icon icon = const Icon(
                Icons.favorite_border_outlined,
                color: ColorConstants.black,
                size: 30,
              );
              if (state.isFavorite ?? false) {
                icon = const Icon(
                  Icons.favorite_sharp,
                  color: ColorConstants.favoriteColor,
                  size: 30,
                );
              }
              return Positioned(
                left: 10,
                top: 10,
                child: GestureDetector(
                  onTap: () =>
                      context.read<RecipeCubit>().toggleFavoriteState(),
                  child: icon,
                ),
              );
            },
          ),
        ],
      );
}
