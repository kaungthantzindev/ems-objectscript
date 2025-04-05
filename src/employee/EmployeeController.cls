Class employee.EmployeeController Extends %RegisteredObject
{

ClassMethod Start()
{
    Set input = ##class(employee.dto.EmployeeInput).%New()
    Do input.Prompt()
    Write !, input.EmployeeNumber
}

}
