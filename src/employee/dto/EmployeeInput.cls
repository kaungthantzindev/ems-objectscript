Class employee.dto.EmployeeInput Extends %RegisteredObject
{

Property employeeRepository As employee.EmployeeRepository [ InitialExpression = {##class(employee.EmployeeRepository).%New()}, Private ];

Property EmployeeNumber As %Integer;

Property KanjiName As %String;

Property KanaName As %String;

Property Address As %String;

Property OperationKey As %String;

Method GetFieldList() As %ListOfDataTypes
{
    Set fields = $LISTBUILD("EmployeeNumber", "KanjiName", "KanaName", "Address")
    Quit fields
}

Method InputField(fieldName As %String)
{
    While (1) {
        If fieldName = "EmployeeNumber" {
            Read ?4, "1. 社員番号 ＝ ", value, !
            If ('##class(utils.Validator).IsValidEmpNumber(value)){
                Write "❌ Invalid Employee Number!", !
            } Else {
                Set ..EmployeeNumber = value
                Quit
            }
        }

        ElseIf fieldName = "KanjiName" {
            Read ?4, "2. 氏名漢字 ＝ ", value, !
            If ('##class(utils.Validator).IsZenkaku(value)) {
                Write "❌ Kanji Name must be Zenkaku characters!", !
            } Else {
                Set ..KanjiName = value
                Quit
            }
        }

        ElseIf fieldName = "KanaName" {
            Read ?4, "3. 氏名漢字 ＝ ", value, !
            If ('##class(utils.Validator).IsHankaku(value)) {
                Write "❌ Kana Name must be Hankaku characters!", !
            } Else {
                Set ..KanaName = value
                Quit
            }
        }

        ElseIf fieldName = "Address" {
            Read ?4, "4. 氏名漢字 ＝ ", value, !
            If ('##class(utils.Validator).IsZenkaku(value)) {
                Write "❌ Address must be Zenkaku characters!", !
            } Else {
                Set ..Address = value
                Quit
            }
        }
    }
}

Method Prompt()
{
    // First: Prompt for EmployeeNumber
    Do ..InputField("EmployeeNumber")

    // Check if EmployeeNumber already exists
    If ..employeeRepository.Exist(..EmployeeNumber) {
        // Fetch and load existing data
        Set existingData = ..employeeRepository.FindOne(..EmployeeNumber)
        Set ..KanjiName = existingData.KanjiName
        Set ..KanaName = existingData.KanaName
        Set ..Address = existingData.Address

        Write !,"✅ Employee Found!",!
        Write ?4, "1. 社員番号 ＝ ", ..EmployeeNumber, !
        Write ?4, "2. 氏名漢字 ＝ ", ..KanjiName, !
        Write ?4, "3. 氏名カナ ＝ ", ..KanaName, !
        Write ?4, "4. 住　　所 ＝ ", ..Address, !
        Quit  ; Skip further prompting
    }

    #; Set fields = ..GetFieldList()
    Set fields = $LISTBUILD("KanjiName", "KanaName", "Address")
    For i=1:1:$LISTLENGTH(fields) {
        Set fieldName = $LISTGET(fields, i)
        Do ..InputField(fieldName)
    }
}

Method AskOperationKey()
{
    Read !, "<@:登録 DEL:削除 /:一行上げる //:社員番号へ $:終了 行番号> = ", opKey, !!
    Set ..OperationKey = opKey
}

}
