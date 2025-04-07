Class employee.dto.EmployeeInput Extends %RegisteredObject
{

Property EmployeeNumber As %Integer(MAXVAL = 999, MINVAL = 0) [ Required ];

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
    If fieldName = "EmployeeNumber" {
        Read "1", ?4, "社員番号 ＝ ", value, !
        Set ..EmployeeNumber = value
    }
    ElseIf fieldName = "KanjiName" {
        Read "2", ?4, "氏名漢字 ＝ ", value, !
        Set ..KanjiName = value
    }
    ElseIf fieldName = "KanaName" {
        Read "3", ?4, "氏名カナ ＝ ", value, !
        Set ..KanaName = value
    }
    ElseIf fieldName = "Address" {
        Read "4", ?4, "住　　所 ＝ ", value, !
        Set ..Address = value
    }
}

Method Prompt()
{
    Write #
    Write "=========================="
    Write !!, "＊＊＊社員登録PG＊＊＊", !!!

    Set fields = ..GetFieldList()
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
