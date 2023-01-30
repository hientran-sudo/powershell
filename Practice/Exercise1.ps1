param([string]$source = "c:\src", [string]$destination = "c:\organized")

function CheckFolder ([string]$var) {
    $result = Test-Path -Path $var
    switch ($result) {
        true {
            # $name = Get-ChildItem $var -Name
            $count = (Get-ChildItem $var | Measure-Object).Count;
            $size = Get-ChildItem $var -Recurse | Measure-Object 
            return  $count, $size
            break
        }
        false {
            New-Item -Path $var -ItemType Directory;
            break
        }
    }

}

CheckFolder($source)
# CheckFolder($destination)
#Copy-Item -Path $source  -Filter *.txt -Recurse -Destination $destination\txt
# Get-ChildItem $destination -Name
