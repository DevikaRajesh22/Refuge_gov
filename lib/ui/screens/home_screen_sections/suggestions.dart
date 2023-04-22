import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

import '../../../blocs/suggestion/suggestion_bloc.dart';
import '../../../widgets/custom_alert_dialog.dart';
import '../../../widgets/custom_card.dart';

class SuggestionsSection extends StatefulWidget {
  const SuggestionsSection({super.key});

  @override
  State<SuggestionsSection> createState() => _SuggestionsSectionState();
}

class _SuggestionsSectionState extends State<SuggestionsSection> {
  final SuggestionBloc suggestionsBloc = SuggestionBloc();
  @override
  void initState() {
    super.initState();
    suggestionsBloc.add(GetAllSuggestionEvent());
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider<SuggestionBloc>.value(
      value: suggestionsBloc,
      child: BlocConsumer<SuggestionBloc, SuggestionState>(
        listener: (context, state) {
          if (state is SuggestionFailureState) {
            showDialog(
              context: context,
              builder: (context) => CustomAlertDialog(
                title: 'Failed',
                message: state.message,
                primaryButtonLabel: 'Ok',
              ),
            );
          }
        },
        builder: (context, state) {
          return SafeArea(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  width: 1000,
                  child: state is SuggestionSuccessState
                      ? state.suggestions.isNotEmpty
                          ? ListView.separated(
                              padding: const EdgeInsets.only(
                                top: 20,
                                left: 20,
                                right: 20,
                                bottom: 100,
                              ),
                              itemCount: state.suggestions.length,
                              itemBuilder: (context, index) => SuggestionItem(
                                suggestionDetails: state.suggestions[index],
                              ),
                              separatorBuilder: (context, index) =>
                                  const SizedBox(height: 10),
                            )
                          : const Center(child: Text('No suggestions found'))
                      : const Center(
                          child: CupertinoActivityIndicator(),
                        ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}

class SuggestionItem extends StatelessWidget {
  final dynamic suggestionDetails;

  const SuggestionItem({
    super.key,
    this.suggestionDetails,
  });

  @override
  Widget build(BuildContext context) {
    return CustomCard(
      color: Colors.blue[50],
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 20,
          vertical: 15,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              '#${suggestionDetails['id']}',
              style: Theme.of(context).textTheme.bodySmall?.copyWith(
                    fontWeight: FontWeight.bold,
                    color: Colors.black54,
                  ),
            ),
            const Divider(),
            Text(
              suggestionDetails['suggestion'],
              style: Theme.of(context).textTheme.bodySmall?.copyWith(
                    color: Colors.black,
                  ),
            ),
            const Divider(),
            Text(
              DateFormat('hh:mm a dd/MM/yyyy').format(
                  DateTime.parse(suggestionDetails['created_at']).toLocal()),
              style: Theme.of(context).textTheme.labelSmall?.copyWith(
                    color: Colors.black,
                  ),
            ),
          ],
        ),
      ),
    );
  }
}
