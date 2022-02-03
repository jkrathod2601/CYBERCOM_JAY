// define mass of both
const mass_mark = 70
const mass_john = 80
    // define height of both
const height_mark = 1.5
const height_john = 1.3
    //define mark's bmi is grater then john 
let mark_grater_john = true
    //define BMi calculating function
const findbmi = (mass, height) => {
        return parseFloat((mass / (height ** 2)).toFixed(2))
    }
    //find bmi for both
const bmi_mark = findbmi(mass_mark, height_mark)
const bmi_john = findbmi(mass_john, height_john)

//if john's bmi is grater or equal to mark then flase the
if (bmi_mark <= bmi_john) {
    mark_grater_john = false
}

//print the result
document.getElementById("ans").innerText = (`is mark's BMI is higher then john ? ${mark_grater_john}`)