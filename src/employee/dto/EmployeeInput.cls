Class employee.dto.EmployeeInput Extends %RegisteredObject
{

Property EmployeeNumber As %Integer(MAXVAL = 999, MINVAL = 0) [ Required ];

Property KanjiName As %String;

Property KanaName As %String;

Property Address As %String;

Method Prompt()
{
    Write #
    Write !!, "＊＊＊社員登録PG＊＊＊", !!
    Read "1", ?4,"社員番号 ＝ ", empNumber, !
    Set ..EmployeeNumber = empNumber

    Read "2", ?4, "氏名漢字 ＝ ", empKanjiName, !
    Set ..KanjiName = empKanjiName

    Read "3" , ?4,"氏名カナ ＝ ", empKanaName, !
    Set ..KanaName = empKanaName

    Read "4", ?4,"住　　所 ＝ ", empAddress, !
    Set ..Address = empAddress
}

}
