Class employee.EmployeeRepository Extends %RegisteredObject
{

Method Exist(id As %Integer) As %Boolean
{
    If $DATA(^Employee(id)) {
        Quit 1
    } Else {
        Quit 0
    }
}

Method FindOne(id As %Integer) As employee.dto.EmployeeInput
{
    If '$DATA(^Employee(id)) {
        Return ""
    }

    Set employee = ##class(employee.dto.EmployeeInput).%New()
    Set employee.EmployeeNumber = ^Employee(id, "empNumber")
    Set employee.KanjiName = ^Employee(id, "empKanjiName")
    Set employee.KanaName = ^Employee(id, "empKanaName")
    Set employee.Address = ^Employee(id, "empAddress")
    
    Return employee
}

Method Save(input As employee.dto.EmployeeInput)
{
       Set ^Employee(input.EmployeeNumber, "empNumber") = input.EmployeeNumber
       Set ^Employee(input.EmployeeNumber, "empKanjiName") = input.KanjiName
       Set ^Employee(input.EmployeeNumber, "empKanaName") = input.KanaName
       Set ^Employee(input.EmployeeNumber, "empAddress") = input.Address
}

Method Delete(id As %Integer)
{
    Kill ^Employee(id)
}

}
