
  do ->

    render-html-element = (element, level) ->

      rendered = yes

      switch element.node-name.to-lower-case!

        | 'something' =>

        else

          rendered = no

      rendered

    {
      render-html-element
    }
