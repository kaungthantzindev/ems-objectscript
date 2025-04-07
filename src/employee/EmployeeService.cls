Class employee.EmployeeService Extends %RegisteredObject
{

Property employeeRepository As employee.EmployeeRepository [ InitialExpression = {##class(employee.EmployeeRepository).%New()}, Private ];

Property validator As utils.Validator [ InitialExpression = {##class(utils.Validator).%New()}, Private ];

Method Create(input As employee.dto.EmployeeInput)
{
    If ..employeeRepository.Exist(input.EmployeeNumber) {
        Write ! ,"=======================", !
        Write "Employee Already Exist!", !
        Write "=======================", !
        Do ..employeeRepository.ShowData(input.EmployeeNumber)
        Write !, "❌ Failed to save employee!", !
        Quit
    }

    If ..validator.Validate(input) {
        Do ..employeeRepository.Save(input)
        Write !, "✅ Success!", !
    } Else {
        Write !, "❌ Failed to save employee!", !
    }
}

Method Delete(id As %Integer)
{
    If '..employeeRepository.Exist(id) {
        Write "❌ Employee Not Found!"
        Quit
    }

    Do ..employeeRepository.Delete(id)
    Write !, "✅ Successfully deleted!", !
}

}
