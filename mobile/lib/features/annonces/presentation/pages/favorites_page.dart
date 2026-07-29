import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import '../../../../injection_container.dart';
import '../bloc/annonce_bloc.dart';
import '../bloc/annonce_detail_bloc.dart';
import '../widgets/annonce_post_card.dart';

class FavoritesPage extends StatefulWidget {
  const FavoritesPage({super.key});

  @override
  State<FavoritesPage> createState() => _FavoritesPageState();
}

class _FavoritesPageState extends State<FavoritesPage> {
  final _scrollController = ScrollController();
  int _currentPage = 0;
  bool _isFetchingMore = false;
  static const int _pageSize = 20;

  @override
  void initState() {
    super.initState();
    _load(reset: true);
    _scrollController.addListener(_onScroll);
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  void _load({bool reset = false}) {
    if (reset) _currentPage = 0;
    context.read<AnnonceBloc>().add(
      AnnonceEvent.loadFavorites(page: _currentPage, size: _pageSize),
    );
  }

  void _onScroll() {
    if (_scrollController.position.pixels >=
        _scrollController.position.maxScrollExtent - 300 &&
        !_isFetchingMore) {
      final state = context.read<AnnonceBloc>().state;
      state.maybeWhen(
        favoritesLoaded: (data) {
          if (!data.last) {
            setState(() {
              _isFetchingMore = true;
              _currentPage++;
            });
            _load();
          }
        },
        orElse: () {},
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(title: const Text('Mes favoris')),
      body: BlocConsumer<AnnonceBloc, AnnonceState>(
        listener: (context, state) {
          state.maybeWhen(
            favoritesLoaded: (_) => setState(() => _isFetchingMore = false),
            failure: (_) => setState(() => _isFetchingMore = false),
            orElse: () {},
          );
        },
        builder: (context, state) {
          return state.maybeWhen(
            loading: () => const Center(child: CircularProgressIndicator()),
            favoritesLoaded: (data) {
              if (data.content.isEmpty) {
                return Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text('🤍', style: TextStyle(fontSize: 64)),
                      const SizedBox(height: 16),
                      Text(
                        'Aucun favori',
                        style: theme.textTheme.titleMedium
                            ?.copyWith(color: Colors.grey),
                      ),
                    ],
                  ),
                );
              }
              return RefreshIndicator(
                onRefresh: () async => _load(reset: true),
                child: ListView.builder(
                  controller: _scrollController,
                  padding: const EdgeInsets.only(bottom: 80),
                  itemCount:
                  data.content.length + (_isFetchingMore ? 1 : 0),
                  itemBuilder: (context, index) {
                    if (index == data.content.length) {
                      return const Padding(
                        padding: EdgeInsets.all(16),
                        child: Center(
                          child:
                          CircularProgressIndicator(strokeWidth: 2),
                        ),
                      );
                    }
                    final annonce = data.content[index];
                    return BlocProvider(
                      create: (_) => sl<AnnonceDetailBloc>(),
                      child: AnnoncePostCard(
                        annonce: annonce,
                        onTap: () =>
                            context.push('/annonces/${annonce.id}'),
                        onContact: () =>
                            context.push('/annonces/${annonce.id}'),
                      ),
                    );
                  },
                ),
              );
            },
            failure: (message) => Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(Icons.error_outline,
                      size: 48, color: Colors.red),
                  const SizedBox(height: 12),
                  Text(message, textAlign: TextAlign.center),
                  const SizedBox(height: 16),
                  FilledButton(
                    onPressed: () => _load(reset: true),
                    child: const Text('Réessayer'),
                  ),
                ],
              ),
            ),
            orElse: () => const SizedBox.shrink(),
          );
        },
      ),
    );
  }
}