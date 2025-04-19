Class utils.Validator Extends %RegisteredObject
{

ClassMethod IsValidEmpNumber(value As %String) As %Boolean
{
    If (value'?1n.N) || (value < 0) || (value > 9999) {
        Quit 0
    }

    Quit 1
}

ClassMethod IsZenkaku(value As %String) As %Boolean
{
    If $MATCH(value, "^[一-龥ぁ-んァ-ヶー　]+$") {
        Quit 1
    }
    Quit 0
}

ClassMethod IsHankaku(value As %String) As %Boolean
{
    If $MATCH(value, "^[ｦ-ﾟ ｡-ﾟ]+$") {
        Quit 1
    }
    Quit 0
}

ClassMethod Validate(input As employee.dto.EmployeeInput) As %Boolean
{
    Set isValid = 1

    If (input.EmployeeNumber'?.N) || (input.EmployeeNumber < 0) || (input.EmployeeNumber > 9999) {
        Write "❌ Invalid Employee Number!", !
        Set isValid = 0
    }

    If '..IsZenkaku(input.KanjiName) {
        Write "❌ Kanji Name must be Zenkaku characters!", !
        Set isValid = 0
    }

    If '..IsHankaku(input.KanaName) {
        Write "❌ Kana Name must be Hankaku characters!", !
        Set isValid = 0
    }

    If '..IsZenkaku(input.Address) {
        Write "❌ Address must be Zenkaku characters!", !
        Set isValid = 0
    }

    Quit isValid
}

}
