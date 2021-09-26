module Main exposing (main)

import Browser
import Html exposing (Html, div, h1, section, p, text)
import Html.Attributes exposing (style)
import Lorem exposing (titleText, signatureText, firstParagraph, secondParagraph, lastParagragh)

main =
  Browser.sandbox { init = 0, update = update, view = view }

type Msg = Increment | Decrement

update msg model = model

-- css in elm framework :)

toStyle: List String -> Html.Attribute msg
toStyle l =
  case l of
    [prop, value] -> style prop value
    _ -> style "" "" -- it works because style omit invalid declarations

clean: String -> String
clean = String.trim >> (String.replace ";" "")

css: String -> List (Html.Attribute msg)
css = String.lines >> List.map ((String.split ":") >> (List.map clean) >> toStyle)


mainStyles = css """
  height: 100vh;
  width: 90%;
  margin: 0 auto;
  max-width: 650px;

  display: flex;
  flex-direction: column;
  align-items: stretch;

  font-family: Cardo, serif;
  font-size: 18px;
  line-height: 1.6;
  color: #444;
"""

h1Styles = css """
  font-family: 'Birthstone Bounce', cursive;
  font-size: 3em;
  font-weight: 400;
  line-height: 1.2;
"""

contentStyles = css """
  width: 100%;
  flex: 1;

  text-align: justify;
"""

signatureStyle = css """
  flex: 1;
  align-self: flex-end;

  font-family: 'Birthstone Bounce', cursive;
  font-size: 2em;
  font-weight: 400;
"""

-- joy of French
charHexMap =
  [ ("à", "\u{00E0}")
  , ("ç", "\u{00E7}")
  , ("è", "\u{00E8}")
  , ("é", "\u{00E9}")
  , ("ù", "\u{00F9}")
  ]

replaceUnicodeChar str = List.foldl (\(char, code) acc -> String.replace char code acc) str charHexMap
t = replaceUnicodeChar >> text

view model =
  div mainStyles
    [ h1 h1Styles [ text titleText ]
    , section contentStyles
      [ p [] [t firstParagraph]
      , p [] [t secondParagraph]
      , p [] [t lastParagragh]
      ]
    , section signatureStyle
      [ text signatureText ]
    ]
