module Calculator where


import CalculatorModel (..)
import CalculatorView (..)
import Signal (foldp, map2, mergeMany)
import Window


lastButtonClicked =
    mergeMany [
        button0Signal,
        button1Signal,
        button2Signal,
        button3Signal,
        button4Signal,
        button5Signal,
        button6Signal,
        button7Signal,
        button8Signal,
        button9Signal,
        buttonEqSignal,
        buttonPlusSignal,
        buttonMinusSignal,
        buttonDivSignal,
        buttonMultSignal,
        buttonDotSignal,
        buttonCSignal,
        buttonCESignal
    ]


stateSignal = foldp step initialState lastButtonClicked


main = map2 view stateSignal Window.dimensions
