import 'package:flutter/material.dart';
import '../../constants/theme/colors.dart';
import '../../constants/theme/text_styles.dart';

/// Custom app bar used across all feature screens. Supports an
/// optional leading back button (defaults to auto-detecting via
/// [Navigator.canPop]), a title, and trailing actions (notifications,
/// profile avatar, etc.).
class ValenceAppBar extends StatelessWidget implements PreferredSizeWidget {
  const ValenceAppBar({
    super.key,
    this.title,
    this.titleWidget,
    this.showBackButton,
    this.onBackPressed,
    this.actions,
    this.centerTitle = false,
    this.backgroundColor,
  });

  final String? title;
  final Widget? titleWidget;
  final bool? showBackButton;
  final VoidCallback? onBackPressed;
  final List<Widget>? actions;
  final bool centerTitle;
  final Color? backgroundColor;

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    final canPop = showBackButton ?? Navigator.of(context).canPop();

    return AppBar(
      backgroundColor: backgroundColor,
      centerTitle: centerTitle,
      titleSpacing: canPop ? 0 : 16,
      leading: canPop
          ? IconButton(
              icon: const Icon(Icons.arrow_back_ios_new_rounded, size: 18),
              onPressed: onBackPressed ?? () => Navigator.of(context).maybePop(),
            )
          : null,
      title: titleWidget ?? (title != null ? Text(title!, style: AppTextStyles.titleLarge) : null),
      actions: actions,
    );
  }
}

/// Larger greeting-style header used at the top of the Dashboard
/// ("Hi, Dadow" + avatar + notification bell) instead of a standard
/// [AppBar] — kept separate since it scrolls with page content.
class ValenceHomeHeader extends StatelessWidget {
  const ValenceHomeHeader({
    super.key,
    required this.userName,
    this.avatarUrl,
    this.onAvatarTap,
    this.onNotificationTap,
    this.hasUnreadNotifications = false,
  });

  final String userName;
  final String? avatarUrl;
  final VoidCallback? onAvatarTap;
  final VoidCallback? onNotificationTap;
  final bool hasUnreadNotifications;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        GestureDetector(
          onTap: onAvatarTap,
          child: CircleAvatar(
            radius: 22,
            backgroundColor: AppColors.primaryLighter,
            backgroundImage: avatarUrl != null ? NetworkImage(avatarUrl!) : null,
            child: avatarUrl == null ? const Icon(Icons.person, color: AppColors.primary) : null,
          ),
        ),
        const SizedBox(width: 12),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Welcome back', style: AppTextStyles.bodySmall),
              Text(userName, style: AppTextStyles.titleMedium),
            ],
          ),
        ),
        Stack(
          children: [
            IconButton(
              onPressed: onNotificationTap,
              icon: const Icon(Icons.notifications_none_rounded),
            ),
            if (hasUnreadNotifications)
              Positioned(
                right: 10,
                top: 10,
                child: Container(
                  width: 8,
                  height: 8,
                  decoration: const BoxDecoration(color: AppColors.error, shape: BoxShape.circle),
                ),
              ),
          ],
        ),
      ],
    );
  }
}
