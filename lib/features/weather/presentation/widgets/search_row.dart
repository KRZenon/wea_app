import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:wa/core/const/constants.dart';
import 'package:wa/features/weather/presentation/bloc/weather_bloc.dart';

class SearchRow extends StatelessWidget {
  const SearchRow({super.key});
  searchWeather(BuildContext context) => context.read<WeatherBloc>().add(SearchWeatherEvent());
  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.all(defaultPadding), child: TextField(
      onEditingComplete: () => searchWeather(context),
      onChanged: (value) => context.read<WeatherBloc>().add(ChangeLocationEvent(location: value)),
      keyboardType: TextInputType.name,
      decoration: InputDecoration(
        prefixIcon: const Padding(padding: EdgeInsets.only(right: defaultPadding, left: defaultPadding/2), child: FaIcon(FontAwesomeIcons.locationDot),),
        prefixIconConstraints: const BoxConstraints(),
        suffixIcon: IconButton(onPressed: () {}, icon: const FaIcon(FontAwesomeIcons.magnifyingGlass),
        ),
      ),
    ),);
  }
}
