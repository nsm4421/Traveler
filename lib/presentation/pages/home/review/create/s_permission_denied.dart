part of 'p_create_review.dart';

class PermissionDeniedScreen extends StatelessWidget {
  const PermissionDeniedScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text("권한이 허용되지 않았습니다"),
          12.height,
          ElevatedButton(
              onPressed: () async {
                await PhotoManager.openSetting();
              },
              child: Text("권한 체트"))
        ],
      ),
    );
  }
}
