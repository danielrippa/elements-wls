
  { argc, argv } = dependency 'Args'
  { fs, get-extension, get-content, file-exists } = dependency 'FileSystem'
  { parse-xml, parse-html } = dependency 'Parser'
  { traverse-nodes } = dependency 'NodeWalker'

  if argc > 0

    filepath = argv.0

    if file-exists filepath

      content = get-content filepath

      is-html = switch get-extension filepath .to-lower-case!

        | 'htm', 'html' => yes

        else no

      traverse-nodes (parse-xml content), 0, is-html