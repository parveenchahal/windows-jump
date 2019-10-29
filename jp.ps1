param(
   [string] $key
)
foreach($line in Get-Content (Get-ChildItem Env:Jump_Map).Value) {
    $a,$b = $line.split('=')
    if($key -eq $a) {
        cd $b
        break;
    }
}