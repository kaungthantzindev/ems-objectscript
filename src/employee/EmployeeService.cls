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
        Do ..ShowData(input.EmployeeNumber)
        Write !, "❌ Failed to save employee!", !
        Quit
    }

    If ..validator.Validate(input) {
        Do ..employeeRepository.Save(input)
        Write !, "✅ Employee registered successfully!", !
    } Else {
        Write !, "❌ Failed to save employee!", !
    }
}

Method Delete(id As %Integer)
{
    If '..employeeRepository.Exist(id) {
        Write "❌ Unregistered data",!
        Quit
    }

    Do ..employeeRepository.Delete(id)
    Write !,"✅ Employee ", id, " Successfully deleted!", !
}

Method ShowData(id As %Integer)
{
    If '..employeeRepository.Exist(id) {
        Write "❌ Unregistered data"
        Quit
    }

    Set employee = ..employeeRepository.FindOne(id)
    Write !, "社員番号 ＝ ", employee.EmployeeNumber , !
    Write "氏名漢字 ＝ ", employee.KanjiName, !
    Write "氏名カナ ＝ ", employee.KanaName, !
    Write "住　　所 ＝ ", employee.Address, !
}

}
