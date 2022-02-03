let john_team_score = [89, 120, 103]
let mike_team_score = [116, 94, 123]

const find_avg_score = (score) => {
    let sum = 0
    for (let i of score) {
        sum = sum + i
    }
    return (sum / score.length)
}

let avg_john = find_avg_score(john_team_score)
let avg_mike = find_avg_score(mike_team_score)

if (avg_john > avg_mike) {
    document.getElementById("ans").innerText = "winner is john"
} else if (avg_john < avg_mike) {
    document.getElementById("ans").innerText = "winner is mike"
} else {
    document.getElementById("ans").innerText = "match is tie"
}

//extra task
let mary_team_score = [97, 134, 105]
let avg_mary = find_avg_score(mary_team_score)

if (avg_mary > avg_mike && avg_mary > avg_john) {
    document.getElementById("ans2").innerText = "mary is winner"
} else if (avg_mike > avg_mary && avg_mik > avg_john) {
    document.getElementById("ans").innerText = "mike  is winner"
} else if (avg_john > avg_mary && avg_john > avg_mike) {
    document.getElementById("ans").innerText = "john is winner"
} else {
    document.getElementById("ans").innerText = "match is tie"
}