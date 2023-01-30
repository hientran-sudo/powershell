param ([string]$dir="c:\temp")
function Get-Dir($dir){
    $result = Get-ChildItem $dir -Recurse | Measure-Object -Property Length -Sum
    return [math]::round(($result).sum/1GB,2)
}
Get-Dir $dir

