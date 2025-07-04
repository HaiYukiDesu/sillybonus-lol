const acceptButton = document.getElementById('accept-disclaimer-button');
const dataContainer = document.getElementById('data-display-container');
const overlay = document.getElementById('click-to-enter-overlay');
acceptButton.addEventListener('click', () => {
    const contentContainer = document.querySelector('.content-container');
    overlay.style.opacity = '0';
    setTimeout(() => {
        overlay.style.display = 'none';
    }, 500);

    contentContainer.style.opacity = '1';

    fetchAllData();
});


document.addEventListener('mousemove', (e) => {
    const stars = document.getElementsByClassName('star');
    const mouseX = (e.clientX / window.innerWidth - 0.5) * 20;
    const mouseY = (e.clientY / window.innerHeight - 0.5) * 20;

    for (let star of stars) {
        const depth = Math.random() * 0.5 + 0.5;
        star.style.transform = `translate(${mouseX * depth}px, ${mouseY * depth}px)`;
    }
});

async function getIpAddress() {
    try {
        const response = await fetch('https://api.ipify.org?format=json');
        const data = await response.json();
        return data.ip;
    } catch (error) {
        return "Could not fetch";
    }
}

function getScreenInfo() {
    return {
        resolution: `${window.screen.width} x ${window.screen.height}`,
        colorDepth: `${window.screen.colorDepth}-bit`,
    };
}

function getBrowserInfo() {
    return {
        userAgent: navigator.userAgent,
        language: navigator.language,
        platform: navigator.platform,
        cookiesEnabled: navigator.cookieEnabled ? "Yes" : "No",
    };
}

function getNetworkInfo() {
    const connection = navigator.connection || navigator.mozConnection || navigator.webkitConnection;
    if (!connection) return "Not Available";
    return {
        type: connection.effectiveType,
        downlink: `${connection.downlink} Mbps`,
    };
}

function getGeolocation() {
    return new Promise((resolve) => {
        if (!navigator.geolocation) {
            resolve("Not Supported");
            return;
        }
        navigator.geolocation.getCurrentPosition(
            (position) => {
                resolve(`${position.coords.latitude.toFixed(4)}, ${position.coords.longitude.toFixed(4)}`);
            },
            () => {
                resolve("Permission Denied");
            }
        );
    });
}

async function fetchAllData() {
    dataContainer.innerHTML = '<h2>Fetching your data...</h2>';

    const ip = await getIpAddress();
    const screen = getScreenInfo();
    const browser = getBrowserInfo();
    const network = getNetworkInfo();
    const location = await getGeolocation();

    const dataPoints = [
        { label: "IP Address", value: ip },
        { label: "Location", value: location },
        { label: "Screen Resolution", value: screen.resolution },
        { label: "Browser Language", value: browser.language },
        { label: "Platform", value: browser.platform },
        { label: "Network Type", value: network.type || "N/A" },
        { label: "Approx. Speed", value: network.downlink || "N/A" },
        { label: "User Agent", value: browser.userAgent },
    ];

    let html = '';
    dataPoints.forEach(point => {
        html += `
            <div class="data-item">
                <span class="data-label">${point.label}</span>
                <span class="data-value">${point.value}</span>
            </div>
        `;
    });

    dataContainer.innerHTML = html;
}

function initializeStars() {
    function createStar() {
        const star = document.createElement('div');
        star.className = 'star';
        const size = Math.random() * 4 + 2;
        star.style.width = `${size}px`;
        star.style.height = `${size}px`;
        star.style.left = `${Math.random() * 100}%`;
        star.style.top = `${Math.random() * 100}%`;
        const animationDuration = Math.random() * 3 + 2; 
        star.style.animation = `fadeIn 1.5s ease-out forwards, twinkle ${animationDuration}s ease-in-out infinite`;
        document.getElementById('stars-container').appendChild(star);
    }
    for (let i = 0; i < 150; i++) {
        createStar();
    }
}
initializeStars();
