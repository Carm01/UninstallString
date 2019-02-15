#RequireAdmin
#Region ;**** Directives created by AutoIt3Wrapper_GUI ****
#AutoIt3Wrapper_Icon=..\Documents\Project\Java\Oxygen-Icons.org-Oxygen-Actions-trash-empty.ico
#AutoIt3Wrapper_Outfile_x64=Uninstaller1.exe
#AutoIt3Wrapper_Compression=4
#AutoIt3Wrapper_UseUpx=y
#AutoIt3Wrapper_UseX64=y
#AutoIt3Wrapper_Res_Comment=Keeps Java development platforms and 'Javascript'
#AutoIt3Wrapper_Res_Description=Uninstalls Java
#AutoIt3Wrapper_Res_Fileversion=1.3.0.0
#AutoIt3Wrapper_Res_ProductVersion=1.3.0.0
#AutoIt3Wrapper_Res_LegalCopyright=carm0@sourceforge
#AutoIt3Wrapper_Res_Language=1033
#EndRegion ;**** Directives created by AutoIt3Wrapper_GUI ****

#include <array.au3>
Global $sBase_x32 = "HKEY_LOCAL_MACHINE\SOFTWARE\WOW6432Node\Microsoft\Windows\CurrentVersion\Uninstall\"
Global $sBase_x64 = "HKLM64\SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall\"
Global $sSearch = 'cyber'
;SplashTextOn("Progress", "", 220, 60, -1, -1, 16, "Tahoma", 10)



Call('u')
Call('z')
Exit

Func U()
	$iEval = 1
	While 1
		$sUninst = ""
		$sDisplay = ""
		$sCurrent = RegEnumKey($sBase_x32, $iEval)
		If @error Then ExitLoop
		$sKey = $sBase_x32 & $sCurrent
		$sDisplay = RegRead($sKey, "DisplayName")
		; $aArray = StringRegExp($sDisplay, '(?i)Java (\b\d+\b) Update (\b\d+\b)', $STR_REGEXPARRAYGLOBALMATCH)
		$aArray = StringRegExp($sDisplay, '(?i)' & $sSearch, $STR_REGEXPARRAYGLOBALMATCH)
		If @error = 0 Then
			$sQuiet = RegRead($sKey, "QuietUninstallString")
			MsgBox(0, "32bit", $sDisplay & @CRLF & $sKey)
			;$sUninst1 = StringSplit(RegRead($sKey, "UninstallString"), "/X", 1)
			;$sUninst = $sUninst1[1] & ' /QN' & ' /X' & $sUninst1[2]
			;ControlSetText("Progress", "", "Static1", "Uninstalling " & $sDisplay, 2)
			;RunWait($sUninst)
			;Call('u')
		EndIf
		$iEval += 1
	WEnd
EndFunc   ;==>U

Func z()
	$iEval = 1
	While 1
		$sUninst = ""
		$sDisplay = ""
		$sCurrent = RegEnumKey($sBase_x64, $iEval)
		If @error Then ExitLoop
		$sKey = $sBase_x64 & $sCurrent
		$sDisplay1 = RegRead($sKey, "DisplayName")
		; $aArray = StringRegExp($sDisplay1, '(?i)Java (\b\d+\b) Update (\b\d+\b)', $STR_REGEXPARRAYGLOBALMATCH)
		$aArray = StringRegExp($sDisplay1, '(?i)' & $sSearch, $STR_REGEXPARRAYGLOBALMATCH)
		If @error = 0 Then
			$sQuiet = RegRead($sKey, "QuietUninstallString")
			MsgBox(0, "64bit", $sDisplay1 & @CRLF & $sKey)
			;$sUninst1 = StringSplit(RegRead($sKey, "UninstallString"), "/X", 1)
			;$sUninst = $sUninst1[1] & ' /QN' & ' /X' & $sUninst1[2]
			;ControlSetText("Progress", "", "Static1", "Uninstalling " & $sDisplay1, 2)
			;RunWait($sUninst)
			;Call('z')
		EndIf
		$iEval += 1
	WEnd
EndFunc   ;==>z

