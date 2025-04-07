Class employee.EmployeeController Extends %RegisteredObject
{

ClassMethod Start()
{
    Set employeeService = ##class(employee.EmployeeService).%New()
    Set input = ##class(employee.dto.EmployeeInput).%New()
    Set state = 1

    While (state) {
        Do input.Prompt()

        Set fields = input.GetFieldList()
        Set currentPosition = $LISTLENGTH(fields) + 1

        While (1) {
            Do input.AskOperationKey()

            If input.OperationKey = "@" {
                Do employeeService.Create(input)
                Quit  // Exit navigation loop, back to state loop
            }
            ElseIf input.OperationKey = "DEL" {
                Do employeeService.Delete(input.EmployeeNumber)
                Quit
            }
            ElseIf input.OperationKey = "$" {
                Set state = 0
                Write !!, "👋 Bye!", !
                Quit
            }
            ElseIf input.OperationKey = "/" {
                Do ##class(utils.Helpers).HandleMoveUp(fields, .currentPosition, input)
            }
            ElseIf input.OperationKey = "//" {
                Do ##class(utils.Helpers).HandleMoveToStart(fields, .currentPosition, input)
            }
            Else {
                Write "⚠️ Unknown operation key!", !
            }
        }
    }
}

}
