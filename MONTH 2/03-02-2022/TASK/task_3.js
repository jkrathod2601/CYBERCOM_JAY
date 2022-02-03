let bill_pay_john = []

let n = parseInt(prompt("how many bill you pay?"))
for (let i = 0; i < n; i++) {
    bill_pay_john.push(parseInt(prompt(`enter bill pay ${i+1}`)))
}
console.log(bill_pay_john)
    // const total_tip_pay_array

const find_percnt = (bill_pay) => {
    if (bill_pay < 50) {
        return parseFloat((bill_pay * 0.2).toFixed(2))
    } else if (bill_pay > 50 && bill_pay < 200) {
        return parseFloat((bill_pay * 0.15).toFixed(2))
    } else {
        return parseFloat((bill_pay * 0.1).toFixed(2))
    }
}

const total_pay = (bill_pay) => {
    return bill_pay + find_percnt(bill_pay)
}

const tip_array = bill_pay_john.map(find_percnt)
const total_pay_array = bill_pay_john.map(total_pay)

document.getElementById("ans").innerHTML = bill_pay_john
document.getElementById("ans1").innerText = tip_array
document.getElementById("ans2").innerText = total_pay_array
console.log(tip_array)
console.log(total_pay_array)