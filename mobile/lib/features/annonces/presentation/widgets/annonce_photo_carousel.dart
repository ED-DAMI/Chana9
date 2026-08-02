import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import 'package:ma_chana9_app/core/constants/api_constants.dart';
import '../../../../l10n/app_localizations.dart';
import '../../domain/entities/annonce.dart';

class AnnoncePhotoCarousel extends StatefulWidget {
  final Annonce annonce;
  final double height;

  const AnnoncePhotoCarousel({
    super.key,
    required this.annonce,
    this.height = 300,
  });

  @override
  State<AnnoncePhotoCarousel> createState() => _AnnoncePhotoCarouselState();
}

class _AnnoncePhotoCarouselState extends State<AnnoncePhotoCarousel> {
  final PageController _controller = PageController();
  int _currentIndex = 0;

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final medias = widget.annonce.medias;
    final l10n = AppLocalizations.of(context)!;

    if (medias.isEmpty) {
      return _Placeholder(annonce: widget.annonce, height: widget.height);
    }

    return SizedBox(
      height: widget.height,
      child: Stack(
        children: [
          PageView.builder(
            controller: _controller,
            itemCount: medias.length,
            onPageChanged: (index) => setState(() => _currentIndex = index),
            itemBuilder: (context, index) {
              final imageUrl = medias[index].url.startsWith('http')
                  ? medias[index].url
                  : "${ApiConstants.baseUrl_photos}/${medias[index].url}".replaceAll('(?<!:)/{2,}', '/');

              return CachedNetworkImage(
                imageUrl: imageUrl,
                fit: BoxFit.cover,
                width: double.infinity,
                placeholder: (context, url) => Container(
                  color: Colors.grey.shade200,
                  child: const Center(
                    child: CircularProgressIndicator(strokeWidth: 2),
                  ),
                ),
                errorWidget: (context, url, error) => Container(
                  color: Colors.grey.shade200,
                  child: const Icon(
                    Icons.broken_image_outlined,
                    size: 48,
                    color: Colors.grey,
                  ),
                ),
              );
            },
          ),
          if (medias.length > 1)
            Positioned(
              top: 12,
              right: 12,
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                decoration: BoxDecoration(
                  color: Colors.black54,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Text(
                  '${_currentIndex + 1} / ${medias.length}',
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 12,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ),
          if (medias.length > 1)
            Positioned(
              bottom: 12,
              left: 0,
              right: 0,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: List.generate(
                  medias.length,
                      (index) => AnimatedContainer(
                    duration: const Duration(milliseconds: 250),
                    margin: const EdgeInsets.symmetric(horizontal: 3),
                    width: _currentIndex == index ? 20 : 7,
                    height: 7,
                    decoration: BoxDecoration(
                      color: _currentIndex == index
                          ? Colors.white
                          : Colors.white54,
                      borderRadius: BorderRadius.circular(4),
                    ),
                  ),
                ),
              ),
            ),
          if (widget.annonce.isTopLot)
            Positioned(
              top: 12,
              left: 12,
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                decoration: BoxDecoration(
                  color: Colors.amber.shade700,
                  borderRadius: BorderRadius.circular(6),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Icon(Icons.star, color: Colors.white, size: 13),
                    const SizedBox(width: 4),
                    Text(
                      l10n.topLot,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 11,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
            ),
        ],
      ),
    );
  }
}

class _Placeholder extends StatelessWidget {
  final Annonce annonce;
  final double height;

  const _Placeholder({required this.annonce, required this.height});

  Color _colorForBreed(String breedName) {
    final colors = [
      const Color(0xFF81C784),
      const Color(0xFF64B5F6),
      const Color(0xFFFFB74D),
      const Color(0xFFBA68C8),
      const Color(0xFF4DB6AC),
    ];
    return colors[breedName.length % colors.length];
  }

  @override
  Widget build(BuildContext context) {
    final breedName = annonce.breed.name;
    return Container(
      height: height,
      width: double.infinity,
      color: _colorForBreed(breedName),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text('🐑', style: TextStyle(fontSize: 64)),
          const SizedBox(height: 8),
          Text(
            breedName.toUpperCase(),
            style: const TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 16,
            ),
          ),
        ],
      ),
    );
  }
}