let john_team_score = []
let mike_team_score = []
let mary_team_score = []

let n = parseInt(prompt("enter match played for three player"))
for (let i = 0; i < n; i++) {
    john_team_score.push(parseInt(prompt("enter score of john")))
}
for (let i = 0; i < n; i++) {
    mike_team_score.push(parseInt(prompt("enter score of mike")))
}
for (let i = 0; i < n; i++) {
    mary_team_score.push(parseInt(prompt("enter score of mary")))
}
const find_avg_score = (score) => {
    let sum = 0
    for (let i of score) {
        sum = sum + i
    }
    return (sum / score.length)
}

let avg_john = find_avg_score(john_team_score)
let avg_mike = find_avg_score(mike_team_score)
let avg_mary = find_avg_score(mary_team_score)

if (avg_john > avg_mike) {
    document.getElementById("ans").innerText = "winner is john"
} else if (avg_john < avg_mike) {
    document.getElementById("ans").innerText = "winner is mike"
} else {
    document.getElementById("ans").innerText = "match is tie"
}

//extra task



if (avg_mary > avg_mike && avg_mary > avg_john) {
    document.getElementById("ans2").innerText = "mary is winner"
} else if (avg_mike > avg_mary && avg_mik > avg_john) {
    document.getElementById("ans2").innerText = "mike  is winner"
} else if (avg_john > avg_mary && avg_john > avg_mike) {
    document.getElementById("ans2").innerText = "john is winner"
} else {
    document.getElementById("ans2").innerText = "match is tie"
}