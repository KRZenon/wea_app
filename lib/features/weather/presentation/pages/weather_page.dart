import 'package:flutter/material.dart';
import 'package:wa/core/const/constants.dart';
import 'package:wa/features/weather/data/remote/weather_remote_data_source.dart';
import 'package:wa/features/weather/data/repositories/weather_repo_impl.dart';
import 'package:wa/features/weather/domain/use_case/weather_use_case.dart';
import 'package:wa/features/weather/presentation/bloc/weather_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wa/features/weather/presentation/widgets/error_container.dart';

import '../widgets/search_row.dart';
import '../widgets/weather_content.dart';

class WeatherPage extends StatelessWidget {
  const WeatherPage({super.key});

  @override
  Widget build(BuildContext context) {
    return  BlocProvider(
        create: (context) => WeatherBloc(WeatherUseCase(WeatherRepoImpl(WeatherRemoteDataSource()))),
      child: const _WeatherPage(),
    );
  }
}

class _WeatherPage extends StatelessWidget {
  const _WeatherPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Center(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  const SearchRow(),
                  Padding(
                    padding: const EdgeInsets.only(top: defaultPadding * 2),
                    child: BlocBuilder<WeatherBloc, WeatherState>(
                      builder: (context, state) {
                        return state.weatherOrFailure.fold(() => const SizedBox(),
                                (a) => a.fold((l) => Padding(padding: const EdgeInsets.only(top: defaultPadding*2),
                                  child: ErrorContainer(error: l),
                                ),
                                        (r) => Padding(
                                          padding: const EdgeInsets.only(top: defaultPadding*2),
                                          child: WeatherContent(
                                            weather: r,
                                            weatherImageName: state.weatherPictureName,
                                          ),
                                        ),
                                ),
                        );

                      },
                    ),
                  ),
                ],
              ),
            ),
          )),
    );
  }
}
