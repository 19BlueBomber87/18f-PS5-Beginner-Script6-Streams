#Example From https://blogs.technet.microsoft.com/heyscriptingguy/2014/03/30/understanding-streams-redirection-and-write-host-in-powershell/
#This is a practical example of June Blender’s Explanation on TechNet (Scripting Guy)
#example of Write-OutPut
$BB = write-output "MarkK."
$Message = Write-OutPut "Output message"
$Message
#Example of Write-Verbose 
$Vmessage = Write-Verbose -Message "Verbose message" -Verbose
$Vmessage
#The output of $Vmessage is nothing :(#
#We need to redirect the Verbose Stream to the Output Stream
#This is achieved by inputing ‘4>&1’ in the -Verbose Parameter
$VmessageRedirectedStream = Write-Verbose -Message "Verbose message" -Verbose 4>&1
$VmessageRedirectedStream
#How redirection operators work can be found by entering ‘Help about_Redirection’
#"If you use the Write-Output cmdlet, the output messages are sent down the output stream" June
#In the article June creates the function ‘Write-Messages’ to illustrate different output being redirected
function Write-Messages
{Write-Host "STOP KILLING PUPPIES!!" -BackGroundColor Red
Write-Output "Output message"
Write-Verbose "Verbose message"
Write-Warning "Warning message"
Write-Error "Error message"
Write-Debug "Debug message"}
#I could not get Write-Debug to do anything
Write-Messages | out-file "C:\Kruse\SaveThePuppiesWithStreams.txt" -NoClobber
#The Output message is missing from the console but is written to the text file SaveThePuppiesWithStreams.txt
notepad "C:\Kruse\SaveThePuppiesWithStreams.txt"
Write-Messages *> c:\kruse\SavingThePuppiesOneNoob_At_A_Time.txt
#The redirection operation (*>) directs all streams to the file ‘SavingThePuppiesOneNoob_At_A_Time.txt’ 
notepad c:\kruse\SavingThePuppiesOneNoob_At_A_Time.txt
#!!!!!"Write-Host is not written to any stream." June “The best way to talk to the user is by using Write-Verbose. !!!!” June #I Wrote This in notepad instead of the ISE!!  It’s 3Kb in size
#Thank you TechNet, June Blender and Jeff L! 
$BB

#post
PowerShell MVP, Don Jones, says “That Write-Host kills puppies." 
Windows PowerShell inventor, Jeffrey Snover, says “That Write-Host is harmful"
"This is a Practical Example of June Blender Explanation of redirection operators on TechNet shown to me by Jeff
Thank you Jeff L.!  This was Awesome.
Notes:2018F-CNT-11-8 I couldn’t get the "debug” to work 