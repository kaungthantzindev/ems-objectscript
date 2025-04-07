Class employee.EmployeeController Extends %RegisteredObject
{

ClassMethod Start()
{
    Set employeeService = ##class(employee.EmployeeService).%New()
    Set input = ##class(employee.dto.EmployeeInput).%New()
    Set state = 1

    While (state) {
        Do input.Prompt()

        If input.OperationKey = "@" {
            Do employeeService.Create(input)
        }
        ElseIf input.OperationKey = "DEL" {
            Do employeeService.Delete(input.EmployeeNumber)
        }
        ElseIf input.OperationKey = "$" {
            Set state = 0
            Write !!, "👋 Exiting program.", !
        }
        Else {
            Write "⚠️ Unknown operation key.", !
            Do input.AskOperationKey()
        }
    }
}

}
