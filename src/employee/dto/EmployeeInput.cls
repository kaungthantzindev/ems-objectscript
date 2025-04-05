Class employee.dto.EmployeeInput Extends %RegisteredObject
{

Property EmployeeNumber As %String;

Property KanjiName As %String;

Property KanaName As %String;

Property Address As %String;

Method Prompt()
{
    Read "Employee Number : ", empNumber, !
    Set ..EmployeeNumber = empNumber

    Read "KanjiName : ", empKanjiName, !
    Set ..KanjiName = empKanjiName

    Read "KanaName : ", empKanaName, !
    Set ..KanaName = empKanaName

    Read "Address : ", empAddress, !
    Set ..Address = empAddress
}

}
