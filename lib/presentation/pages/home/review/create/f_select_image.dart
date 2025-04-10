part of 'p_create_review.dart';

class SelectImageFragment extends StatefulWidget {
  const SelectImageFragment({super.key});

  @override
  State<SelectImageFragment> createState() => _SelectImageFragmentState();
}

class _SelectImageFragmentState extends State<SelectImageFragment> {
  late ScrollController _scrollController;
  List<AssetPathEntity> _albums = [];
  AssetPathEntity? _currentAlbum;
  List<AssetEntity> _assets = [];
  int _currentPage = 0;
  bool _isEnd = false;
  static const int _fetchSize = 20;

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController()..addListener(_handleScroll);
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      _albums = await PhotoManager.getAssetPathList(
          type: RequestType.image, onlyAll: false);
      _currentAlbum = _albums.firstOrNull;
      await _fetchPhotos();
      setState(() {});
    });
  }

  @override
  void dispose() {
    super.dispose();
    _scrollController
      ..removeListener(_handleScroll)
      ..dispose();
  }

  _handleScroll() async {
    if (_scrollController.position.pixels <
            _scrollController.position.maxScrollExtent - 100 &&
        _isEnd) {
      return;
    }
    await _fetchPhotos();
  }

  Future<void> _fetchPhotos({bool reset = false}) async {
    if (_currentAlbum == null || (_isEnd && !reset)) return;
    if (reset) {
      _currentPage = 0;
      _isEnd = false;
      _assets.clear();
    }
    final fetched = await _currentAlbum!.getAssetListPaged(
      page: _currentPage,
      size: _fetchSize,
    );
    setState(() {
      _assets.addAll(fetched);
      _isEnd = fetched.length == _fetchSize;
      _currentPage++;
    });
  }

  void _handleChangeAlbum(AssetPathEntity? album) async {
    if (album == null) return;
    _currentAlbum = album;
    await _fetchPhotos(reset: true);
  }

  void Function() _handleToggleImage(AssetEntity asset) => () {
        context.read<CreateReviewCubit>().toggleImage(asset);
      };

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CreateReviewCubit, CreateReviewState>(
      builder: (context, state) {
        if (_albums.isEmpty) {
          return Center(
              child: Text(
            "선택할 수 있는 사진이 없습니다",
            style: context.textTheme.displaySmall,
          ));
        }
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            DropdownButton<AssetPathEntity>(
              value: _currentAlbum,
              underline: const SizedBox(),
              onChanged: _handleChangeAlbum,
              items: _albums.map((album) {
                return DropdownMenuItem(
                  value: album,
                  child: Text(
                    album.name,
                    overflow: TextOverflow.ellipsis,
                  ),
                );
              }).toList(),
            ),
            _assets.isEmpty
                ? const Center(child: CircularProgressIndicator())
                : Expanded(
                    child: GridView.builder(
                      controller: _scrollController,
                      padding: const EdgeInsets.all(4),
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 3,
                        mainAxisSpacing: 2,
                        crossAxisSpacing: 2,
                      ),
                      itemCount: _assets.length,
                      itemBuilder: (context, index) {
                        final e = _assets[index];
                        return GestureDetector(
                            onTap: _handleToggleImage(e),
                            child: Stack(
                              fit: StackFit.expand,
                              children: [
                                AssetEntityImage(
                                  fit: BoxFit.cover,
                                  e,
                                  errorBuilder: (_, __, ___) {
                                    return const Center(
                                        child: Icon(Icons.warning_amber));
                                  },
                                ),
                                // 선택한 이미지인 경우
                                if (state.assets.contains(e))
                                  Container(
                                    color: Colors.black.withAlpha(60),
                                    child: const Center(
                                      child: Icon(Icons.check,
                                          color: Colors.white, size: 30),
                                    ),
                                  )
                              ],
                            ));
                      },
                    ),
                  ),
          ],
        );
      },
    );
  }
}
