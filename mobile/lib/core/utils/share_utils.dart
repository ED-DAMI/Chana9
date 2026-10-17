import 'package:ma_chana9_app/features/annonces/domain/entities/annonce.dart';

abstract final class ShareUtils {
  static String buildDeepLink(String id) => 'chana9://annonces/$id';

  static String buildFallbackUrl(String id) => 'https://chana9.ma/annonces/$id';

  static String buildShareText(Annonce annonce) {
    return '${annonce.title}\n'
        'Prix: ${annonce.price.toStringAsFixed(0)} MAD\n'
        'Race: ${annonce.breed.backendValue}\n'
        'Région: ${annonce.region}\n'
        '${buildDeepLink(annonce.id)}\n'
        '${buildFallbackUrl(annonce.id)}';
  }

  static String buildWhatsAppUrl(String text) =>
      'whatsapp://send?text=${Uri.encodeComponent(text)}';

  static String buildFacebookUrl(String fallbackUrl) =>
      'fb://facewebmodal/f?href=${Uri.encodeComponent(fallbackUrl)}';

  static String buildInstagramUrl(String text) =>
      'instagram://sharesheet?text=${Uri.encodeComponent(text)}';
}
