{ 
  # TODO - The following is an ugly way to preserve spacing 
  gsub("Running", "\033[32mRunning\033[0m")
  gsub("Completed", "\033[32mCompleted\033[0m")
  gsub("Failed", "\033[31mFailed\033[0m")
  gsub("Pending", "\033[33mPending\033[0m")
  print $0
}
