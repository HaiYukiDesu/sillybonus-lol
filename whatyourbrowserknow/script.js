const overlay = document.getElementById('click-to-enter-overlay');
const acceptButton = document.getElementById('accept-disclaimer-button');
const dataContainer = document.getElementById('data-display-container');

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
        pixelDepth: `${window.screen.pixelDepth}-bit`,
    };
}

function getBrowserInfo() {
    return {
        userAgent: navigator.userAgent,
        language: navigator.language,
        platform: navigator.platform,
        vendor: navigator.vendor,
        onlineStatus: navigator.onLine ? "Online" : "Offline",
        cookiesEnabled: navigator.cookieEnabled ? "Yes" : "No",
    };
}

function getHardwareInfo() {
    return {
        cpuCores: navigator.hardwareConcurrency || "N/A",
        deviceMemory: `${navigator.deviceMemory || "N/A"} GB`,
        touchPoints: navigator.maxTouchPoints > 0 ? "Yes" : "No",
    };
}

async function getBatteryInfo() {
    try {
        if (!navigator.getBattery) return "Not Supported";
        const battery = await navigator.getBattery();
        const level = `${Math.round(battery.level * 100)}%`;
        const status = battery.charging ? "Charging" : "Discharging";
        return `${level} (${status})`;
    } catch (error) {
        return "N/A";
    }
}

function getNetworkInfo() {
    const connection = navigator.connection || navigator.mozConnection || navigator.webkitConnection;
    if (!connection) return "Not Available";
    return {
        type: connection.effectiveType,
        downlink: `${connection.downlink || 'N/A'} Mbps`,
    };
}

function getCanvasFingerprint() {
    try {
        const canvas = document.createElement('canvas');
        const ctx = canvas.getContext('2d');
        const txt = 'sillybonus.lol <3';
        ctx.textBaseline = "top";
        ctx.font = "14px 'Arial'";
        ctx.textBaseline = "alphabetic";
        ctx.fillStyle = "#f60";
        ctx.fillRect(125, 1, 62, 20);
        ctx.fillStyle = "#069";
        ctx.fillText(txt, 2, 15);
        ctx.fillStyle = "rgba(102, 204, 0, 0.7)";
        ctx.fillText(txt, 4, 17);
        const dataUrl = canvas.toDataURL();

        let hash = 0;
        for (let i = 0; i < dataUrl.length; i++) {
            const char = dataUrl.charCodeAt(i);
            hash = ((hash << 5) - hash) + char;
            hash |= 0;
        }
        return hash;
    } catch (e) {
        return "Unavailable";
    }
}


async function fetchAllData() {
    dataContainer.innerHTML = '<h2>Fetching your data...</h2>';

    const [ip, battery] = await Promise.all([
        getIpAddress(),
        getBatteryInfo()
    ]);

    const screen = getScreenInfo();
    const browser = getBrowserInfo();
    const network = getNetworkInfo();
    const hardware = getHardwareInfo();
    const canvasId = getCanvasFingerprint();
    const timezone = Intl.DateTimeFormat().resolvedOptions().timeZone;

    const dataPoints = [
        { label: "IP Address", value: ip },
        { label: "Timezone", value: timezone },
        { label: "Screen Resolution", value: `${screen.resolution} (${screen.colorDepth})` },
        { label: "Browser Language", value: browser.language },
        { label: "Platform", value: browser.platform },
        { label: "Online Status", value: browser.onlineStatus },
        { label: "CPU Cores", value: hardware.cpuCores },
        { label: "Device Memory", value: hardware.deviceMemory },
        { label: "Battery", value: battery },
        { label: "Touch Support", value: hardware.touchPoints },
        { label: "Network Type", value: network.type || "N/A" },
        { label: "Canvas Fingerprint", value: canvasId },
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
    html += `
        <div style="text-align: center; margin-top: 25px; padding-top: 15px; border-top: 1px solid rgba(255,255,255,0.2);">
            <h3 style="margin-bottom: 10px; font-family: 'Space Mono', monospace;">What a Website CANNOT See</h3>
            <p style="font-size: 0.8rem; line-height: 1.5; margin: 0; color: #ccc;">
                For your security, browsers prevent websites from accessing sensitive information like your Browse history, cookies from other sites, local files, installed programs, or unique hardware IDs like your MAC address.
            </p>
        </div>
    `;

    dataContainer.style.justifyContent = 'flex-start';
    dataContainer.style.alignItems = 'stretch';
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
