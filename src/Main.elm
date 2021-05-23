module Main exposing (..)

import Browser
import Html exposing (..)
import Html.Events exposing (onClick)
import Html.Attributes exposing (placeholder)
import Html.Attributes exposing (value)
import Html.Events exposing (onInput)

main = Browser.sandbox { init = init, update = update, view = view }

type alias Model  =
    { name : String
    , count : Int
    }

init : Model
init = { name = "", count = 0 }

type Msg = Name String | Increment

update : Msg -> Model -> Model
update msg model =
    case msg of
        Name name ->
            { model | name = name }

        Increment ->
            { model | count = model.count + 1 }

view : Model -> Html Msg
view model = 
    div []
        [ input [ placeholder "Type your name", value model.name, onInput Name ] []
            , div [] [ text ( model.name ++ (String.fromInt model.count)) ]
            , button [ onClick Increment ] [ text "+" ]
        ]
