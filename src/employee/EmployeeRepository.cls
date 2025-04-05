Class employee.EmployeeRepository
{

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

ClassMethod Save(input As employee.dto.EmployeeInput)
{
       Set ^Employee(input.EmployeeNumber, "empNumber") = input.EmployeeNumber
       Set ^Employee(input.EmployeeNumber, "empKanjiName") = input.KanjiName
       Set ^Employee(input.EmployeeNumber, "empKanaName") = input.KanaName
       Set ^Employee(input.EmployeeNumber, "empAddress") = input.Address
}

}
