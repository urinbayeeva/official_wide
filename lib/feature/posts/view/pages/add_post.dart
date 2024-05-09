import 'dart:io';

// import 'package:better_open_file/better_open_file.dart';
import 'package:camerawesome/camerawesome_plugin.dart';
import 'package:camerawesome/pigeon.dart';
import 'package:path_provider/path_provider.dart';
import 'package:wide/core/screens/all.dart';

class CameraPage extends StatefulWidget {
  const CameraPage({super.key});

  @override
  State<CameraPage> createState() => _CameraPageState();
}

class _CameraPageState extends State<CameraPage> {
  @override
  void initState() {
    super.initState();
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersiveSticky);
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
    ]);
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        CameraAwesomeBuilder.awesome(
          saveConfig: SaveConfig.photoAndVideo(
            initialCaptureMode: CaptureMode.photo,
            photoPathBuilder: (sensors) async {
              final Directory extDir = await getTemporaryDirectory();
              final testDir = await Directory(
                '${extDir.path}/camerawesome',
              ).create(recursive: true);
              if (sensors.length == 1) {
                final String filePath =
                    '${testDir.path}/${DateTime.now().millisecondsSinceEpoch}.jpg';
                return SingleCaptureRequest(filePath, sensors.first);
              } else {
                // Separate pictures taken with front and back camera
                return MultipleCaptureRequest(
                  {
                    for (final sensor in sensors)
                      sensor:
                          '${testDir.path}/${sensor.position == SensorPosition.front ? 'front_' : "back_"}${DateTime.now().millisecondsSinceEpoch}.jpg',
                  },
                );
              }
            },
            videoOptions: VideoOptions(
              enableAudio: true,
              ios: CupertinoVideoOptions(
                fps: 10,
              ),
              android: AndroidVideoOptions(
                bitrate: 6000000,
                fallbackStrategy: QualityFallbackStrategy.lower,
              ),
            ),
            exifPreferences:
                null, // Remove the GPS icon by setting exifPreferences to null
          ),
          sensorConfig: SensorConfig.single(
            sensor: Sensor.position(SensorPosition.back),
            flashMode: FlashMode.auto,
            aspectRatio: CameraAspectRatios.ratio_4_3,
            zoom: 0.0,
          ),
          enablePhysicalButton: true,
          previewAlignment: Alignment.center,
          previewFit: CameraPreviewFit.contain,
          onMediaTap: (mediaCapture) {
            mediaCapture.captureRequest.when(
              single: (single) {
                debugPrint('single: ${single.file?.path}');
                single.file?.openRead();
              },
              multiple: (multiple) {
                multiple.fileBySensor.forEach((key, value) {
                  debugPrint('multiple file taken: $key ${value?.path}');
                  value?.openRead();
                });
              },
            );
          },
          availableFilters: awesomePresetFiltersList,
        ),
        Positioned(
          right: 0,
          child: IconButton(
            icon: const Icon(Icons.arrow_back),
            onPressed: () {
              context.go("/homePage");
            },
          ),
        ),
      ],
    );
  }
}
