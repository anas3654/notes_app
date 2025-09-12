import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:note_app/simple_bloc_observer.dart';
import 'package:note_app/views/home_views.dart';
import 'package:note_app/views/note_details_view.dart';
import 'package:note_app/views/search_view.dart';
import 'package:sizer/sizer.dart';
import 'cubits/add_note_cubit/add_note_cubit.dart';
import 'cubits/get_notes/get_notes_cubit.dart';
import 'cubits/search_note/search_note_cubit.dart';
import 'models/note_model.dart';

void main() async {
  Bloc.observer = SimpleBlocObserver();
  await Hive.initFlutter();
  Hive.registerAdapter(NoteModelAdapter());
  await Hive.openBox<NoteModel>("Notes");
  runApp(const NoteApp());
}

class NoteApp extends StatelessWidget {
  const NoteApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Sizer(builder: (context, orientation, deviceType) {
      return MultiBlocProvider(
        providers: [
          BlocProvider<AddNoteCubit>(create: (context) => AddNoteCubit()),
          BlocProvider<GetNotesCubit>(create: (context) => GetNotesCubit()),
          BlocProvider<SearchNoteCubit>(create: (context) => SearchNoteCubit())
        ],
        child: MaterialApp(
          title: 'Note Taking App',
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            brightness: Brightness.dark,
            textSelectionTheme: TextSelectionThemeData(
              cursorColor: Colors.white,
              selectionColor: Colors.white.withValues(alpha: 0.3),
              selectionHandleColor: Colors.white,
            ),
          ),
          home: HomeView(),
          routes: {
            '/home': (context) => const HomeView(),
            '/noteDetails': (context) => const NoteDetailsView(),
            '/search': (context) => const SearchView(),
          },
        ),
      );
    });
  }
}
