const headingText = "????????? \n";

const text = `<span class="bold-text">"Greetings, traveler."</span>

A voice, neither harsh nor kind, echoes in the void, filling the space around you. As you stand at the threshold of the unknown, a figure begins to form from the shadows. It is a presence that defies description—vague yet imposing, familiar yet utterly alien. Its form flickers like a distant memory, as if it exists between the edges of time and space itself.

<span class="bold-text">"You’ve wandered far, perhaps further than you intended."</span>

The entity’s voice resonates deep within your mind, not through sound but through a sense of knowing. Its words seem to stretch and bend reality, unraveling like an ancient mystery.

<span class="bold-text">"This place... is not where you were meant to arrive, yet here you are."</span>

The being floats closer, and though you cannot see its face, you feel its gaze piercing through the very fabric of your being. There’s a sense of quiet amusement in its tone, as though it has seen countless travelers stumble into this forsaken place, each one searching for something they’ve lost or forgotten.

<span class="bold-text">"Paths diverge, choices are made, and sometimes the way forward vanishes before you. But remember, this moment—this chance encounter—was not an accident. You were meant to find me."</span>

A pause, as if the air itself is holding its breath.

<span class="bold-text">"So tell me, traveler... what is it that you seek? What is it that has brought you here, to the edge of what is known?"</span>

The entity waits, its form shifting like mist, as though it is offering you a choice—a way forward, or perhaps... a way back.
`;

let i = 0;
let j = 0;
const speed = 75; // typing speed in milliseconds

function typeHeading() {
    if (j < headingText.length) {
        document.getElementById("heading").innerHTML += headingText.charAt(j);
        j++;
        setTimeout(typeHeading, speed);
    } else {
        typeWriter();
    }
}

function typeWriter() {
    let target = document.getElementById("typing-text");
    if (i < text.length) {
        // Insert each character or chunk of HTML
        if (text.substring(i, i + 6) === '<span ') {
            let spanEnd = text.indexOf('</span>', i) + 7;
            target.innerHTML += text.substring(i, spanEnd);
            i = spanEnd;
        } else {
            target.innerHTML += text.charAt(i);
            i++;
        }
        setTimeout(typeWriter, speed);
    } else {
        // Stop cursor blinking after typing finishes
        document.querySelector('.typewriter-text').style.borderRight = 'none';
        // Add Go Back and Who are you links after typing is done
        addGoBackLink();
        addLastStation();
    }
}

function addGoBackLink() {
    setTimeout(() => {
        const link = document.createElement('span');
        link.innerText = 'Go Back';
        link.style.color = 'white'; // White text color
        link.style.cursor = 'pointer'; // Change cursor to pointer
        link.style.marginTop = '20px';
        link.style.fontSize = '0.8rem'; // Make the text smaller
        link.style.position = 'fixed'; // Fix the position
        link.style.bottom = '20px'; // Distance from bottom
        link.style.left = '20px'; // Align to the left
        link.onclick = function () {
            window.history.back();
        };
        document.body.appendChild(link);
    }, 1500); // Delay of 1.5 seconds before showing the "Go Back" link
}

function addLastStation() {
    setTimeout(() => {
        const link = document.createElement('span');
        link.innerText = 'The Last Station';
        link.style.color = 'white'; // White text color
        link.style.cursor = 'pointer'; // Change cursor to pointer
        link.style.marginTop = '20px';
        link.style.fontSize = '0.8rem'; // Make the text smaller
        link.style.position = 'fixed'; // Fix the position
        link.style.bottom = '20px'; // Distance from bottom
        link.style.right = '20px'; // Align to the right
        link.onclick = function () {
            window.location.href = 'https://hugebonus.xyz/TheLastStation'; // Secret page link
        };
        document.body.appendChild(link);
    }, 3000); // Delay of 3 seconds before showing the "Who are you?" link
}

window.onload = typeHeading;
