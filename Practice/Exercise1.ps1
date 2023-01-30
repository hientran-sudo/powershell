param([string]$source="c:\src", [string]$destination="c:\organized")

function CheckFolder ([string]$var) {
    $result = Test-Path -Path $var
    switch ($result){
        true {
            # $name = Get-ChildItem -Path $var -Directory | select Name
            $count = (Get-ChildItem $var | Measure-Object).Count;
            # $size = Get-ChildItem $var -Recurse | Measure-Object 
            return $count
            break
        }
        false {
            New-Item -Path $var -ItemType Directory;
            break
        }
    }

}

CheckFolder($source)
CheckFolder($destination)
Copy-Item -Path $source  -Filter *.txt -Recurse -Destination $destination\txt
Get-ChildItem $destination 
