let socket, isOnline = false, heartbeatInterval, cachedDataElements = [];

const acceptButton = document.getElementById("accept-disclaimer-button");
const overlay = document.getElementById("click-to-enter-overlay");
const contentContainer = document.querySelector(".content-container");
const pageWrapper = document.querySelector(".page-wrapper");
const leftArrow = document.querySelector(".left-arrow");
const rightArrow = document.querySelector(".right-arrow");
const clientDataContainer = document.getElementById("client-data-container");
const serverDataContainer = document.getElementById("server-data-container");

acceptButton.addEventListener("click", async () => {
    overlay.style.opacity = 0;
    setTimeout(() => overlay.style.display = "none", 500);
    contentContainer.style.opacity = 1;
    
    startSocketHeartbeat();
    await fetchAndDisplayAllData();
    setInterval(updateDynamicValues, 5000);
});

rightArrow.addEventListener('click', () => {
    pageWrapper.style.transform = 'translateX(-50%)';
    rightArrow.style.display = 'none';
    leftArrow.style.display = 'block';
});

leftArrow.addEventListener('click', () => {
    pageWrapper.style.transform = 'translateX(0%)';
    leftArrow.style.display = 'none';
    rightArrow.style.display = 'block';
});

function startSocketHeartbeat() {
    if (socket && socket.readyState <= 1) return;
    socket = new WebSocket("wss://ws.sillybonus.lol");
    socket.onopen = () => { isOnline = true; updateOnlineStatus(); clearInterval(heartbeatInterval); heartbeatInterval = setInterval(() => { if (socket.readyState === WebSocket.OPEN) socket.send("ping"); }, 3000); };
    socket.onmessage = e => { if (e.data === "alive") isOnline = true; };
    socket.onclose = handleSocketClose;
    socket.onerror = handleSocketClose;
}

function handleSocketClose() {
    isOnline = false;
    updateOnlineStatus();
    clearInterval(heartbeatInterval);
    setTimeout(startSocketHeartbeat, 5000);
}

function updateOnlineStatus() {
    const onlineEntry = cachedDataElements.find(entry => entry.key === "Online Status");
    if (onlineEntry) {
        onlineEntry.el.textContent = isOnline ? "✅ Connected" : "❌ Offline";
    }
}

async function collectClientData() {
    const battery = await getBatteryStatus().catch(() => "Unavailable");
    const canvas = await getCanvasFingerprint().catch(() => "Unavailable");
    return [
        { label: "Online Status", value: isOnline ? "✅ Connected" : "❌ Offline" },
        { label: "Screen Resolution", value: `${screen.width}x${screen.height}` },
        { label: "Browser Language", value: navigator.language },
        { label: "Platform", value: navigator.platform },
        { label: "CPU Cores", value: navigator.hardwareConcurrency || "Unknown" },
        { label: "Device Memory", value: navigator.deviceMemory ? `${navigator.deviceMemory} GB` : "Unknown" },
        { label: "Battery", value: battery },
        { label: "Touch Support", value: "ontouchstart" in window ? "Yes" : "No" },
        { label: "Vendor", value: navigator.vendor || "Unknown" },
        { label: "Canvas Fingerprint", value: canvas },
        { label: "User Agent", value: navigator.userAgent },
    ];
}

async function collectServerData() {
    try {
        const res = await fetch("https://api.sillybonus.lol/v0/info");
        if (!res.ok) throw new Error(`HTTP error! status: ${res.status}`);
        const data = await res.json();
        return [
            { label: "IP Address", value: data.ip || 'N/A' },
            { label: "Approx. Location", value: `${data.city || 'N/A'}, ${data.country || 'N/A'}` },
            { label: "Timezone", value: data.timezone || 'N/A' },
            { label: "Internet Provider", value: data.asn || 'N/A' },
            { label: "HTTP Protocol", value: data.httpProtocol || 'N/A' },
            { label: "Referer", value: data.referer || 'N/A' },
            { label: "User Agent", value: data.userAgent || 'N/A' },
        ];
    } catch (e) {
        console.error("Failed to fetch server data:", e);
        return [{ label: "Server Data", value: "Could not be fetched." }];
    }
}

function populateDataGrid(container, dataPoints) {
    container.innerHTML = "";
    const grid = document.createElement("div");
    grid.className = "data-grid";

    for (let i = 0; i < dataPoints.length; i += 3) {
        const row = document.createElement("div");
        row.className = "data-row";
        for (let j = i; j < i + 3 && j < dataPoints.length; j++) {
            const item = document.createElement("div");
            item.className = "data-item";
            const label = document.createElement("div");
            label.className = "data-label";
            label.textContent = dataPoints[j].label;
            const value = document.createElement("div");
            value.className = "data-value";
            value.textContent = dataPoints[j].value;
            item.appendChild(label);
            item.appendChild(value);
            row.appendChild(item);
            cachedDataElements.push({ key: dataPoints[j].label, el: value });
        }
        grid.appendChild(row);
    }
    container.appendChild(grid);
}

async function fetchAndDisplayAllData() {
    cachedDataElements = []; 
    const [clientData, serverData] = await Promise.all([
        collectClientData(),
        collectServerData()
    ]);
    populateDataGrid(clientDataContainer, clientData);
    populateDataGrid(serverDataContainer, serverData);
}

async function updateDynamicValues() {
    try {
        const battery = await getBatteryStatus().catch(() => "Unavailable");
        const dynamicData = [
            { label: "Battery", value: battery },
            { label: "Online Status", value: isOnline ? "✅ Connected" : "❌ Offline" }
        ];

        for (const entry of cachedDataElements) {
            const match = dynamicData.find(d => d.label === entry.key);
            if (match && entry.el.textContent !== match.value) {
                entry.el.textContent = match.value;
            }
        }
    } catch (e) {
        console.error("Failed to update values:", e);
    }
}

async function getBatteryStatus() {
    if (!navigator.getBattery) return "Not Supported";
    const b = await navigator.getBattery();
    return `${Math.round(b.level * 100)}% (${b.charging ? "Charging" : "Not Charging"})`;
}

async function getCanvasFingerprint() {
    try {
        const c = document.createElement("canvas");
        const x = c.getContext("2d");
        x.textBaseline = "top";
        x.font = "14px 'Arial'";
        x.fillStyle = "#f60";
        x.fillRect(0, 0, 100, 30);
        x.fillStyle = "#069";
        x.fillText("Internet Footprint", 2, 2);
        return c.toDataURL().slice(0, 25) + "...";
    } catch (e) {
        return "Unavailable";
    }
}

function initializeStars() {
    const starsContainer = document.getElementById('stars-container');
    for (let i = 0; i < 150; i++) {
        const star = document.createElement('div');
        star.className = 'star';
        const size = Math.random() * 4 + 2;
        star.style.width = `${size}px`;
        star.style.height = `${size}px`;
        star.style.left = `${Math.random() * 100}%`;
        star.style.top = `${Math.random() * 100}%`;
        const animationDuration = Math.random() * 3 + 2;
        star.style.animation = `fadeIn 1.5s ease-out forwards, twinkle ${animationDuration}s ease-in-out infinite`;
        starsContainer.appendChild(star);
    }
}
document.addEventListener('mousemove', (e) => {
    const stars = document.getElementsByClassName('star');
    const mouseX = (e.clientX / window.innerWidth - 0.5) * 20;
    const mouseY = (e.clientY / window.innerHeight - 0.5) * 20;
    for (let star of stars) {
        const depth = Math.random() * 0.5 + 0.5;
        star.style.transform = `translate(${mouseX * depth}px, ${mouseY * depth}px)`;
    }
});
initializeStars();
