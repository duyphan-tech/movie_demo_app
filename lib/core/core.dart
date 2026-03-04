// Core Module - Shared functionality across the app
// Export all core features for easy importing

// Configs
export 'configs/app_config.dart';
export 'configs/env_config.dart';
export 'package:movie_demo_app/flavors.dart';

// Constants
export 'constants/app_assets.dart';
export 'constants/app_constants.dart';
export 'constants/app_sizes.dart';

// Deeplink
export 'deeplink/appsflyer_service.dart';

// Errors
export 'errors/exceptions.dart';
export 'errors/failures.dart';

// Local Storage
export 'local/local_storage_service.dart';
export 'local/storage_keys.dart';
export 'local/storage_migration_service.dart';

// Secure Storage
export 'storage/secure_storage_helper.dart';

// Logger
export 'logger/app_logger.dart';

// Network
export 'network/api_client.dart';
export 'network/endpoints.dart';
export 'network/network_info.dart';
export 'network/interceptors/logger_interceptor.dart';
export 'network/interceptors/retry_interceptor.dart';

// Providers
export 'providers/deep_link_provider.dart';
export 'providers/locale_provider.dart';
export 'providers/network_providers.dart';
export 'providers/pending_deep_link_provider.dart';
export 'providers/storage_providers.dart';
export 'providers/theme_provider.dart';

// Router
export 'router/app_router.dart';
export 'router/router_name.dart';
export 'router/router_path.dart';

// Theme
export 'theme/app_icon.dart';
export 'theme/app_theme.dart';

// Utils - Extensions
export 'utils/extensions/l10n.dart';
export 'utils/extensions/scroll_controller_ext.dart';

// Utils - Hooks
export 'utils/hooks/use_async_lock.dart';
export 'utils/hooks/use_debounce.dart';
export 'utils/hooks/use_infinite_scroll.dart';

// Utils - Widgets
export 'utils/widgets/custom_network_image.dart';
export 'utils/widgets/custom_text_field.dart';
export 'utils/widgets/skeleton.dart';

// Utils - App Utils
export 'utils/app_utils.dart';
