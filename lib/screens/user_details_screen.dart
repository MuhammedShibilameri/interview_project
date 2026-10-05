import 'package:flutter/material.dart';
import '../models/user_model.dart';

/// Screen displaying complete profile details for a selected [User].
class UserDetailsScreen extends StatelessWidget {
  final User user;

  const UserDetailsScreen({super.key, required this.user});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    return Scaffold(
      appBar: AppBar(title: Text(user.name)),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            // Top Hero Profile Header
            Center(
              child: Column(
                children: [
                  Hero(
                    tag: 'user-avatar-${user.id}',
                    child: CircleAvatar(
                      radius: 46,
                      backgroundColor: colorScheme.primaryContainer,
                      child: Text(
                        user.initial,
                        style: TextStyle(
                          fontSize: 36,
                          fontWeight: FontWeight.bold,
                          color: colorScheme.onPrimaryContainer,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 12),
                  Text(
                    user.name,
                    style: theme.textTheme.headlineSmall?.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 4),
                  Text(
                    '@${user.username}',
                    style: theme.textTheme.bodyMedium?.copyWith(
                      color: colorScheme.primary,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 24),

            // Contact Information Section
            _buildSectionCard(
              context: context,
              title: 'Contact Information',
              icon: Icons.contact_mail_outlined,
              children: [
                _buildInfoTile(
                  icon: Icons.email_outlined,
                  label: 'Email',
                  value: user.email,
                ),
                _buildInfoTile(
                  icon: Icons.phone_outlined,
                  label: 'Phone',
                  value: user.phone,
                ),
                _buildInfoTile(
                  icon: Icons.language_outlined,
                  label: 'Website',
                  value: user.website,
                ),
              ],
            ),
            const SizedBox(height: 16),

            // Address Information Section
            _buildSectionCard(
              context: context,
              title: 'Address',
              icon: Icons.location_on_outlined,
              children: [
                _buildInfoTile(
                  icon: Icons.home_outlined,
                  label: 'Street & Suite',
                  value: '${user.address.suite}, ${user.address.street}',
                ),
                _buildInfoTile(
                  icon: Icons.location_city_outlined,
                  label: 'City & Zipcode',
                  value: '${user.address.city}, ${user.address.zipcode}',
                ),
                _buildInfoTile(
                  icon: Icons.explore_outlined,
                  label: 'Geo Coordinates',
                  value:
                      'Lat: ${user.address.geo.lat}, Lng: ${user.address.geo.lng}',
                ),
              ],
            ),
            const SizedBox(height: 16),

            // Company Information Section
            _buildSectionCard(
              context: context,
              title: 'Company',
              icon: Icons.business_outlined,
              children: [
                _buildInfoTile(
                  icon: Icons.domain_outlined,
                  label: 'Company Name',
                  value: user.company.name,
                ),
                _buildInfoTile(
                  icon: Icons.format_quote_outlined,
                  label: 'Catch Phrase',
                  value: '"${user.company.catchPhrase}"',
                ),
                _buildInfoTile(
                  icon: Icons.work_outline,
                  label: 'Business Strategy',
                  value: user.company.bs,
                ),
              ],
            ),
            const SizedBox(height: 24),
          ],
        ),
      ),
    );
  }

  /// Builds a titled Material 3 card container for grouping details.
  Widget _buildSectionCard({
    required BuildContext context,
    required String title,
    required IconData icon,
    required List<Widget> children,
  }) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    return Card(
      elevation: 0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
        side: BorderSide(
          color: colorScheme.outlineVariant.withValues(alpha: 0.5),
        ),
      ),
      color: colorScheme.surfaceContainerLow,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Icon(icon, size: 20, color: colorScheme.primary),
                const SizedBox(width: 8),
                Text(
                  title,
                  style: theme.textTheme.titleMedium?.copyWith(
                    fontWeight: FontWeight.bold,
                    color: colorScheme.onSurface,
                  ),
                ),
              ],
            ),
            const Divider(height: 20),
            ...children,
          ],
        ),
      ),
    );
  }

  /// Builds a single label-value line with a leading icon.
  Widget _buildInfoTile({
    required IconData icon,
    required String label,
    required String value,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(icon, size: 18, color: Colors.grey[600]),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  label,
                  style: TextStyle(
                    fontSize: 12,
                    color: Colors.grey[600],
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const SizedBox(height: 2),
                Text(
                  value,
                  style: const TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
