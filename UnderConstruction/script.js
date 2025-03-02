const headingText = "Under Construction \n";

const text = `<span class="bold-text">"Pardon the Dust – Something New is Coming Soon!"</span>

You’ve stumbled upon a place that’s not quite ready yet—a space in the making, where ideas are still being shaped and the final touches are yet to be added. But don’t worry, what’s coming next is worth the wait.

We’re currently working behind the scenes, building something special just for you. It won’t be long now, and when this area is complete, it will open up a whole new experience.

<span class="bold-text">Stay tuned, check back soon, and prepare to explore what’s in store. The journey is just beginning.</span>
`;

let i = 0;
let j = 0;
const speed = 50; // typing speed in milliseconds

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

window.onload = typeHeading;
