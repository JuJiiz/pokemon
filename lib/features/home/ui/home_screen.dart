import 'dart:developer';

import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:pokemon/core/importer.dart';
import 'package:pokemon/features/pokemon/domain/models/pokemon_entity.dart';
import 'package:pokemon/features/pokemon/domain/providers/domain_providers.dart';
import 'package:pokemon/features/pokemon/ui/pokemon_list_view.dart';

class HomeScreen extends ConsumerStatefulWidget {
  const HomeScreen({
    super.key,
  });

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _HomeScreenState();
}

class _HomeScreenState extends ConsumerState<HomeScreen> {
  static const _pageSize = 20;

  final PagingController<int, PokemonEntity> _pagingController =
      PagingController(firstPageKey: 0);

  @override
  void initState() {
    super.initState();
    _pagingController.addPageRequestListener(_fetchData);
  }

  @override
  void dispose() {
    _pagingController.dispose();
    super.dispose();
  }

  Future<void> _fetchData(int offset) async {
    try {
      final items = await ref.read(getPokemonListUseCaseProvider)(
        offset: offset,
        perPage: _pageSize,
      );

      if (items.length < _pageSize) {
        _pagingController.appendLastPage(items);
      } else {
        _pagingController.appendPage(items, offset + items.length);
      }
    } catch (e) {
      log('[ERROR] _fetchData: $e');
    }
  }

  void _showPokemonDetail(PokemonEntity entity) {
    // TODO
  }

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.all(16),
            child: const Text(
              'Pokedex',
              style: font500$14,
            ),
          ),
          Expanded(
            child: PagedListView<int, PokemonEntity>(
              pagingController: _pagingController,
              builderDelegate: PagedChildBuilderDelegate<PokemonEntity>(
                itemBuilder: (context, item, index) {
                  return PokemonListView(
                    entity: item,
                    onTap: _showPokemonDetail,
                  );
                },
                firstPageProgressIndicatorBuilder: (context) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                },
                noItemsFoundIndicatorBuilder: (context) {
                  return const Center(
                    child: Text(
                      'ไม่มีรายการ',
                      style: font400$16,
                    ),
                  );
                },
                firstPageErrorIndicatorBuilder: (context) {
                  return Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const Text(
                        'เกิดข้อผิดพลาด กรุณาลองใหม่อีกครั้ง',
                        style: font400$16,
                      ),
                      const SizedBox(height: 16),
                      ElevatedButton(
                        onPressed: () {
                          _pagingController.refresh();
                        },
                        child: const Text(
                          'ลองใหม่อีกครั้ง',
                          style: font500$16,
                        ),
                      ),
                    ],
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
