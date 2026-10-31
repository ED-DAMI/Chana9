import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:share_plus/share_plus.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../domain/entities/annonce.dart';
import '../../domain/entities/share_payload.dart';
import '../bloc/annonce_share/annonce_share_bloc.dart';
import '../bloc/annonce_share/annonce_share_event.dart';
import '../bloc/annonce_share/annonce_share_state.dart';
import '../../../../core/utils/share_utils.dart';

class AnnonceShareBottomSheet extends StatelessWidget {
  final Annonce annonce;

  const AnnonceShareBottomSheet({super.key, required this.annonce});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AnnonceShareBloc, AnnonceShareState>(
      listener: (context, state) {
        state.whenOrNull(
          linkCopied: (_) {
            Navigator.of(context).pop();
            ScaffoldMessenger.of(
              context,
            ).showSnackBar(const SnackBar(content: Text('Lien copié')));
          },
          error: (message) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text(message), backgroundColor: Colors.red),
            );
          },
        );
      },
      builder: (context, state) {
        final payload = state.whenOrNull(shared: (value) => value);
        final isSharing = state.maybeWhen(
          sharing: () => true,
          orElse: () => false,
        );
        return SafeArea(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(20, 12, 20, 20),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const _SheetHandle(),
                const SizedBox(height: 12),
                Text(
                  'Partager l’annonce',
                  style: Theme.of(context).textTheme.titleLarge,
                ),
                const SizedBox(height: 16),
                if (isSharing || payload == null)
                  const Padding(
                    padding: EdgeInsets.all(24),
                    child: CircularProgressIndicator(),
                  )
                else ...[
                  _ShareOption(
                    icon: Icons.chat,
                    label: 'WhatsApp',
                    color: const Color(0xff25d366),
                    onTap: () => _openWhatsApp(context, payload),
                  ),
                  _ShareOption(
                    icon: Icons.facebook,
                    label: 'Facebook',
                    color: const Color(0xff1877f2),
                    onTap: () => _openFacebook(context, payload),
                  ),
                  _ShareOption(
                    icon: Icons.camera_alt_outlined,
                    label: 'Instagram',
                    color: const Color(0xffe1306c),
                    onTap: () => _openInstagram(context, payload),
                  ),
                  _ShareOption(
                    icon: Icons.link,
                    label: 'Copier le lien',
                    onTap: () => context.read<AnnonceShareBloc>().add(
                      AnnonceShareEvent.copyLinkRequested(annonce.id),
                    ),
                  ),
                ],
              ],
            ),
          ),
        );
      },
    );
  }

  Future<void> _openWhatsApp(BuildContext context, SharePayload payload) async {
    await _launchOrFallback(
      context,
      ShareUtils.buildWhatsAppUrl(payload.text),
      payload.fallbackUrl,
      payload.text,
    );
  }

  Future<void> _openFacebook(BuildContext context, SharePayload payload) async {
    await _launchOrFallback(
      context,
      ShareUtils.buildFacebookUrl(payload.fallbackUrl),
      payload.fallbackUrl,
      payload.text,
    );
  }

  Future<void> _openInstagram(
    BuildContext context,
    SharePayload payload,
  ) async {
    await _launchOrFallback(
      context,
      ShareUtils.buildInstagramUrl(payload.text),
      payload.fallbackUrl,
      payload.text,
    );
  }

  Future<void> _launchOrFallback(
    BuildContext context,
    String nativeUrl,
    String fallbackUrl,
    String text,
  ) async {
    final nativeUri = Uri.parse(nativeUrl);
    if (await canLaunchUrl(nativeUri) &&
        await launchUrl(nativeUri, mode: LaunchMode.externalApplication)) {
      return;
    }

    final fallbackUri = Uri.parse(fallbackUrl);
    if (await canLaunchUrl(fallbackUri) &&
        await launchUrl(fallbackUri, mode: LaunchMode.externalApplication)) {
      return;
    }

    await Share.share(text);
  }
}

class _SheetHandle extends StatelessWidget {
  const _SheetHandle();

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 42,
      height: 4,
      decoration: BoxDecoration(
        color: Colors.grey.shade400,
        borderRadius: BorderRadius.circular(4),
      ),
    );
  }
}

class _ShareOption extends StatelessWidget {
  final IconData icon;
  final String label;
  final Color? color;
  final VoidCallback onTap;

  const _ShareOption({
    required this.icon,
    required this.label,
    required this.onTap,
    this.color,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(icon, color: color),
      title: Text(label),
      onTap: onTap,
    );
  }
}
