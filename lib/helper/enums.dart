enum EditNote {
  editNoteView,
  editSubNoteView,
}

//this enum is used to define the source of reminder
//to add/remover from list baces on it
enum ReminderSource {
  soonReminders,
  futureReminders,
  passedReminders,
}

//this enum is used to define the type of search
//baces on it the search method call the right box
enum SearchType {
  notes,
  folders,
  tasks,
  reminders,
}
