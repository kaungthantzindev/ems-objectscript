Class employee.EmployeeRepository
{

ClassMethod Exist(id As %String) As %Boolean
{
    If $DATA(^Employee(id)) {
        Quit 1
    } Else {
        Quit 0
    }
}

ClassMethod FindOne(id As %String) As employee.dto.EmployeeInput
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

ClassMethod ShowData(id As %String)
{
    Set employee = ..FindOne(id)
    Write "Employee Number = ", employee.EmployeeNumber , !
    Write "KanjiName = ", employee.KanjiName, !
    Write "KanaName = ", employee.KanaName, !
    Write "Address = ", employee.Address, !
}

ClassMethod Save(input As employee.dto.EmployeeInput)
{
       Set ^Employee(input.EmployeeNumber, "empNumber") = input.EmployeeNumber
       Set ^Employee(input.EmployeeNumber, "empKanjiName") = input.KanjiName
       Set ^Employee(input.EmployeeNumber, "empKanaName") = input.KanaName
       Set ^Employee(input.EmployeeNumber, "empAddress") = input.Address
}

ClassMethod Delete(id As %String)
{
    Kill ^Employee(id)
}

}
