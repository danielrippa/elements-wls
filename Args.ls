
  do ->

    WScript.Arguments.Unnamed

      argc = ..Count
      argv = [ (..Item index) for index til argc ]

    {
      argc, argv
    }