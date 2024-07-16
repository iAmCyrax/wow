part of 'home.dart';

class _HomeCard extends StatelessWidget {
  const _HomeCard();

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          const ListTile(
            leading: Icon(FluentIcons.music_note_2_24_regular),
            title: Text('The Enchanted Nightingale'),
            subtitle: Text('Music by Julie Gable, Lyrics by Sidney Stein'),
          ),
          ButtonBar(
            alignment: MainAxisAlignment.end,
            children: <Widget>[
              ElevatedButton(
                onPressed: () {
                  final snackBar = SnackBar(
                    content: Text(LocaleKeys.home_ticket_added.tr()),
                    duration: const Duration(seconds: 3),
                  );

                  ScaffoldMessenger.of(context).showSnackBar(snackBar);
                },
                child: Text(LocaleKeys.home_buy_tickets.tr()),
              ),
              SecondaryButton(
                onPressed: () {
                  showModalBottomSheet(
                    showDragHandle: true,
                    context: context,
                    builder: (context) {
                      return _BottomSheet();
                    },
                  );
                },
                child: Text(LocaleKeys.home_secondary.tr()),
              ),
              TertiaryButton(
                onPressed: () {},
                child: Text(LocaleKeys.home_tertiary.tr()),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _BottomSheet extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 150,
      child: Center(
        child: ListView(
          shrinkWrap: true,
          scrollDirection: Axis.horizontal,
          children: <Widget>[
            _BottomSheetButton(
              icon: FluentIcons.share_24_regular,
              text: LocaleKeys.share.tr(),
              onClick: () {},
            ),
            _BottomSheetButton(
              icon: FluentIcons.add_24_regular,
              text: LocaleKeys.add_to.tr(),
              onClick: () {},
            ),
            _BottomSheetButton(
              icon: FluentIcons.delete_24_regular,
              text: LocaleKeys.trash.tr(),
              onClick: () {},
            ),
            _BottomSheetButton(
              icon: FluentIcons.heart_24_regular,
              text: LocaleKeys.favorite.tr(),
              onClick: () {},
            ),
          ],
        ),
      ),
    );
  }
}

class _BottomSheetButton extends StatelessWidget {
  const _BottomSheetButton({
    required this.icon,
    required this.text,
    required this.onClick,
  });

  final IconData icon;
  final String text;
  final VoidCallback? onClick;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(20.0, 30.0, 20.0, 20.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          IconButton(
            onPressed: onClick,
            icon: Icon(icon),
          ),
          Text(text),
        ],
      ),
    );
  }
}
