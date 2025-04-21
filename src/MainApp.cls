Class MainApp.App
{

ClassMethod Run()
{
    Write #
    Write "=========================="
    Write !!, "＊＊＊社員登録PG＊＊＊", !!!

    Do ##class(employee.EmployeeController).Start()
}

}
