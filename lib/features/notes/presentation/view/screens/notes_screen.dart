import 'package:flutter/material.dart';
import 'package:notesphere/core/colors_themes/text_style.dart';
import 'package:notesphere/core/widgets/cards/custom_card.dart';
import 'package:provider/provider.dart';
import 'package:notesphere/core/widgets/app_bars/custom_app_bar.dart';
import 'package:notesphere/core/widgets/buttons/custom_floating_button.dart';
import 'package:notesphere/core/widgets/inputs/custom_search_field.dart';
import '../../viewmodel/notes_view_model.dart';

class NoteScreen extends StatefulWidget {
  const NoteScreen({super.key});

  @override
  State<NoteScreen> createState() => _NoteScreenState();
}

class _NoteScreenState extends State<NoteScreen> {
  @override
  void initState() {
    super.initState();

    // Call API after widget builds
    Future.microtask(() {
      context.read<NotesViewModel>().fetchNotes();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: 'NoteSphere',
        titleStyle: AppTextStyles.headingLarge,
        centerTitle: false,
        showShadow: true,
        elevation: 0,
        scrolledUnderElevation: 0,
        showBackButton: false,
      ),

      body: Consumer<NotesViewModel>(
        builder: (context, vm, child) {
          //  Loading State
          if (vm.isLoading) {
            return const Center(child: CircularProgressIndicator());
          }

          // Error State
          if (vm.error != null) {
            return Center(
              child: Text(vm.error!, style: const TextStyle(color: Colors.red)),
            );
          }

          // Empty State
          if (vm.notes.isEmpty) {
            return const Center(
              child: Text(
                'No notes available',
                style: TextStyle(fontSize: 18, color: Colors.grey),
              ),
            );
          }

          // Success State
          return Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                const SizedBox(height: 20),
                SearchTextField(),
                const SizedBox(height: 20),

                Expanded(
                  child: ListView.builder(
                    itemCount: vm.notes.length,
                    itemBuilder: (context, index) {
                      final note = vm.notes[index];

                      return Padding(
                        padding: const EdgeInsets.only(bottom: 12),
                        child: CustomCard(
                          title: note.title,
                          subtitle: note.body,
                          onTap: () => print('Tapped note: ${note.title}'),
                        ),
                      );
                    },
                  ),
                ),

                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: CustomFloatingActionButton(
                    icon: Icons.add,
                    onPressed: () {
                      // Add note logic later
                    },
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
