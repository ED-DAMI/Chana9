import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ma_chana9_app/l10n/app_localizations.dart';
import '../../data/models/annonce_search_request_model.dart';
import '../bloc/annonce_bloc.dart';
import '../bloc/annonce_detail_bloc.dart';
import '../widgets/annonce_filter_sheet.dart';
import '../widgets/annonce_post_card.dart';
import 'package:go_router/go_router.dart';
import '../../../../injection_container.dart';
import 'package:ma_chana9_app/shared/widgets/language_selector.dart';

class AnnonceListPage extends StatefulWidget {
  const AnnonceListPage({super.key});

  @override
  State<AnnonceListPage> createState() => _AnnonceListPageState();
}

class _AnnonceListPageState extends State<AnnonceListPage> {
  var _currentFilter = const AnnonceSearchRequestModel();
  final _scrollController = ScrollController();
  int _currentPage = 0;
  bool _isFetchingMore = false;
  static const int _pageSize = 15;

  @override
  void initState() {
    super.initState();
    _loadAnnonces(reset: true);
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
        _scrollController.position.maxScrollExtent - 300 &&
        !_isFetchingMore) {
      final state = context.read<AnnonceBloc>().state;
      state.maybeWhen(
        annonceListLoaded: (data) {
          if (!data.last) {
            setState(() {
              _isFetchingMore = true;
              _currentPage++;
            });
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
          setState(() {
            _currentFilter = filter;
            _isFetchingMore = false;
          });
          _loadAnnonces(reset: true);
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final l10n = AppLocalizations.of(context)!;

    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 1,
        title: Text(
          l10n.appName,
          style: TextStyle(
            color: theme.colorScheme.primary,
            fontWeight: FontWeight.bold,
            fontSize: 22,
          ),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.filter_list),
            onPressed: _openFilterSheet,
            tooltip: l10n.filterAnnonces,
          ),
          IconButton(
            icon: const Icon(Icons.search),
            onPressed: _openFilterSheet,
            tooltip: l10n.searchAnnonces,
          ),
          const LanguageSelector(),
        ],
      ),
      body: BlocConsumer<AnnonceBloc, AnnonceState>(
        listener: (context, state) {
          state.maybeWhen(
            annonceListLoaded: (_) => setState(() => _isFetchingMore = false),
            failure: (_) => setState(() => _isFetchingMore = false),
            orElse: () {},
          );
        },
        builder: (context, state) {
          return state.maybeWhen(
            initial: () => const SizedBox.shrink(),
            loading: () => const Center(child: CircularProgressIndicator()),
            annonceListLoaded: (data) {
              if (data.content.isEmpty) {
                return Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text('🐑', style: TextStyle(fontSize: 64)),
                      const SizedBox(height: 16),
                      Text(
                        l10n.noAnnoncesFound,
                        style: theme.textTheme.titleMedium
                            ?.copyWith(color: Colors.grey),
                      ),
                      const SizedBox(height: 12),
                      TextButton(
                        onPressed: () => _loadAnnonces(reset: true),
                        child: Text(l10n.retry),
                      ),
                    ],
                  ),
                );
              }

              return RefreshIndicator(
                onRefresh: () async {
                  setState(() => _isFetchingMore = false);
                  _loadAnnonces(reset: true);
                },
                child: ListView.builder(
                  controller: _scrollController,
                  padding: const EdgeInsets.only(bottom: 80),
                  itemCount: data.content.length + (_isFetchingMore ? 1 : 0),
                  itemBuilder: (context, index) {
                    if (index == data.content.length) {
                      return const Padding(
                        padding: EdgeInsets.all(16),
                        child: Center(
                          child: CircularProgressIndicator(strokeWidth: 2),
                        ),
                      );
                    }
                    final annonce = data.content[index];
                    return BlocProvider(
                      create: (_) => sl<AnnonceDetailBloc>(),
                      child: AnnoncePostCard(
                        annonce: annonce,
                        onTap: () => context.push('/annonces/${annonce.id}'),
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
                  const Icon(Icons.error_outline, size: 48, color: Colors.red),
                  const SizedBox(height: 12),
                  Text(message, textAlign: TextAlign.center),
                  const SizedBox(height: 16),
                  FilledButton(
                    onPressed: () => _loadAnnonces(reset: true),
                    child: Text(l10n.retry),
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