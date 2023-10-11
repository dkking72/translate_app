library app;

///Dart
export 'dart:io' hide HeaderValue;
export 'dart:async';
export 'dart:convert';
export 'dart:math';

///Flutter
export 'package:flutter/material.dart';
export 'package:flutter/foundation.dart';
export 'package:flutter/services.dart';

///Theme & Styling
export 'src/mics/app_style/app_colors.dart';
export 'src/mics/app_style/theme.dart';

///Controller
export 'src/module/home_screen/home_ctrl.dart';

///Service
export 'src/service/network_service.dart';

///Models
export 'src/models/response_model.dart';
export 'package:translate_app/src/models/language_model.dart';

///Screen & View
export 'src/utils/widgets/loader_view.dart';
export 'src/utils/widgets/error_view.dart';
export 'main.dart';
export 'src/module/splash_screen/splash_screen.dart';
export 'src/module/home_screen/home_screen.dart';

///Plugins
export 'package:get/get.dart' hide FormData, MultipartFile, Response;
export 'package:get_storage/get_storage.dart';
export 'package:package_info_plus/package_info_plus.dart';
export 'package:device_info_plus/device_info_plus.dart';
export 'package:dio/dio.dart';
export 'package:google_fonts/google_fonts.dart';
export 'package:flutter_spinkit/flutter_spinkit.dart';
export 'package:animated_text_kit/animated_text_kit.dart';
export 'package:cached_network_image/cached_network_image.dart';
export 'package:language_picker/language_picker.dart';
export 'package:language_picker/languages.dart';

///Utils & Const
export 'src/utils/const/key_const.dart';
export 'src/utils/const/asset_const.dart';
export 'src/utils/const/url_const.dart';
export 'src/utils/logger.dart';
export 'src/mics/localization/localization.dart';

///Navigation
export 'src/navigation/pages.dart';
export 'src/navigation/routes.dart';
export 'src/navigation/bindings.dart';
export 'src/navigation/middelware.dart';

/// Widget
export 'src/utils/widgets/app_text_field.dart';
export 'src/utils/widgets/app_elevated_button.dart';
export 'src/utils/widgets/app_outlined_button.dart';
export 'src/utils/widgets/app_back_button.dart';
export 'src/utils/widgets/app_toast.dart';
export 'src/utils/widgets/app_network_image.dart';