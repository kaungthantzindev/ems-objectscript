Class employee.EmployeeService Extends %RegisteredObject
{

Method Process(input As employee.dto.EmployeeInput)
{
        Do ..Create(input)
}

Method Create(input As employee.dto.EmployeeInput)
{
    Do ##class(employee.EmployeeRepository).Save(input)
}

}
