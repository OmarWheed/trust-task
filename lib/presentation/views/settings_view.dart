import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class SettingsView extends StatelessWidget {
  const SettingsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Settings'),
        elevation: 0,
        backgroundColor: Colors.deepOrange,
      ),
      body: ListView(
        padding: const EdgeInsets.all(16.0),
        children: [
          // Language Settings Card
          Card(
            elevation: 2,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Icon(
                        Icons.language,
                        color: Colors.deepOrange,
                        size: 28,
                      ),
                      const SizedBox(width: 12),
                      Text(
                        'Language',
                        style: Theme.of(context).textTheme.titleLarge?.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),
                  // English Option
                  LanguageOption(
                    language: 'English',
                    code: 'en',
                    isSelected: context.locale.languageCode == 'en',
                    onTap: () {
                      context.setLocale(const Locale('en'));
                    },
                  ),
                  const SizedBox(height: 12),
                  // Arabic Option
                  LanguageOption(
                    language: 'العربية',
                    code: 'ar',
                    isSelected: context.locale.languageCode == 'ar',
                    onTap: () {
                      context.setLocale(const Locale('ar'));
                    },
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 24),
          // Additional Settings
          Card(
            elevation: 2,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'App Info',
                    style: Theme.of(context).textTheme.titleLarge?.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 16),
                  ListTile(
                    contentPadding: EdgeInsets.zero,
                    leading: const Icon(Icons.info),
                    title: const Text('Version'),
                    trailing: const Text('1.0.0'),
                  ),
                  const Divider(),
                  ListTile(
                    contentPadding: EdgeInsets.zero,
                    leading: const Icon(Icons.phone),
                    title: const Text('About'),
                    trailing: const Icon(Icons.arrow_forward),
                    onTap: () {
                      _showAboutDialog(context);
                    },
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  void _showAboutDialog(BuildContext context) {
    showAboutDialog(
      context: context,
      applicationName: 'Dushka Burger',
      applicationVersion: '1.0.0',
      applicationLegalese: '© 2026 Dushka Burger. All rights reserved.',
      children: [
        const SizedBox(height: 24),
        Text(
          'Your favorite burger delivery app',
          style: Theme.of(context).textTheme.bodyMedium,
        ),
      ],
    );
  }
}

class LanguageOption extends StatelessWidget {
  final String language;
  final String code;
  final bool isSelected;
  final VoidCallback onTap;

  const LanguageOption({
    super.key,
    required this.language,
    required this.code,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(8),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
        decoration: BoxDecoration(
          border: Border.all(
            color: isSelected ? Colors.deepOrange : Colors.grey[300]!,
            width: isSelected ? 2 : 1,
          ),
          borderRadius: BorderRadius.circular(8),
          color: isSelected ? Colors.deepOrange.withValues(alpha: 0.1) : Colors.transparent,
        ),
        child: Row(
          children: [
            Container(
              width: 20,
              height: 20,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(
                  color: isSelected ? Colors.deepOrange : Colors.grey[400]!,
                  width: 2,
                ),
              ),
              child: isSelected
                  ? Center(
                    child: Container(
                      width: 10,
                      height: 10,
                      decoration: const BoxDecoration(
                        color: Colors.deepOrange,
                        shape: BoxShape.circle,
                      ),
                    ),
                  )
                  : null,
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Text(
                language,
                style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                  fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
                  color: isSelected ? Colors.deepOrange : Colors.black87,
                ),
              ),
            ),
            Text(
              code.toUpperCase(),
              style: Theme.of(context).textTheme.bodySmall?.copyWith(
                color: isSelected ? Colors.deepOrange : Colors.grey,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
