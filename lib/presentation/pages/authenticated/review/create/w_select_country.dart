part of 'p_create_review.dart';

class SelectCountryWidget extends StatelessWidget {
  const SelectCountryWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CreateReviewCubit, CreateReviewState>(
      builder: (context, state) {
        return ConstrainedBox(
          constraints: BoxConstraints(maxWidth: context.width*0.6),
          child: DropdownButtonFormField<Country>(
              value: state.country,
              items: Country.values
                  .map((country) => DropdownMenuItem<Country>(
                        value: country,
                        child: Text('${country.emoji}   ${country.name}'),
                      ))
                  .toList(),
              onChanged: (c) {
                if (c == null) {
                  return;
                }
                context.read<CreateReviewCubit>().updateCountry(c);
              },
              decoration: InputDecoration(
                filled: true,
                fillColor: context.colorScheme.primary.withAlpha(60),
                contentPadding:
                    const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: BorderSide.none,
                ),
              )),
        );
      },
    );
  }
}
