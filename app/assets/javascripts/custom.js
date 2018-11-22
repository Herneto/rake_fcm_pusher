
function load(input) {
    $('#submit').removeAttr('disabled'); 
    var fileExtension = /text.csv/; 
    var fileTobeRead = input.files[0];
    var fileContents = document.getElementById('text'); 

    if (fileTobeRead.type.match(fileExtension)) { 
        var fileReader = new FileReader(); 
        fileReader.onload = function (e) {             
            fileContents.innerText = fileReader.result; 
        } 
        fileReader.readAsText(fileTobeRead); 
    } 
    else { 
        fileContents.innerText = "Selecione um arquivo csv!"
    }
}