
  do ->

    fs = new ActiveXObject 'Scripting.FileSystemObject'

    get-extension = -> fs.GetExtensionName it

    get-content = (filepath) ->

      file = fs.OpenTextFile filepath, 1

        content = ..ReadAll!
        ..Close!

      content

    file-exists = -> fs.FileExists it

    {
      fs,
      get-extension,
      get-content,
      file-exists
    }