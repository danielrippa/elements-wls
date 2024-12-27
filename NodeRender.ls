
  do ->

    { NodeType } = dependency 'NodeTypes'
    { render-html-element } = dependency 'HtmlElementRender'
    { indent } = dependency 'Indentation'

    #

    is-newline-char = -> it in [ '\n' '\r' '\f' ]

    #

    render-element-name = (element, level, is-html) ->

      name = element.node-name

      WScript.Echo (indent level), name

      return

      attributes = []

      WScript.Echo element.inner-html

      try for attribute in element.attributes

        { node-name, node-value } = attribute

        if node-value?

          if node-value

            attributes.push "#node-name: #node-value"

      WScript.Echo (indent level), name, attributes * ' '

    #

    render-node-name = (node, level, is-html) ->

      switch node.node-type

        | NodeType.ELEMENT => render-element-name node, level, is-html

        else

          WScript.Echo (indent level), node.node-name

    render-parent-node = (parent, level, is-html) ->

      if is-html

        if parent.node-type is NodeType.ELEMENT

          rendered = render-html-element parent, level, is-html

          return if rendered

      render-node-name parent, level, is-html

      for child-node in parent.child-nodes

        traverse-nodes child-node, level + 1, is-html

    #

    render-node-value = (node, level, is-html) ->

      value = node.node-value

      return unless value?

      WScript.Echo (indent level), value

      return

      lines = []
      line = ''

      for char in value / ''

        if is-newline-char char

          lines.push line
          line = ''

        else

          line += char

      lines.push line

      for line in lines

        WScript.Echo (indent level), line

    {
      render-node-value,
      render-parent-node
    }