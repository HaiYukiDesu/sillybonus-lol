document.getElementById("accept-disclaimer-button").addEventListener("click", async () => {
    document.getElementById("click-to-enter-overlay").style.opacity = 0;
    setTimeout(() => {
        document.getElementById("click-to-enter-overlay").style.display = "none";
    }, 500);

    document.querySelector(".content-container").style.opacity = 1;

    const container = document.getElementById("data-display-container");
    container.innerHTML = "";

    const grid = document.createElement("div");
    grid.className = "data-grid";

    const data = await collectBrowserData();

    for (let i = 0; i < data.length; i += 3) {
        const row = document.createElement("div");
        row.className = "data-row";

        for (let j = i; j < i + 3 && j < data.length; j++) {
            const item = document.createElement("div");
            item.className = "data-item";

            const label = document.createElement("div");
            label.className = "data-label";
            label.textContent = data[j].label;

            const value = document.createElement("div");
            value.className = "data-value";
            value.textContent = data[j].value;

            item.appendChild(label);
            item.appendChild(value);
            row.appendChild(item);
        }

        grid.appendChild(row);
    }

    container.appendChild(grid);
});

async function collectBrowserData() {
    let ipAddress = "Loading...";
    try {
        const res = await fetch("https://api.ipify.org?format=json");
        const data = await res.json();
        ipAddress = data.ip;
    } catch {
        ipAddress = "Unavailable";
    }

    return [
        { label: "IP Address", value: ipAddress },
        { label: "Timezone", value: Intl.DateTimeFormat().resolvedOptions().timeZone },
        { label: "Screen Resolution", value: `${screen.width}x${screen.height}` },
        { label: "Browser Language", value: navigator.language },
        { label: "Platform", value: navigator.platform },
        { label: "Online Status", value: navigator.onLine ? "Online" : "Offline" },
        { label: "CPU Cores", value: navigator.hardwareConcurrency || "Unknown" },
        { label: "Device Memory", value: navigator.deviceMemory ? `${navigator.deviceMemory} GB` : "Unknown" },
        { label: "Battery", value: (await getBatteryStatus()) },
        { label: "Touch Support", value: 'ontouchstart' in window ? "Yes" : "No" },
        { label: "Network Type", value: getConnectionType() },
        { label: "Canvas Fingerprint", value: await getCanvasFingerprint() },
        { label: "User Agent", value: navigator.userAgent }
    ];
}

function getConnectionType() {
    const nav = navigator.connection || navigator.mozConnection || navigator.webkitConnection;
    return nav?.effectiveType || "Unknown";
}

async function getBatteryStatus() {
    try {
        const battery = await navigator.getBattery();
        return `${Math.round(battery.level * 100)}% (${battery.charging ? "Charging" : "Not Charging"})`;
    } catch {
        return "Unavailable";
    }
}

async function getCanvasFingerprint() {
    try {
        const canvas = document.createElement("canvas");
        const ctx = canvas.getContext("2d");
        ctx.textBaseline = "top";
        ctx.font = "14px 'Arial'";
        ctx.fillStyle = "#f60";
        ctx.fillRect(0, 0, 100, 30);
        ctx.fillStyle = "#069";
        ctx.fillText("Browser Fingerprint", 2, 2);
        return canvas.toDataURL().slice(0, 25) + "...";
    } catch {
        return "Unavailable";
    }
}
