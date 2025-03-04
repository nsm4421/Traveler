part of 's_create_journey.dart';

class SelectCountryFragment extends StatelessWidget {
  const SelectCountryFragment({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CreateJourneyCubit, CreateJourneyState>(
        builder: (context, state) {
      return ListView.builder(
        shrinkWrap: true,
        itemCount: Country.values.length,
        itemBuilder: (context, index) {
          final item = Country.values[index];
          return ListTile(
            onTap: () {
              context.read<CreateJourneyCubit>().update(country: item);
            },
            leading: Text(item.emoji),
            title: Text(
              item.name,
              style: item == state.country
                  ? context.textTheme.titleMedium
                      ?.copyWith(fontWeight: FontWeight.bold)
                  : context.textTheme.titleSmall,
            ),
          );
        },
      );
    });
  }
}
