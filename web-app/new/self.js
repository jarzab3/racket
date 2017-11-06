
function alrt(){

var para = document.getElementById('pa');
para.innerHTML = alert("Submited!");

}


function validate(form) {

    // validation code here ...


    if(!valid) {
        alert('Please correct your ID!');
        return false;
    }
    else {
        return confirm('Do you want to submit the form?');
    }
}



function conf() {
    document.getElementById("demo").innerHTML = "Hello World ADAM";
}
