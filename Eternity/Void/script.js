const headingText = "????????? \n";

const text = `<span class="bold-text">Hello again, traveler.</span>

We meet once more, but not at the same place. You’ve stumbled upon a hidden corner of the web, a sanctuary for those who seek a moment of solitude. Here, the ordinary fades away, and the extraordinary begins to unfold.

Take a deep breath and embrace the calmness that surrounds you. In this space, time feels different—each second stretches into eternity. Reflect on your journey so far, and ponder where it might lead next.

You are not lost; you are simply wandering through the unknown. Every path you take adds a new chapter to your story, each decision guiding you toward the next adventure.

As you linger here, consider the lessons learned and the experiences gained. What whispers of wisdom have you collected along the way? Each encounter shapes who you are and who you will become.

So, traveler, as you prepare to continue your journey, remember: every end is but a new beginning. Keep your heart open, your mind curious, and the world will unfold its wonders before you.

Thank you for pausing here. Now, <span class="bold-text">go forth and embrace the adventure that awaits.</span>
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
        addWhoAreYouLink();
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

function addWhoAreYouLink() {
    setTimeout(() => {
        const link = document.createElement('span');
        link.innerText = 'Who are you?';
        link.style.color = 'white'; // White text color
        link.style.cursor = 'pointer'; // Change cursor to pointer
        link.style.marginTop = '20px';
        link.style.fontSize = '0.8rem'; // Make the text smaller
        link.style.position = 'fixed'; // Fix the position
        link.style.bottom = '20px'; // Distance from bottom
        link.style.right = '20px'; // Align to the right
        link.onclick = function () {
            window.location.href = 'https://hugebonus.xyz/NoWhere/WhoAreYou'; // Secret page link
        };
        document.body.appendChild(link);
    }, 3000); // Delay of 3 seconds before showing the "Who are you?" link
}

window.onload = typeHeading;
