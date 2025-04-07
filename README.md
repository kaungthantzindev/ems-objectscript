## Employee Management System (EmsApp)

A straightforward terminal app built with InterSystems IRIS ObjectScript for managing employee records. Supports Japanese zenkaku and hankaku input with validation.

Features

- Register employees with employee numbers (0-999), kanji names, kana names, and addresses.
- Delete employee records by number.
- Move between fields with "/" (up) and "//" (to employee number).
- Exit using "$".

Prerequisites

- InterSystems IRIS (2022.1 or later recommended).
- VS Code with the InterSystems ObjectScript extension installed.
- Git for cloning the repository.
- Japanese IME for zenkaku (全角) and hankaku (半角) input.

Setup

1. Clone the Repository

   ```bash
   git clone https://github.com/kaungthantzindev/ems-objectscript
   ```

2. Open in VS Code

   - Launch VS Code.
   - Open the cloned folder

3. Connect to IRIS

   - In VS Code, press F1 (or Ctrl+Shift+P) and type "ObjectScript".
   - Select "InterSystems: Connect to Server".
   - Add your IRIS server details:
     - Server Name: (e.g., "localhost")
     - Port: 52773 (default web port)
     - Username/Password: Your IRIS credentials (e.g., "\_SYSTEM" / "SYS")
     - Namespace: USER
   - Save and connect.

4. Compile the Code
   - Compile all classes.
   - Ensure no errors in the Output panel.

Running the App

- Open the IRIS Terminal in VS Code:
- Check namespace (should be USER if connected correctly)
- Type in IRIS terminal:
  ```bash
  do ^EmsApp
  ```
- Enter employee data as prompted, using "@" to register, "DEL" to delete, "/" or "//" to navigate, "$" to quit.

Usage Example

```bash
USER>do ^EmsApp
==========================

＊＊＊社員登録PG＊＊＊


1   社員番号 ＝ 123
2   氏名漢字 ＝ 山田
3   氏名カナ ＝ ﾔﾏﾀﾞ ﾀﾛｳ
4   住　　所 ＝ 東京都中央区

<@:登録 DEL:削除 /:一行上げる //:社員番号へ $:終了 行番号> = @


✅ Employee registered successfully!
```
