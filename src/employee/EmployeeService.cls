Class employee.EmployeeService Extends %RegisteredObject
{

Property employeeRepository As employee.EmployeeRepository [ Private ];

Property validator As utils.Validator [ Private ];

Method %OnNew() As %Status
{
        Set ..employeeRepository = ##class(employee.EmployeeRepository).%New()
        Set ..validator = ##class(utils.Validator).%New()

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

        If ..validator.Validate(input) {
            Do ..employeeRepository.Save(input)
        } Else {
            Write "Validation Failed", !
        }
}

Method Create(input As employee.dto.EmployeeInput)
{
    Do ..employeeRepository.Save(input)
}

}
