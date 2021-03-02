import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_api_test_app/features/product_manager/presentation/bloc/bloc.dart';
import 'package:food_api_test_app/features/product_manager/presentation/widgets/loading_widget.dart';
import 'package:food_api_test_app/features/product_manager/presentation/widgets/message_display.dart';
import 'package:food_api_test_app/features/product_manager/presentation/widgets/open_food_item_controls.dart';
import 'package:food_api_test_app/features/product_manager/presentation/widgets/open_food_item_display.dart';

import '../../../../injection_container.dart';

class ProductManagerPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Food Api Test App'),
      ),
      body: buildBody(context),
    );
  }

  BlocProvider<ProductManagerBloc> buildBody(BuildContext context) {
    return BlocProvider(
      create: (_) => sl<ProductManagerBloc>(),
      child: Center(
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            children: <Widget>[
              SizedBox(height: 10),

              Container(
                // Third of the size of the screen
                height: MediaQuery.of(context).size.height / 3,
                // Message Text widgets / CircularLoadingIndicator
                child: Placeholder(),
              ),
              SizedBox(height: 15),
              //Top Half
              BlocBuilder<ProductManagerBloc, ProductManagerState>(
                // ignore: missing_return
                builder: (context, state) {
                  if (state is Empty) {
                    return MessageDisplay(message: 'Search with a Barcode');
                  } else if (state is Loading) {
                    return LoadingWidget();
                  } else if (state is Loaded) {
                    return OpenFoodItemTitleDisplay(
                        openFoodItem: state.openFoodItem);
                  } else if (state is Error) {
                    return MessageDisplay(message: state.message);
                  }
                },
              ),
              SizedBox(height: 15),
              //Bottom half
              OpenFoodItemControls()
            ],
          ),
        ),
      ),
    );
  }
}
