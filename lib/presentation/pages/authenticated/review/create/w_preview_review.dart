part of 'p_create_review.dart';

class PreviewReviewWidget extends StatefulWidget {
  const PreviewReviewWidget({super.key});

  @override
  State<PreviewReviewWidget> createState() => _PreviewReviewWidgetState();
}

class _PreviewReviewWidgetState extends State<PreviewReviewWidget>
    with DebounceMixin {
  late PageController _controller;

  @override
  void initState() {
    super.initState();
    _controller = PageController();
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CreateReviewCubit, CreateReviewState>(
        builder: (context, state) {
      return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        /// 제목
        if (state.title.isNotEmpty)
          Column(
            children: [
              12.height,
              Row(
                children: [
                  10.width,
                  Icon(Icons.title, color: context.colorScheme.primary),
                  12.width,
                  Text(state.title,
                      style: context.textTheme.titleMedium?.copyWith(
                          color: context.colorScheme.primary,
                          fontWeight: FontWeight.w700)),
                ],
              ),
              12.height,
            ],
          ),

        if (state.assets.isNotEmpty)
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  10.width,
                  Icon(Icons.camera_alt_outlined,
                      color: context.colorScheme.primary),
                  12.width,
                  Text('사진',
                      style: context.textTheme.titleMedium?.copyWith(
                          color: context.colorScheme.primary,
                          fontWeight: FontWeight.w700)),
                ],
              ),
              12.height,
              ConstrainedBox(
                constraints: BoxConstraints(maxHeight: context.height / 3),
                child: ListView.builder(
                    shrinkWrap: true,
                    itemCount: state.assets.length,
                    itemBuilder: (context, index) {
                      return ListTile(
                        leading: CircleAvatar(
                          radius: 25,
                          backgroundImage:
                              AssetEntityImageProvider(state.assets[index]),
                        ),
                        title: Text(
                          state.captions[index].isEmpty
                              ? '(no caption)'
                              : state.captions[index],
                          softWrap: true,
                          overflow: TextOverflow.ellipsis,
                          style: state.captions[index].isEmpty
                              ? context.textTheme.labelLarge?.copyWith(
                                  color: context.colorScheme.tertiary
                                      .withAlpha(80))
                              : context.textTheme.bodySmall?.copyWith(
                                  color: context.colorScheme.secondary),
                        ),
                      );
                    }),
              ),
            ],
          ),
        Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          12.height,
          const Divider(),
          12.height,
          Row(
            children: [
              10.width,
              Icon(Icons.abc, color: context.colorScheme.primary),
              12.width,
              Text('본문',
                  style: context.textTheme.titleMedium?.copyWith(
                      color: context.colorScheme.primary,
                      fontWeight: FontWeight.w700)),
            ],
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
            margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
            ),
            child: Text(
              state.content,
              softWrap: true,
              overflow: TextOverflow.clip,
              style: context.textTheme.bodyLarge
                  ?.copyWith(fontWeight: FontWeight.w500),
            ),
          )
        ])
      ]);
    });
  }
}
