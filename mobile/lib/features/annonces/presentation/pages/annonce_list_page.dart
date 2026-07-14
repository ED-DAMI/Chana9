import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../data/models/annonce_search_request_model.dart';
import '../bloc/annonce_bloc.dart';
import '../widgets/annonce_card.dart';
import '../widgets/annonce_filter_sheet.dart';
import 'annonce_detail_page.dart';

class AnnonceListPage extends StatefulWidget {
  const AnnonceListPage({super.key});

  @override
  State<AnnonceListPage> createState() => _AnnonceListPageState();
}

class _AnnonceListPageState extends State<AnnonceListPage> {
  var _currentFilter = const AnnonceSearchRequestModel();
  final _scrollController = ScrollController();
  int _currentPage = 0;
  static const int _pageSize = 20;

  @override
  void initState() {
    super.initState();
    _loadAnnonces();
    _scrollController.addListener(_onScroll);
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  void _loadAnnonces({bool reset = false}) {
    if (reset) _currentPage = 0;
    context.read<AnnonceBloc>().add(AnnonceEvent.searchAnnonces(
          request: _currentFilter,
          page: _currentPage,
          size: _pageSize,
        ));
  }

  void _onScroll() {
    if (_scrollController.position.pixels >=
        _scrollController.position.maxScrollExtent - 200) {
      final state = context.read<AnnonceBloc>().state;
      state.maybeWhen(
        annonceListLoaded: (data) {
          if (!data.last) {
            _currentPage++;
            _loadAnnonces();
          }
        },
        orElse: () {},
      );
    }
  }

  void _openFilterSheet() {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (_) => AnnonceFilterSheet(
        initialFilter: _currentFilter,
        onApply: (filter) {
          setState(() => _currentFilter = filter);
          _loadAnnonces(reset: true);
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Annonces'),
        actions: [
          IconButton(
            icon: const Icon(Icons.tune),
            onPressed: _openFilterSheet,
            tooltip: 'Filtres',
          ),
        ],
      ),
      body: BlocBuilder<AnnonceBloc, AnnonceState>(
        builder: (context, state) {
          return state.when(
            initial: () => const SizedBox.shrink(),
            loading: () => const Center(child: CircularProgressIndicator()),
            annonceListLoaded: (data) {
              if (data.content.isEmpty) {
                return const Center(
                  child: Text('Aucune annonce trouvée.'),
                );
              }
              return RefreshIndicator(
                onRefresh: () async => _loadAnnonces(reset: true),
                child: GridView.builder(
                  controller: _scrollController,
                  padding: const EdgeInsets.all(12),
                  gridDelegate:
                      const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 12,
                    mainAxisSpacing: 12,
                    childAspectRatio: 0.72,
                  ),
                  itemCount: data.content.length,
                  itemBuilder: (context, index) {
                    final annonce = data.content[index];
                    return AnnonceCard(
                      annonce: annonce,
                      onTap: () => Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (_) => BlocProvider.value(
                            value: context.read<AnnonceBloc>(),
                            child: AnnonceDetailPage(annonceId: annonce.id),
                          ),
                        ),
                      ),
                      onFavoriteToggle: () => context
                          .read<AnnonceBloc>()
                          .add(AnnonceEvent.addFavorite(annonce.id)),
                    );
                  },
                ),
              );
            },
            annonceDetailLoaded: (_) => const SizedBox.shrink(),
            annonceCreated: (_) => const SizedBox.shrink(),
            annonceUpdated: (_) => const SizedBox.shrink(),
            annonceDeleted: () => const SizedBox.shrink(),
            actionSuccess: () => const SizedBox.shrink(),
            favoritesLoaded: (_) => const SizedBox.shrink(),
            alertsLoaded: (_) => const SizedBox.shrink(),
            failure: (message) => Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(Icons.error_outline, size: 48, color: Colors.red),
                  const SizedBox(height: 12),
                  Text(message, textAlign: TextAlign.center),
                  const SizedBox(height: 16),
                  FilledButton(
                    onPressed: () => _loadAnnonces(reset: true),
                    child: const Text('Réessayer'),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
