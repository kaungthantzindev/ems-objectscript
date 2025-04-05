Class employee.EmployeeService Extends %RegisteredObject
{

Property employeeRepository As employee.EmployeeRepository [ Private ];

Method %OnNew() As %Status
{
        Set ..employeeRepository = ##class(employee.EmployeeRepository).%New()

        Quit $$$OK
}

Method Process(input As employee.dto.EmployeeInput)
{
        If ..employeeRepository.Exist(input.EmployeeNumber) {
            Write "=======================", !
            Write "Employee Already Exist!", !
            Write "=======================", !
            Do ..employeeRepository.ShowData(input.EmployeeNumber)
            Quit
        } 

        Do ..employeeRepository.Save(input)
}

Method Create(input As employee.dto.EmployeeInput)
{
    Do ..employeeRepository.Save(input)
}

}
