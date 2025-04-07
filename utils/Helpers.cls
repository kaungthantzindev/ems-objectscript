Class utils.Helpers Extends %RegisteredObject
{

ClassMethod HandleMoveUp(fields As %ListOfDataTypes, ByRef currentPosition As %Integer, input As employee.dto.EmployeeInput)
{
    If currentPosition > 1 {
        Set currentPosition = currentPosition - 1
        Set fieldName = $LISTGET(fields, currentPosition)
        Do input.InputField(fieldName)
    } Else {
        Write "⚠️ Already at the first field!", !
    }
}

ClassMethod HandleMoveToStart(fields As %ListOfDataTypes, ByRef currentPosition As %Integer, input As employee.dto.EmployeeInput)
{
    Set currentPosition = 1
    Set fieldName = $LISTGET(fields, currentPosition)
    Do input.InputField(fieldName)
}

}
