Class employee.EmployeeController Extends %RegisteredObject
{

ClassMethod Start()
{
    Set input = ##class(employee.dto.EmployeeInput).%New()
    Set employeeService = ##class(employee.EmployeeService).%New()
    Do input.Prompt()
    Do input.%ValidateObject()
    Set status = input.%ValidateObject()
    If $$$ISERR(status) {
        Do $SYSTEM.Status.DisplayError(status)
        Quit
    }
    Do employeeService.Process(input)
}

}
