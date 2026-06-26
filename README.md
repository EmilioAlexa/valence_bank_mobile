# Valence Mobile — Architecture

A Clean Architecture scaffold for the Valence Mobile banking app, built
with Flutter (latest stable), Dart null safety, and Material Design 3.

This commit contains **architecture only** — theme system, shared
widgets, and folder structure. No feature screens have been built yet.

## Folder structure

```
lib/
  core/
    constants/
      theme/
        colors.dart        -> AppColors (brand palette + semantic colors)
        spacing.dart        -> AppSpacing, AppRadius, AppShadows
        text_styles.dart    -> AppTextStyles (Material 3 type scale)
        app_theme.dart       -> AppTheme.light / AppTheme.dark (ThemeData)
        theme.dart           -> barrel export
    widgets/
      buttons/
        primary_button.dart    -> PrimaryButton
        secondary_button.dart  -> SecondaryButton, AppTextButton, AppIconButton
      inputs/
        app_text_field.dart      -> AppTextField
        app_password_field.dart  -> AppPasswordField, AppPinField
        app_search_field.dart    -> AppSearchField
      cards/
        app_card.dart           -> AppCard (generic container)
        balance_card.dart       -> BalanceCard (account/card summary)
        transaction_card.dart   -> TransactionCard (list item)
      dialogs/
        app_dialogs.dart    -> AppDialogs (confirm / alert / loading)
        app_snackbar.dart   -> AppSnackbar (success / error / info)
      navigation/
        valence_app_bar.dart       -> ValenceAppBar, ValenceHomeHeader
        valence_bottom_nav_bar.dart -> ValenceBottomNavBar
      widgets.dart -> barrel export for everything above
    utils/
      responsive.dart   -> Breakpoints, Responsive, ResponsiveBuilder, ResponsivePage
      validators.dart   -> Validators (email, password, PIN, amount, etc.)
      formatters.dart   -> Formatters (currency, masked account #, relative time)
  features/
    authentication/presentation/{pages,widgets}
    dashboard/presentation/{pages,widgets}
    account/presentation/{pages,widgets}
    transactions/presentation/{pages,widgets}
    profile/presentation/{pages,widgets}
    maps/presentation/{pages,widgets}
    settings/presentation/{pages,widgets}
  main.dart -> app bootstrap (MaterialApp + theme only, placeholder home)
assets/
  images/
  icons/
  fonts/
```

Each `features/<name>` module currently only contains empty
`presentation/pages` and `presentation/widgets` directories (kept via
`.gitkeep`) — ready for screens to be dropped in without touching the
shared core.

## Brand colors

| Token         | Hex       |
|---------------|-----------|
| Primary       | `#1668C6` |
| Primary Dark  | `#092A4F` |
| Secondary     | `#585D63` |
| Success       | `#0BC56F` |
| Dark          | `#080C11` |
| White         | `#E6ECF3` |

All other colors (error, warning, surfaces, text, gradients) are
derived tints/shades layered on top of this palette in `AppColors`, so
the whole app's look-and-feel can be retuned from one file.

## Theming

`AppTheme.light` / `AppTheme.dark` assemble a full `ThemeData` —
`ColorScheme`, `TextTheme`, and component themes for buttons, inputs,
app bar, bottom nav, cards, dialogs, and snackbars — so individual
screens consume the theme rather than hardcoding styles.

## Responsiveness

- `Responsive` (static helpers, `MediaQuery`-based) for quick
  breakpoint checks and adaptive padding/font scaling.
- `ResponsiveBuilder` (`LayoutBuilder`-based) for structural layout
  changes between mobile/tablet/desktop.
- `ResponsivePage` wraps a screen body in `SafeArea` +
  `SingleChildScrollView` + a width-capped, centered container — the
  default scaffolding every page should use.

## Next steps

1. Add a router (e.g. `go_router`) under `core/navigation/`.
2. Add a state-management layer (Riverpod/Bloc) per feature, in a
   `data/` + `domain/` + `presentation/` split if/when business logic
   is introduced (currently `presentation/` only, since no screens
   exist yet).
3. Build out `features/authentication` first (splash → onboarding →
   sign in / sign up → PIN setup), since every other feature depends
   on an authenticated session.
4. Drop real brand assets (logo, custom font, icon set) into
   `assets/images`, `assets/fonts`, `assets/icons` and wire up
   `pubspec.yaml`.
