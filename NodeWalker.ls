
  do ->

    { render-node-value, render-parent-node } = dependency 'NodeRender'
    { NodeType } = dependency 'NodeTypes'

    #

    traverse-nodes = (node, level, is-html) ->

      switch node.node-type

        | NodeType.ELEMENT, NodeType.DOCUMENT, NodeType.FRAGMENT =>

          # Have ChildNodes

          render-parent-node node, level, is-html

        | NodeType.TEXT, NodeType.CDATA, NodeType.COMMENT =>

          # Have NodeValue

          render-node-value node, level, is-html

    {
      traverse-nodes
    }