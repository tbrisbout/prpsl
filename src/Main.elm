module Main exposing (main)

import Browser
import Html exposing (Html, div, h1, section, p, text)
import Html.Attributes exposing (style)
import Content exposing (titleText, signatureText, firstParagraph, secondParagraph, lastParagragh)

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

view model =
  div mainStyles
    [ h1 h1Styles [ text titleText ]
    , section contentStyles
      [ p [] [text firstParagraph]
      , p [] [text secondParagraph]
      , p [] [text lastParagragh]
      ]
    , section signatureStyle
      [ text signatureText ]
    ]
