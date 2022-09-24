
abstract class NoteState{}
class NoteInitialState extends NoteState{}

class NoteCreateState extends NoteState{}
class NoteNoExistsState  extends NoteState{}

class DatabaseCreateState  extends NoteState{}

class InitialNoteSuccessState extends NoteState{}
class InitialNoteErrorState extends NoteState{}

class InsertNoteSuccessState extends NoteState{}
class InsertNoteErrorState extends NoteState{}

class DeleteNoteSuccessState extends NoteState{}
class DeleteNoteErrorState extends NoteState{}

class UpdateNoteSuccessState extends NoteState{}
class UpdateNoteErrorState extends NoteState{}

class GetAllNoteSuccessState extends NoteState{}
class GetAllNoteErrorState extends NoteState{}

class GetOneNoteSuccessState extends NoteState{}
class GetOneNoteErrorState extends NoteState{}