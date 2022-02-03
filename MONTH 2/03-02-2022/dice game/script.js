let p1_score = 0
let p2_score = 0
let active_player = 1
let score_array = []

const rolldice = () => {
    let score = Math.floor((Math.random() * 6)) + 1
    document.getElementById("dice").src = `dice-${score}.png`

    if (score == 1) {
        score_array = []
        hold()
    } else {
        score_array.push(score)
        if (active_player == 1) {
            document.getElementById("current--0").innerText = sum(score_array)
        } else {
            document.getElementById("current--1").innerText = sum(score_array)
        }
    }
}

const hold = () => {
    if (active_player == 1) {
        p1_score = p1_score + sum(score_array)
        if (p1_score >= 100) {
            alert("player 1 win")
            startfrombottom()
        }
        document.getElementById("score--0").innerText = p1_score
        score_array = []
        active_player = 2
        document.getElementById("current--0").innerText = 0
        document.getElementById("name--1").innerText = "PLAYER 2*"
        document.getElementById("name--0").innerText = "PLAYER 1"
    } else {
        p2_score = p2_score + sum(score_array)
        if (p2_score >= 100) {
            alert("player 2 win")
            startfrombottom()
        }
        document.getElementById("score--1").innerText = p2_score
        score_array = []
        active_player = 1
        document.getElementById("current--1").innerText = 0
        document.getElementById("name--0").innerText = "PLAYER 1*"
        document.getElementById("name--1").innerText = "PLAYER 2"
    }
}

const sum = (arr) => {
    let sum_is = 0
    for (let i of arr) {
        sum_is = sum_is + i
    }
    return sum_is
}

const startfrombottom = () => {
    active_player = 1
    p1_score = 0
    p2_score = 0
    document.getElementById("current--0").innerText = 0
    document.getElementById("current--1").innerText = 0
    score_array = []
    document.getElementById("score--0").innerText = 0
    document.getElementById("score--1").innerText = 0
    document.getElementById("name--0").innerText = "PLAYER 1*"
    document.getElementById("name--1").innerText = "PLAYER 2"
}