Class employee.EmployeeService Extends %RegisteredObject
{

Method Process(input As employee.dto.EmployeeInput)
{
        If ##class(employee.EmployeeRepository).Exist(input.EmployeeNumber) {
            Write "=======================", !
            Write "Employee Already Exist!", !
            Write "=======================", !
            Do ##class(employee.EmployeeRepository).ShowData(input.EmployeeNumber)
        } Else {
            Do ##class(employee.EmployeeRepository).Save(input)
        }
}

Method Create(input As employee.dto.EmployeeInput)
{
    Do ##class(employee.EmployeeRepository).Save(input)
}

}
