import 'package:flutter/material.dart';
import 'package:fogstorage/gen_l10n/app_localizations.dart';
import 'package:fogstorage/utils/database.dart';

enum _SearchSortOption {
  titleAscending,
  titleDescending,
  priceAscending,
  priceDescending,
  numberAscending,
  numberDescending,
}

/// Search Page
class SearchPage extends StatefulWidget {
  final AppDatabase database;

  const SearchPage({super.key, required this.database});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  final TextEditingController _searchController = TextEditingController();
  String _query = '';
  String _selectedRoom = '';
  _SearchSortOption _sortOption = _SearchSortOption.titleAscending;

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  List<PartsListData> _applySorting(List<PartsListData> parts) {
    final sortedParts = [...parts];

    int compareNullableInt(int? left, int? right) {
      if (left == null && right == null) return 0;
      if (left == null) return 1;
      if (right == null) return -1;
      return left.compareTo(right);
    }

    sortedParts.sort((left, right) {
      int result;

      switch (_sortOption) {
        case _SearchSortOption.titleAscending:
        case _SearchSortOption.titleDescending:
          result = left.title.toLowerCase().compareTo(right.title.toLowerCase());
          break;
        case _SearchSortOption.priceAscending:
        case _SearchSortOption.priceDescending:
          result = compareNullableInt(left.price, right.price);
          break;
        case _SearchSortOption.numberAscending:
        case _SearchSortOption.numberDescending:
          result = compareNullableInt(left.number, right.number);
          break;
      }

      if (result == 0) {
        result = left.title.toLowerCase().compareTo(right.title.toLowerCase());
      }

      final isDescending = switch (_sortOption) {
        _SearchSortOption.titleDescending => true,
        _SearchSortOption.priceDescending => true,
        _SearchSortOption.numberDescending => true,
        _SearchSortOption.titleAscending => false,
        _SearchSortOption.priceAscending => false,
        _SearchSortOption.numberAscending => false,
      };

      return isDescending ? -result : result;
    });

    return sortedParts;
  }

  Widget _buildSortMenuItem(String label, IconData icon) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(label),
        Icon(icon, size: 18),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final allRoomsLabel = l10n.search_filter_room_all;
    final selectedRoom = _selectedRoom.isEmpty ? allRoomsLabel : _selectedRoom;

    return Scaffold(
      appBar: AppBar(
        title: Text(l10n.appbar_search),
        centerTitle: true,
        backgroundColor: Theme.of(context).colorScheme.background,
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(16, 16, 16, 8),
            child: TextField(
              controller: _searchController,
              onChanged: (value) {
                setState(() {
                  _query = value.trim().toLowerCase();
                });
              },
              decoration: InputDecoration(
                labelText: l10n.search_title_label,
                hintText: l10n.search_title_hint,
                prefixIcon: const Icon(Icons.search),
                border: const OutlineInputBorder(),
              ),
            ),
          ),
          Expanded(
            child: StreamBuilder<List<StorageRoom>>(
              stream: widget.database.select(widget.database.storageRooms).watch(),
              builder: (context, roomsSnapshot) {
                if (roomsSnapshot.connectionState == ConnectionState.waiting) {
                  return const Center(child: CircularProgressIndicator());
                }

                if (roomsSnapshot.hasError) {
                  return Center(
                    child: Text(l10n.search_error_loading_rooms(roomsSnapshot.error!)),
                  );
                }

                final rooms = roomsSnapshot.data ?? const <StorageRoom>[];
                final roomNames = rooms
                    .map((room) => room.roomName)
                    .toSet()
                    .toList()
                  ..sort((left, right) => left.toLowerCase().compareTo(right.toLowerCase()));

                final effectiveSelectedRoom = roomNames.contains(selectedRoom)
                  ? selectedRoom
                  : allRoomsLabel;

                final roomsByPartId = <int, List<String>>{};
                for (final room in rooms) {
                  roomsByPartId.putIfAbsent(room.partId, () => []).add(room.roomName);
                }

                return Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      child: Card(
                        elevation: 1,
                        child: Padding(
                          padding: const EdgeInsets.all(12),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: [
                              DropdownButtonFormField<String>(
                                value: effectiveSelectedRoom,
                                decoration: InputDecoration(
                                  labelText: l10n.search_filter_room_label,
                                  border: const OutlineInputBorder(),
                                ),
                                items: [
                                  DropdownMenuItem<String>(
                                    value: allRoomsLabel,
                                    child: Text(allRoomsLabel),
                                  ),
                                  ...roomNames.map(
                                    (roomName) => DropdownMenuItem<String>(
                                      value: roomName,
                                      child: Text(roomName),
                                    ),
                                  ),
                                ],
                                onChanged: (value) {
                                  if (value == null) {
                                    return;
                                  }

                                  setState(() {
                                    _selectedRoom = value;
                                  });
                                },
                              ),
                              const SizedBox(height: 12),
                              DropdownButtonFormField<_SearchSortOption>(
                                value: _sortOption,
                                decoration: InputDecoration(
                                  labelText: l10n.search_sort_label,
                                  border: const OutlineInputBorder(),
                                ),
                                items: [
                                  DropdownMenuItem(
                                    value: _SearchSortOption.titleAscending,
                                    child: _buildSortMenuItem(l10n.search_sort_title, Icons.arrow_upward),
                                  ),
                                  DropdownMenuItem(
                                    value: _SearchSortOption.titleDescending,
                                    child: _buildSortMenuItem(l10n.search_sort_title, Icons.arrow_downward),
                                  ),
                                  DropdownMenuItem(
                                    value: _SearchSortOption.priceAscending,
                                    child: _buildSortMenuItem(l10n.search_sort_price, Icons.arrow_upward),
                                  ),
                                  DropdownMenuItem(
                                    value: _SearchSortOption.priceDescending,
                                    child: _buildSortMenuItem(l10n.search_sort_price, Icons.arrow_downward),
                                  ),
                                  DropdownMenuItem(
                                    value: _SearchSortOption.numberAscending,
                                    child: _buildSortMenuItem(l10n.search_sort_quantity, Icons.arrow_upward),
                                  ),
                                  DropdownMenuItem(
                                    value: _SearchSortOption.numberDescending,
                                    child: _buildSortMenuItem(l10n.search_sort_quantity, Icons.arrow_downward),
                                  ),
                                ],
                                onChanged: (value) {
                                  if (value == null) {
                                    return;
                                  }

                                  setState(() {
                                    _sortOption = value;
                                  });
                                },
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 8),
                    Expanded(
                      child: StreamBuilder<List<PartsListData>>(
                        stream: widget.database.select(widget.database.partsList).watch(),
                        builder: (context, partsSnapshot) {
                          if (partsSnapshot.connectionState == ConnectionState.waiting) {
                            return const Center(child: CircularProgressIndicator());
                          }

                          if (partsSnapshot.hasError) {
                            return Center(
                              child: Text(l10n.search_error_loading_parts(partsSnapshot.error!)),
                            );
                          }

                          final parts = partsSnapshot.data ?? const <PartsListData>[];

                          final filteredParts = parts.where((part) {
                            final matchesTitle = _query.isEmpty || part.title.toLowerCase().contains(_query);
                            final partRooms = roomsByPartId[part.id] ?? const <String>[];
                            final matchesRoom = effectiveSelectedRoom == allRoomsLabel || partRooms.contains(effectiveSelectedRoom);

                            return matchesTitle && matchesRoom;
                          }).toList();

                          final sortedParts = _applySorting(filteredParts);

                          if (parts.isEmpty) {
                            return Center(
                              child: Text(
                                l10n.search_empty_parts,
                                textAlign: TextAlign.center,
                              ),
                            );
                          }

                          if (sortedParts.isEmpty) {
                            return Center(
                              child: Text(
                                l10n.search_no_results,
                                textAlign: TextAlign.center,
                              ),
                            );
                          }

                          return ListView.separated(
                            padding: const EdgeInsets.fromLTRB(16, 8, 16, 16),
                            itemCount: sortedParts.length,
                            separatorBuilder: (context, index) => const SizedBox(height: 8),
                            itemBuilder: (context, index) {
                              final part = sortedParts[index];
                              final partRooms = roomsByPartId[part.id] ?? const <String>[];
                              final priceInEuro = part.price != null
                                  ? (part.price! / 100).toStringAsFixed(2)
                                  : '0.00';

                              final subtitleLines = <String>[
                                l10n.home_article_number_prefix(part.partnumber ?? '-'),
                                if (partRooms.isNotEmpty) l10n.search_room_prefix(partRooms.join(', ')),
                                if (part.discription != null && part.discription!.trim().isNotEmpty)
                                  part.discription!,
                              ];

                              return Card(
                                elevation: 2,
                                child: ListTile(
                                  leading: CircleAvatar(
                                    backgroundColor: Theme.of(context).colorScheme.primary,
                                    child: Text(
                                      '${part.number}x',
                                      style: const TextStyle(
                                        fontSize: 12,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                  title: Text(
                                    part.title,
                                    style: const TextStyle(fontWeight: FontWeight.bold),
                                  ),
                                  subtitle: Text(
                                    subtitleLines.join('\n'),
                                    maxLines: 3,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                  trailing: Text(
                                    '$priceInEuro €',
                                    style: const TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: Colors.green,
                                    ),
                                  ),
                                  isThreeLine: subtitleLines.length > 2,
                                ),
                              );
                            },
                          );
                        },
                      ),
                    ),
                  ],
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}