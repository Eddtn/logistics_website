// lib/core/widgets/language_switch.dart
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final localeProvider = StateProvider<Locale>((ref) => const Locale('en'));

class LanguageSwitch extends ConsumerWidget {
  const LanguageSwitch({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final locale = ref.watch(localeProvider);

    return PopupMenuButton<Locale>(
      icon: const Icon(Icons.language),
      tooltip: "Change Language",
      onSelected: (newLocale) {
        ref.read(localeProvider.notifier).state = newLocale;
      },
      itemBuilder: (context) => [
        const PopupMenuItem(value: Locale('en'), child: Text('English')),
        const PopupMenuItem(value: Locale('es'), child: Text('Español')),
        const PopupMenuItem(value: Locale('fr'), child: Text('Français')),
        const PopupMenuItem(value: Locale('ar'), child: Text('العربية')),
      ],
    );
  }
}
