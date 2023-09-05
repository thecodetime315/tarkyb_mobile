
import 'package:base_flutter/core/base_widgets/cache_image.dart';
import 'package:base_flutter/core/base_widgets/my_text.dart';
import 'package:base_flutter/core/helpers/app_loader_helper.dart';
import 'package:base_flutter/core/localization/lang_cubit/lang_cubit.dart';
import 'package:base_flutter/core/resource/color_manager.dart';
import 'package:base_flutter/core/resource/font_manager.dart';
import 'package:base_flutter/features/presentation/auth/blocs/user_cubit/user_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_chat_bubble/chat_bubble.dart';
import '../../../../core/generic_cubit/generic_cubit.dart';
import '../../../../core/localization/app_localizations.dart';
import '../../../models/chat_room_model.dart';

import '../chat_room_imports.dart';

part 'BuildChatField.dart';
part 'BuildSendMessage.dart';
part 'RecieveMessage.dart';
part 'SenderMessage.dart';
part 'chat_appbar.dart';
