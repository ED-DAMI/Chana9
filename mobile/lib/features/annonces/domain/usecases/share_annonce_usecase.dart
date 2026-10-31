import 'package:dartz/dartz.dart';
import 'package:ma_chana9_app/core/error/failure.dart';
import 'package:ma_chana9_app/core/utils/share_utils.dart';
import '../entities/annonce.dart';
import '../entities/share_payload.dart';

class ShareAnnonce {
  Future<Either<Failure, SharePayload>> call(Annonce annonce) async {
    if (annonce.id.trim().isEmpty) {
      return const Left(Failure.unknown('Identifiant d’annonce invalide'));
    }

    return Right(
      SharePayload(
        text: ShareUtils.buildShareText(annonce),
        deepLink: ShareUtils.buildDeepLink(annonce.id),
        fallbackUrl: ShareUtils.buildFallbackUrl(annonce.id),
      ),
    );
  }
}
