B4A=true
Group=Default Group
ModulesStructureVersion=1
Type=Class
Version=9.85
@EndOfDesignText@
#Region Shared Files
#CustomBuildAction: folders ready, %WINDIR%\System32\Robocopy.exe,"..\..\Shared Files" "..\Files"
'Ctrl + click to sync files: ide://run?file=%WINDIR%\System32\Robocopy.exe&args=..\..\Shared+Files&args=..\Files&FilesSync=True
#End Region

'Ctrl + click to export as zip: ide://run?File=%B4X%\Zipper.jar&Args=Project.zip

Sub Class_Globals
	Private Root As B4XView
	Private xui As XUI
	Private su As StringUtils

End Sub

Public Sub Initialize
'	B4XPages.GetManager.LogEvents = True
End Sub

'This event will be called once, before the page becomes visible.
Private Sub B4XPage_Created (Root1 As B4XView)
	Root = Root1
	Root.LoadLayout("MainPage")
End Sub

'You can see the list of page related events in the B4XPagesManager object. The event name is B4XPage.

Private Sub Button1_Click
	Private txr As TextReader
	txr.Initialize(File.OpenInput(File.DirAssets,"roma7.txt"))
'	txr.Initialize2(File.OpenInput(File.DirAssets,"roma.txt"), "ISO-8859-7")
	Private line As String
	line = txr.ReadLine

	Dim xl As XLUtils
	xl.Initialize

	Dim Workbook As XLWorkbookWriter = xl.CreateWriterBlank
	Dim sheet1 As XLSheetWriter = Workbook.CreateSheetWriterByName("Sheet1")
	
	sheet1.PutString(xl.AddressName("A1"),"id")
	sheet1.PutString(xl.AddressName("B1"),"ΕΠΩΝΥΜΟ")
	sheet1.PutString(xl.AddressName("C1"),"ΟΝΟΜΑ")
	sheet1.PutString(xl.AddressName("D1"),"ΠΑΤΡΩΝΥΜΟ")
	sheet1.PutString(xl.AddressName("E1"),"ΜΗΤΡΩΝΥΜΟ")
	sheet1.PutString(xl.AddressName("F1"),"DOB")
	sheet1.PutString(xl.AddressName("G1"),"ΤΟΠΟΣ ΓΕΝΝΗΣΗΣ")
	sheet1.PutString(xl.AddressName("H1"),"ΚΑΤΟΙΚΟΣ")
	sheet1.PutString(xl.AddressName("I1"),"ΘΕΣΗ")
	
	Dim Row1Based As Int = 1
	
'	Dim pattern As String = "(?<number>\d+)\)\s*(?<fullnames>.+?),\s*όνομα πατρός:\s*(?<father>.+?),\s*όνομα μητρός:\s*(?<mother>.+?)\s*γεν\.\s*(?<dob>\d{2}/\d{2}/\d{4})"
'	Dim pattern As String = "(?<number>\d+)\)\s+(?<surname>[Α-Ω]+)\s+(?<name>[^ ]+)\s+του\s+(?<father>[^ ]+)\s+και της\s+(?<mother>[^ ]+)\s+κάτοικος\s+(?<region>.+?)\s+οδός\s+(?<street>.+?)-(?<crime>.+)"
'	Dim pattern As String = "(?<number>\d+)\)\s+(?<surname>[^,]+?)\s+(?<name>[^,]+),\s*όνομα πατρός:\s*(?<father>[^,]+),\s*όνομα μητρός:\s*(?<mother>[^γ]+?)\s*γεν\.\s*(?<dob>[^()]+?)\s*\((?<crime>[^)]+)\)"
'	Dim pattern As String = "(?<number>\d+)\)\s+(?<surname>[^,]+?)\s+(?<name>[^,]+),\s*όνομα πατρός:\s*(?<father>[^,]+),\s*όνομα μητρός:\s*(?<mother>[^γ]+?)\s*γεν\.\s*(?<dob>\d{4})"
'	Dim pattern As String = "(?<number>\d+)\.\s+(?<surname>.+?)\s+(?<name>[^,]+?)\s+του\s+(?<father>[^,]+?)(?:\s+και της\s+(?<mother>[^,]+?))?\s+γεν\.?\s*(?<dob>\d{1,2}/\d{1,2}/\d{4}|\d{4})\s*\((?<crime>[^)]+)\)"
	Dim pattern As String = "(?<number>\d+)\)\s+(?<surname>[Α-ΩΉΈΆΊΌΎΏΪΫA-Zή-]+(?:\s+ή\s+[Α-ΩA-Z-]+)?(?:\s*-\s*[Α-ΩA-Z]+)*)\s+(?<name>[^,]+?)\s+του\s+(?<father>[^\s(]+)(?:\s+\(ή\s+[^)]+\))?\s+και της\s+(?<mother>[^,]+?),?\s*(γεν\.?\s*(?<dob>\d{1,2}[-/]\d{1,2}[-/]\d{4}|\d{4}))?(?:\s+(?:στην|στη|στο|στα|στης|στον|σε)\s+(?<birthplace>[^,]+?))?(?:,)?\s+κατ\.?\s+(?<residence>[^,]+),?\s+(?:θέση|περιοχή)\s+(?<area>.+)"
	
	Do While line <> Null	
		Dim m As Matcher = Regex.Matcher(pattern, line)
		If m.Find Then
			Row1Based = Row1Based + 1
						
#region 1
'			Dim number As String = m.Group("1")
'			Dim fullnames As String = m.Group("2").Trim
'			Dim father As String = m.Group("3").Trim
'			Dim mother As String = m.Group("4").Trim
'			Dim dob As String = m.Group("5").Trim
'
'			Dim parts() As String = Regex.Split("\s+", fullnames)
'			Dim mid As Int = parts.Length / 2
'			Dim surname As String = JoinWords(ArraySlice(parts, 0, mid))
'			Dim name As String = JoinWords(ArraySlice(parts, mid, parts.Length))

'			Log("Number: " & number)
'			Log("Surname: " & surname)
'			Log("Name: " & name)
'			Log("Father's Name: " & father)
'			Log("Mother's Name: " & mother)
'			Log("DOB: " & dob)
#end region
			
#region 2
'			Dim number As String = m.Group("1")
'			Dim surname As String = m.Group("2").Trim
'			Dim name As String = m.Group("3").Trim
'			Dim father As String = m.Group("4").Trim
'			Dim mother As String = m.Group("5").Trim
'			Dim region As String = m.Group("6").Trim
'			Dim street As String = m.Group("7").Trim
'			Dim crime As String = m.Group("8").Trim
'			
'			Log("Number: " & m.Group("1"))
'			Log("Surname: " & m.Group("2"))
'			Log("Name: " & m.Group("3"))
'			Log("Father's Name: " & m.Group("4"))
'			Log("Mother's Name: " & m.Group("5"))
'			Log("Region: " & m.Group("6"))
'			Log("Street: " & m.Group("7"))
'			Log("Crime: " & m.Group("8"))
'			Log("----------------------")
#end region
			
#region 3
'			Dim number As String = m.Group("1")
'			Dim surname As String = m.Group("2").Trim
'			Dim name As String = m.Group("3").Trim
'			Dim father As String = m.Group("4").Trim
'			Dim mother As String = m.Group("5").Trim
'			Dim dob As String = m.Group("6").Trim
'			Dim crime As String = m.Group("7").Trim
'			
'			Log("Number: " & m.Group("1"))
'			Log("Surname: " & m.Group("2"))
'			Log("Name: " & m.Group("3"))
'			Log("Father's Name: " & m.Group("4"))
'			Log("Mother's Name: " & m.Group("5"))
'			Log("DOB: " & m.Group("6"))
'			Log("Crime: " & m.Group("7"))
'			Log("----------------------")
#end region

#region 4
'			Dim number As String = m.Group("1")
'			Dim surname As String = m.Group("2").Trim
'			Dim name As String = m.Group("3").Trim
'			Dim father As String = m.Group("4").Trim
'			Dim mother As String = m.Group("5").Trim
'			Dim dob As String = m.Group("6").Trim
'			
'			Log("Number: " & m.Group("1"))
'			Log("Surname: " & m.Group("2"))
'			Log("Name: " & m.Group("3"))
'			Log("Father's Name: " & m.Group("4"))
'			Log("Mother's Name: " & m.Group("5"))
'			Log("DOB: " & m.Group("6"))
'			Log("----------------------")
#end region

#region 5
'			Dim number As String = m.Group("1")
'			Dim surname As String = m.Group("2").Trim
'			Dim name As String = m.Group("3").Trim
'			Dim father As String = m.Group("4").Trim
'			Dim mother As String = IIf(m.Group("5")<>Null,m.Group("5"),"")
'			Dim dob As String = m.Group("6").Trim
'			
'			Log("Number: " & m.Group("1"))
'			Log("Surname: " & m.Group("2"))
'			Log("Name: " & m.Group("3"))
'			Log("Father's Name: " & m.Group("4"))
'			If m.Group("5") <> Null Then Log("Mother's Name: " & m.Group("5").Trim)
'			Log("DOB: " & m.Group("6"))
'			Log("----------------------")
#end region

#region 5
			Dim number As String = m.Group("1")
			Dim surname As String = m.Group("2").Trim
			Dim name As String = m.Group("3").Trim
			Dim father As String = m.Group("4").Trim
			Dim mother As String = IIf(m.Group("5")<>Null,m.Group("5"),"")
			Dim dob As String = IIf(m.Group("6")<>Null,m.Group("6"),"")
			Dim birthplace As String = IIf(m.Group("7")<>Null,m.Group("7"),"")
			Dim residence As String = IIf(m.Group("8")<>Null,m.Group("8"),"")
			Dim region As String = IIf(m.Group("9")<>Null,m.Group("9"),"")
			Dim area As String = IIf(m.Group("10")<>Null,m.Group("10"),"")

			
'			Log("Number: " & m.Group("1"))
'			Log("Surname: " & m.Group("2"))
'			Log("Name: " & m.Group("3"))
'			Log("Father's Name: " & m.Group("4"))
'			If m.Group("5") <> Null Then Log("Mother's Name: " & m.Group("5").Trim)
'			If m.Group("6") <> Null Then Log("DOB: " & m.Group("6").Trim)
'			If m.Group("7") <> Null Then Log("Birthplace: " & m.Group("7").Trim)
'			If m.Group("8") <> Null Then Log("Residence: " & m.Group("8").Trim)
'			Log("Area: " & m.Group("9").Trim)
'			Log("Area: " & m.Group("10").Trim)
'			Log("----------------------")
#end region

			sheet1.PutNumber(xl.AddressOne("A",Row1Based),number)
			sheet1.PutString(xl.AddressOne("B",Row1Based),surname)
			sheet1.PutString(xl.AddressOne("C",Row1Based),name)
			sheet1.PutString(xl.AddressOne("D",Row1Based),father)
			sheet1.PutString(xl.AddressOne("E",Row1Based),mother)
			sheet1.PutString(xl.AddressOne("F",Row1Based),dob)
			sheet1.PutString(xl.AddressOne("G",Row1Based),residence)
			sheet1.PutString(xl.AddressOne("H",Row1Based),region)
			sheet1.PutString(xl.AddressOne("I",Row1Based),area)
		Else
			Log("No match found.")
		End If
		line = txr.ReadLine
	Loop
	
	Workbook.SaveAs(File.DirApp,"roma1.xlsx",True)
	
End Sub

Private Sub ArraySlice(arr() As String, fromIndex As Int, toIndex As Int) As List
	Dim result As List
	result.Initialize
	For i = fromIndex To toIndex - 1
		result.Add(arr(i))
	Next
	Return result
End Sub

Private Sub JoinWords(words As List) As String
	Dim sb As StringBuilder
	sb.Initialize
	For i = 0 To words.Size - 1
		If i > 0 Then sb.Append(" ")
		sb.Append(words.Get(i))
	Next
	Return sb.ToString
End Sub