const headingText = "????????? \n";

const text = `To proceed is to embrace the unknown and step into the shadows of your own reality. With every choice you make, the boundaries of what you understand will blur, revealing the intricate web of existence that lies beneath. But heed this <span class="bold-text">warning: this is the last station on your journey. Once you cross this threshold, there is no turning back.</span> Are you ready to take this leap of faith into the depths of the matrix?
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
        link.innerText = 'Into the Abyss';
        link.style.color = 'white'; // White text color
        link.style.cursor = 'pointer'; // Change cursor to pointer
        link.style.marginTop = '20px';
        link.style.fontSize = '0.8rem'; // Make the text smaller
        link.style.position = 'fixed'; // Fix the position
        link.style.bottom = '20px'; // Distance from bottom
        link.style.right = '20px'; // Align to the right
        link.onclick = function () {
            window.location.href = 'https://hugebonus.xyz/UnderConstruction'; // Secret page link
        };
        document.body.appendChild(link);
    }, 3000); // Delay of 3 seconds before showing the "Who are you?" link
}

window.onload = typeHeading;
