$slideNames = 'ps-basics'

$arguments = @{
    FilePath = 'docker'
    ArgumentList = "build -t $slideNames ."
    Wait = $true
    NoNewWindow = $true
}
Start-Process @arguments
Start-Process -FilePath 'http://localhost:3030/'

$arguments.ArgumentList = "run --name $slideNames --rm -it -p 3030:3030 $slideNames"
Start-Process @arguments
