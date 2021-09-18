module Main exposing (main)

import Browser
import Html exposing (Html, div, h1, section, p, text)
import Html.Attributes

s = Html.Attributes.style


main =
  Browser.sandbox { init = 0, update = update, view = view }

type Msg = Increment | Decrement

update msg model =
  case msg of
    Increment ->
      model + 1

    Decrement ->
      model - 1

bodyStyles =
  [ s "height" "100vh"
  , s "width" "90%"
  , s "margin" "0 auto"
  , s "display" "flex"
  , s "flex-direction" "column"
  , s "align-items" "stretch"
  , s "font-family" "Cardo, serif"
  , s "font-size" "22px"
  ]

h1Styles =
  [ s "font-family" "'Birthstone Bounce', cursive"
  , s "font-size" "2.5em"
  , s "font-weight" "400"
  ]

letterStyle =
  [ s "width" "100%"
  , s "flex" "1"
  , s "text-align" "justify"
  ]

signatureStyle =
  [ s "flex" "1"
  , s "align-self" "flex-end"
  , s "font-family" "'Birthstone Bounce', cursive"
  , s "font-size" "2em"
  , s "font-weight" "400"
  ]

view model =
  div bodyStyles
    [ h1 h1Styles [ text "Title" ]
    , section letterStyle
      [ p [] [text first]
      , p [] [text second]
      , p [] [text last]
      ]
    , section signatureStyle
      [ text "The end." ]
    ]


first = """
test
"""

second = """
test2
"""

last = """
test3
"""

