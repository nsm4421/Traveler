part of 'p_sign_up.dart';

class SelectProfileImageWidget extends StatefulWidget {
  const SelectProfileImageWidget({super.key});

  @override
  State<SelectProfileImageWidget> createState() =>
      _SelectProfileImageWidgetState();
}

class _SelectProfileImageWidgetState extends State<SelectProfileImageWidget>
    with AssetMixIn {
  late ImagePicker _imagePicker;

  @override
  void initState() {
    super.initState();
    _imagePicker = ImagePicker();
  }

  _selectProfileImage() async {
    if (context.read<SignUpCubit>().state.status != Status.initial) {
      return;
    }
    final tempContext = context;
    final XFile? xFile =
        await _imagePicker.pickImage(source: ImageSource.gallery);
    if (xFile == null) {
      return;
    }
    final file = await xFile2File(xFile);
    final compressed = await compressFile(file);
    tempContext.read<SignUpCubit>().selectProfileImage(compressed);
  }

  _unSelectProfileImage() {
    context.read<SignUpCubit>().unSelectProfileImage();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SignUpCubit, SignUpState>(builder: (context, state) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              const Icon(Icons.camera_alt_outlined),
              12.width,
              Text("프로필사진",
                  style: context.textTheme.titleMedium
                      ?.copyWith(fontWeight: FontWeight.bold)),
            ],
          ),
          12.height,
          Center(
            child: Stack(
              children: [
                GestureDetector(
                  onTap: _selectProfileImage,
                  child: CircleAvatar(
                      radius: context.width / 6,
                      backgroundImage: state.profileImage == null
                          ? null
                          : FileImage(state.profileImage!),
                      child: state.profileImage == null
                          ? Icon(
                              Icons.add_photo_alternate_outlined,
                              size: context.width / 8,
                            )
                          : null),
                ),
                if (state.profileImage != null)
                  Positioned(
                      top: -10,
                      right: -10,
                      child: IconButton(
                          onPressed: _unSelectProfileImage,
                          icon: const Icon(Icons.clear)))
              ],
            ),
          )
        ],
      );
    });
  }
}
