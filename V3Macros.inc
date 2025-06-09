ROUTINE V3Macros [Type=INC]
#Define CursorPosition "^||CursorPosition($$GetLabelText(key))"
#Define ClearLeft D SetEscape("[1K")
#Define ClearRight D SetEscape("[0K")
#Define ClearDown D SetEscape("[0J")
#Define EmpDtoID "^||EmpDto($$GetLabelText(1))"
#Define RED $CHAR(27)_"[1m"_$CHAR(27)_"[31m" ##; red bold text color
#Define GREEN $CHAR(27)_"[1m"_$CHAR(27)_"[32m" ##; green bold text color
#Define BLACK $CHAR(27)_"[0m"