Class employee.dto.EmployeeInput Extends %RegisteredObject
{

Property EmployeeNumber As %Integer(MAXVAL = 999, MINVAL = 0) [ Required ];

Property KanjiName As %String;

Property KanaName As %String;

Property Address As %String;

Property OperationKey As %String;

Method Prompt()
{
    Write #
    Write "=========================="
    Write !!, "＊＊＊社員登録PG＊＊＊", !!!
    Read "1", ?4,"社員番号 ＝ ", empNumber, !
    Set ..EmployeeNumber = empNumber

    Read "2", ?4, "氏名漢字 ＝ ", empKanjiName, !
    Set ..KanjiName = empKanjiName

    Read "3" , ?4,"氏名カナ ＝ ", empKanaName, !
    Set ..KanaName = empKanaName

    Read "4", ?4,"住　　所 ＝ ", empAddress, !
    Set ..Address = empAddress

    Read !, "<@:登録 DEL:削除 /:一行上げる //:社員番号へ $:終了 行番号> = ", operationKey, !
    Set ..OperationKey = operationKey
    Write !!
}

}
