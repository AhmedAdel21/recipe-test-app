import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:recipetestapp/domain/model/models.dart';
import 'package:recipetestapp/presentation/styles/styles.dart';
import 'package:recipetestapp/presentation/ui/recipe_details_page/bloc/recipe_details_page_bloc.dart';

class RecipeDetailsPage extends StatelessWidget {
  final Recipe recipe;
  const RecipeDetailsPage(this.recipe, {super.key});
  PlatformAppBar get _appBar {
    return PlatformAppBar(
      backgroundColor: ColorConstants.white,
      title: Text(
        recipe.name,
        style: const TextStyle(color: ColorConstants.black),
      ),
      material: (context, platform) {
        return MaterialAppBarData(
          elevation: 0,
          leadingWidth: 80,
          foregroundColor: ColorConstants.black,
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
          create: (context) => RecipeCubit(recipe),
          child: const _RecipeDetailsPageContent(),
        ),
      ),
    );
  }
}

class _RecipeDetailsPageContent extends StatefulWidget {
  const _RecipeDetailsPageContent({super.key});

  @override
  State<_RecipeDetailsPageContent> createState() =>
      __RecipeDetailsPageContentState();
}

class __RecipeDetailsPageContentState extends State<_RecipeDetailsPageContent> {
  late final RecipeCubit _bloc;
  late final Recipe recipe;
  void _bind() {
    _bloc = context.read<RecipeCubit>();
    recipe = _bloc.state;
  }

  @override
  void initState() {
    super.initState();
    _bind();
  }

  Widget get getAdditionalDetails => Wrap(
        spacing: 13.0,
        children: [
          RichText(
            text: TextSpan(children: [
              TextSpan(
                text: "Difficulty : ",
                style: Theme.of(context)
                    .textTheme
                    .titleLarge
                    ?.copyWith(fontSize: FontSizeConstants.s16),
              ),
              TextSpan(
                text: recipe.difficulty.text,
                style: Theme.of(context)
                    .textTheme
                    .bodyMedium
                    ?.copyWith(fontSize: FontSizeConstants.s16),
              ),
            ]),
          ),
          RichText(
            text: TextSpan(children: [
              TextSpan(
                text: "Time : ",
                style: Theme.of(context)
                    .textTheme
                    .titleLarge
                    ?.copyWith(fontSize: FontSizeConstants.s16),
              ),
              TextSpan(
                text: recipe.time,
                style: Theme.of(context)
                    .textTheme
                    .bodyMedium
                    ?.copyWith(fontSize: FontSizeConstants.s16),
              ),
            ]),
          ),
          RichText(
            text: TextSpan(children: [
              TextSpan(
                text: "Country : ",
                style: Theme.of(context)
                    .textTheme
                    .titleLarge
                    ?.copyWith(fontSize: FontSizeConstants.s16),
              ),
              TextSpan(
                text: recipe.country,
                style: Theme.of(context)
                    .textTheme
                    .bodyMedium
                    ?.copyWith(fontSize: FontSizeConstants.s16),
              ),
            ]),
          ),
        ],
      );

  Widget get getDescription => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Description',
            style: Theme.of(context).textTheme.titleMedium?.copyWith(),
          ),
          const SizedBox(height: 8),
          Text(
            recipe.description,
            style: Theme.of(context)
                .textTheme
                .bodyMedium
                ?.copyWith(fontSize: FontSizeConstants.s16),
          ),
          const SizedBox(height: 16),
        ],
      );
  Widget get getNutritionalInformation => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Nutritional Information',
            style: Theme.of(context).textTheme.titleMedium?.copyWith(),
          ),
          if (recipe.calories.isNotEmpty)
            Text(
              'Calories: ${recipe.calories}',
              style: Theme.of(context)
                  .textTheme
                  .bodyMedium
                  ?.copyWith(fontSize: FontSizeConstants.s16),
            ),
          if (recipe.carbos.isNotEmpty)
            Text(
              'Carbohydrates: ${recipe.carbos}',
              style: Theme.of(context)
                  .textTheme
                  .bodyMedium
                  ?.copyWith(fontSize: FontSizeConstants.s16),
            ),
          if (recipe.fats.isNotEmpty)
            Text(
              'Fats: ${recipe.fats}',
              style: Theme.of(context)
                  .textTheme
                  .bodyMedium
                  ?.copyWith(fontSize: FontSizeConstants.s16),
            ),
          if (recipe.fibers.isNotEmpty)
            Text(
              'Fibers: ${recipe.fibers}',
              style: Theme.of(context)
                  .textTheme
                  .bodyMedium
                  ?.copyWith(fontSize: FontSizeConstants.s16),
            ),
          if (recipe.proteins.isNotEmpty)
            Text(
              'Proteins: ${recipe.proteins}',
              style: Theme.of(context)
                  .textTheme
                  .bodyMedium
                  ?.copyWith(fontSize: FontSizeConstants.s16),
            ),
        ],
      );

  Widget get getIngredients => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Ingredients',
            style: Theme.of(context).textTheme.titleMedium?.copyWith(),
          ),
          const SizedBox(height: 8),
          ...recipe.ingredients.map((ingredient) => Padding(
                padding: const EdgeInsets.only(bottom: 8.0),
                child: Text(
                  '• $ingredient',
                  style: Theme.of(context)
                      .textTheme
                      .bodyMedium
                      ?.copyWith(fontSize: FontSizeConstants.s16),
                ),
              )),
        ],
      );

  Widget get getRecipeRating => Row(
        children: [
          RatingBarIndicator(
            rating: recipe.rating.toDouble(),
            itemBuilder: (context, index) => const Icon(
              Icons.star,
              color: ColorConstants.ratingStarsColor,
            ),
            itemCount: 5,
            itemSize: 24.0,
          ),
          const SizedBox(width: AppSizeConstants.s10),
          Text('${recipe.rating} (${recipe.ratings} ratings)',
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                  fontSize: FontSizeConstants.s16, color: Colors.grey[600])),
        ],
      );
  Widget get getRecipeImage => Stack(
        children: [
          ClipRRect(
            borderRadius:
                const BorderRadius.vertical(bottom: Radius.circular(30)),
            child: Image.network(
              recipe.image,
              height: AppSizeConstants.s300,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
          ),
          // Gradient overlay
          Container(
            height: AppSizeConstants.s300,
            decoration: BoxDecoration(
              borderRadius: const BorderRadius.vertical(
                  bottom: Radius.circular(AppSizeConstants.s30)),
              gradient: LinearGradient(
                colors: [Colors.black.withOpacity(0.5), Colors.transparent],
                begin: Alignment.bottomCenter,
                end: Alignment.topCenter,
              ),
            ),
          ),

          Positioned(
            bottom: 20,
            left: 20,
            child: Row(
              children: [
                Text(
                  recipe.name,
                  softWrap: true,
                  overflow: TextOverflow.ellipsis,
                  style: Theme.of(context).textTheme.titleLarge?.copyWith(
                      color: ColorConstants.white,
                      fontSize: FontSizeConstants.s22),
                ),
              ],
            ),
          ),
          BlocBuilder<RecipeCubit, Recipe>(
            builder: (context, state) {
              // context.read<HomeBloc>().add(HomeRecipeStatChanged(state));
              Icon icon = const Icon(
                Icons.favorite_border_outlined,
                color: ColorConstants.black,
                size: 50,
              );
              if (state.isFavorite ?? false) {
                icon = const Icon(
                  Icons.favorite_sharp,
                  color: ColorConstants.favoriteColor,
                  size: 50,
                );
              }
              return Positioned(
                left: 10,
                top: 10,
                child: GestureDetector(
                  onTap: () => _bloc.toggleFavoriteState(),
                  child: icon,
                ),
              );
            },
          ),
        ],
      );

  Widget get getDeliverableIngredients => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Deliverable Ingredients',
            style: Theme.of(context).textTheme.titleMedium?.copyWith(),
          ),
          const SizedBox(height: 8),
          ...recipe.deliverableIngredients.map((item) => Padding(
                padding: const EdgeInsets.only(bottom: 8.0),
                child: Text(
                  '• $item',
                  style: Theme.of(context)
                      .textTheme
                      .bodyMedium
                      ?.copyWith(fontSize: FontSizeConstants.s16),
                ),
              )),
        ],
      );

  Widget get getUndeliverableIngredients => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Undeliverable Ingredients',
            style: Theme.of(context).textTheme.titleMedium?.copyWith(),
          ),
          const SizedBox(height: 8),
          ...recipe.undeliverableIngredients.map((item) => Text(
                '• $item',
                style: Theme.of(context)
                    .textTheme
                    .bodyMedium
                    ?.copyWith(fontSize: FontSizeConstants.s16),
              )),
        ],
      );

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          getRecipeImage,
          Padding(
            padding: const EdgeInsets.all(AppPaddingConstants.p16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                getRecipeRating,
                const SizedBox(height: AppSizeConstants.s10),
                Text(
                  recipe.headline,
                  style: Theme.of(context).textTheme.titleMedium?.copyWith(),
                ),
                const SizedBox(height: AppSizeConstants.s10),

                // Description
                getDescription,

                // Nutritional Information
                getNutritionalInformation,
                const SizedBox(height: AppSizeConstants.s10),

                // Ingredients
                if (recipe.ingredients.isNotEmpty) getIngredients,
                const SizedBox(height: AppSizeConstants.s10),

                // Additional Details
                getAdditionalDetails,
                const SizedBox(height: AppSizeConstants.s10),

                // Deliverable Ingredients
                if (recipe.deliverableIngredients.isNotEmpty)
                  getDeliverableIngredients,
                const SizedBox(height: AppSizeConstants.s10),

                // Undeliverable Ingredients
                if (recipe.undeliverableIngredients.isNotEmpty)
                  getUndeliverableIngredients
              ],
            ),
          ),
        ],
      ),
    );
  }
}
