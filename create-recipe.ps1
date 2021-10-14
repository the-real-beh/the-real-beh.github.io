
function outhost {
    param (
        [string]$text,
        [System.ConsoleColor]$color = [System.ConsoleColor]::White
    )
    Write-Host "$text" -ForegroundColor $color 
}



$table = "<table>"
$list = "<ol>"
$int = 1
$title = Read-Host "TITEL?"
$id = $title.Replace(" ", "").ToLower()

$h2 = "<h2 id=""$id"" class=""display-4"">
$title
</h2>"

$nav = "<li>
<a href=""#$id"">$title</a>
</li>"

Do {

    outhost -text "=================================="
    outhost -text "[Z]utaten"
    outhost -text "[A]nweisung"
    outhost -text ""
    outhost -text "[E]nde"
    outhost -text ""
    $q = (Read-Host "Was soll getan werden?").ToUpper()

    If ($q -eq "Z") {
        do {
            outhost -text "=================================="
    
            outhost -text "Stück?"
            $stk = Read-Host
            $table += "<tr><td>$stk</td>"
            outhost -text "Zutat?"
            $zut = Read-Host
            $table += "<td>$zut</td></tr>"
    
            outhost -text "=================================="
            outhost -text "Weiter? [J]a  [N]ein"
    
            $j = (Read-Host).ToUpper()
            If ($j -eq "J") {
                continue
            }
            elseif ($j -eq "N") {
                break
            }
    
    
        }While ($true)
    }
    elseif ($q -eq "A") {
        
        do {
            outhost -text "=================================="
    
            outhost -text "Was ist zu tun? $int"
            $stk = Read-Host
            $list += "<li>$stk</li>"
            outhost -text "=================================="
            outhost -text "Weiter? [J]a  [N]ein"
    
            $j = (Read-Host).ToUpper()
            If ($j -eq "J") {
                continue
            }
            elseif ($j -eq "N") {
                break
            }
            $int++
    
        }While ($true)
    }
    elseif ($q -eq "E") {
        $table += "</table>"
        $hr = "<hr />"
        $list += "</ol>"
        break
    }
    Else {
        continue
    }


}While ($true)

$html = $h2 + $table + $hr + $list

Write-Host ""
Write-Host ""
$nav

$html | Out-File "C:\Users\there\projects\recipes\the-real-beh.github.io\ps1_recipes\$title.html"
