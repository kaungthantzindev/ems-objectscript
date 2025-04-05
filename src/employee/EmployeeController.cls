Class employee.EmployeeController Extends %RegisteredObject
{

ClassMethod Start()
{
    Set input = ##class(employee.dto.EmployeeInput).%New()
    Set employeeService = ##class(employee.EmployeeService).%New()
    Do input.Prompt()
    Do employeeService.Process(input)
}

}
