
  do ->

    NodeType = { [ name, index + 1 ] for name, index in <[ ELEMENT ATTRIBUTE TEXT CDATA ENTITYREF ENTITY PI COMMENT DOCUMENT DOCTYPE FRAGMENT ]> }

    {
      NodeType
    }