
  do ->

    parse-xml = (content) ->

      doc = new ActiveXObject 'MSXML2.DomDocument.6.0'

        ..async = no
        ..loadXML content

      if doc.parseError.errorCode is -1072896683
        return parse-xml "<root>#content</root>"
      else
        if doc.parseError.errorCode isnt 0

          throw new Error "#{ doc.parseError.errorCode } #{ doc.parseError.reason }"

      doc.documentElement

    #

    parse-html = (content) ->

      html-file = new ActiveXObject 'htmlfile'

        # ..write '<meta http-equiv="X-UA-Compatible" content="IE=9">'
        ..write content
        return ..documentElement

    {
      parse-xml, parse-html
    }