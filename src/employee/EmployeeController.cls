Class employee.EmployeeController Extends %RegisteredObject
{

ClassMethod Start()
{
    Set input = ##class(employee.dto.EmployeeInput).%New()
    Set employeeService = ##class(employee.EmployeeService).%New()
    Set state = 1
    While (state) {
        Do input.Prompt()
        Set status = input.%ValidateObject()
        If $$$ISERR(status) {
            Do $SYSTEM.Status.DisplayError(status)
            Quit
        }
        If input.OperationKey = "@" {
            Do employeeService.Create(input)
        } ElseIf input.OperationKey = "DEL" {
            Do employeeService.Delete(input.EmployeeNumber)
        } ElseIf input.OperationKey = "$" {
            Set state = 0
            Quit
        }
    }
}

}
