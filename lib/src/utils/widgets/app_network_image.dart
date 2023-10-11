import 'package:translate_app/src_exports.dart';

class NetWorkImage extends StatelessWidget {
  const NetWorkImage({
    super.key,
    required this.imgUrl,
    this.width = 50,
    this.height = 100,
  });

  final String imgUrl;
  final double width;
  final double height;

  @override
  Widget build(BuildContext context) {
    return Image.network(
      imgUrl,
      width: width,
      height: height,
      fit: BoxFit.fill,
      errorBuilder: (context, error, stackTrace) {
        return const SizedBox(
            height: 90,
            width: 100,
            child: Icon(
              Icons.error,
              color: AppColors.redClr,
            ));
      },
      loadingBuilder: (context, child, loadingProgress) {
        if (loadingProgress == null) {
          return child;
        }
        return SizedBox(
          width: MediaQuery.of(context).size.width,
          child: Center(
            child: CircularProgressIndicator(
              color: AppColors.colorBCCFD8,
              value: loadingProgress.expectedTotalBytes != null
                  ? loadingProgress.cumulativeBytesLoaded / loadingProgress.expectedTotalBytes!
                  : null,
            ),
          ),
        );
      },
    );
  }
}

class AppCircleAvatar extends StatelessWidget {
  const AppCircleAvatar({
    super.key,
    this.imgUrl = '',
    this.radius = 45,
  });

  final String imgUrl;
  final double radius;

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      backgroundColor: Colors.transparent,
      radius: radius,
      child: Container(
        decoration: const BoxDecoration(
          color: Colors.transparent,
          shape: BoxShape.circle,
        ),
        child: ClipOval(
          child: imgUrl.isEmpty
              ? Image.asset(
                  AssetConst.sampleImage,
                  fit: BoxFit.fill,
                )
              : Image.network(
                  imgUrl,
                  fit: BoxFit.fill,
                  errorBuilder: (context, error, stackTrace) {
                    return Image.asset(
                      AssetConst.ellipse1,
                      fit: BoxFit.fill,
                    );
                  },
                  loadingBuilder: (context, child, loadingProgress) {
                    if (loadingProgress == null) {
                      return child;
                    }
                    return Center(
                      child: CircularProgressIndicator(
                        value: loadingProgress.expectedTotalBytes != null
                            ? loadingProgress.cumulativeBytesLoaded / loadingProgress.expectedTotalBytes!
                            : null,
                      ),
                    );
                  },
                ),
        ),
      ),
    );
  }
}
