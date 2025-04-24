const headingText = "404 Not Found\n";

const text = `Welcome, traveler. You’ve reached a page that doesn’t exist, a place where content used to be—or maybe never was. Let’s take this moment to pause and reflect.

Take a deep breath in, and let it out slowly. Notice the space around you, empty yet full of possibility. Imagine that each exhale clears away confusion, leaving room for clarity.

As you sit with this blank page, know that it’s okay to be here. You’ve discovered something unexpected, and that’s part of the journey. Gently release any frustration, knowing that every path leads somewhere—even this one.

Now, when you’re ready, slowly return to your search. Trust that the right page, the right information, will appear when you need it. Take another deep breath, and when you exhale, click back or try again. The internet, like life, is full of surprises.

Thank you for taking this moment of calm. <span class="bold-text">Your journey continues.</span>
`;

let i = 0;
let j = 0;
const speed = 75;

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
        document.querySelector('.typewriter-text').style.borderRight = 'none';
        addGoBackLink();
    }
}

function addGoBackLink() {
    setTimeout(() => {
        const link = document.createElement('span');
        link.innerText = 'Go Back';
        link.style.color = 'white';
        link.style.cursor = 'pointer';
        link.style.marginTop = '20px';
        link.style.fontSize = '0.8rem';
        link.onclick = function () {
            window.history.back();
        };
        document.getElementById("typing-text").appendChild(link);
    });
}



window.onload = typeHeading;
