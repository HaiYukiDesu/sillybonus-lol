const WORKER_URL = 'wss://websocket.sillybonus.lol/';

const SUPER_SECRET_KEY = 'this-is-a-very-secure-password-trust';
const messagesContainer = document.getElementById('messages');
const messageForm = document.getElementById('message-form');
const messageInput = document.getElementById('message-input');

let cryptoKey;

function str2ab(str) {
    return new TextEncoder().encode(str);
}

function ab2str(buf) {
    return new TextDecoder().decode(buf);
}

async function getKey() {
    if (cryptoKey) return cryptoKey;
    const importedKey = await crypto.subtle.importKey(
        'raw',
        str2ab(SUPER_SECRET_KEY),
        { name: 'PBKDF2' },
        false,
        ['deriveKey']
    );
    cryptoKey = await crypto.subtle.deriveKey(
        { name: 'PBKDF2', salt: str2ab('a-good-salt'), iterations: 100000, hash: 'SHA-256' },
        importedKey,
        { name: 'AES-GCM', length: 256 },
        true,
        ['encrypt', 'decrypt']
    );
    return cryptoKey;
}

async function encryptMessage(message) {
    const key = await getKey();
    const iv = crypto.getRandomValues(new Uint8Array(12));
    const encrypted = await crypto.subtle.encrypt(
        { name: 'AES-GCM', iv: iv },
        key,
        str2ab(message)
    );
    const combined = new Uint8Array(iv.length + encrypted.byteLength);
    combined.set(iv);
    combined.set(new Uint8Array(encrypted), iv.length);
    return btoa(String.fromCharCode.apply(null, combined));
}

// Decrypts a message string
async function decryptMessage(data) {
    try {
        const key = await getKey();
        const combined = new Uint8Array(atob(data).split('').map(c => c.charCodeAt(0)));
        const iv = combined.slice(0, 12);
        const encrypted = combined.slice(12);
        const decrypted = await crypto.subtle.decrypt(
            { name: 'AES-GCM', iv: iv },
            key,
            encrypted
        );
        return ab2str(decrypted);
    } catch (e) {
        console.error("Decryption failed:", e);
        return "⚠️ Could not decrypt message. Check your secret key!";
    }
}

const socket = new WebSocket(WORKER_URL);

socket.onopen = (event) => {
    addMessageToDOM('System', 'Connection established. Ready to chat.');
};

socket.onmessage = async (event) => {
    const data = JSON.parse(event.data);
    if (data.encryptedMessage) {
        const decryptedMessage = await decryptMessage(data.encryptedMessage);
        addMessageToDOM('Friend', decryptedMessage);
    }
};

socket.onerror = (event) => {
    addMessageToDOM('System', 'Error: Connection lost. Please refresh the page.');
    console.error("WebSocket error:", event);
};

messageForm.addEventListener('submit', async (e) => {
    e.preventDefault();
    const message = messageInput.value;
    if (message && socket.readyState === WebSocket.OPEN) {
        const encryptedMessage = await encryptMessage(message);
        socket.send(JSON.stringify({ encryptedMessage }));
        messageInput.value = '';
        addMessageToDOM('You', message);
    }
});

function addMessageToDOM(sender, message) {
    const msgDiv = document.createElement('div');
    msgDiv.innerHTML = `<strong>${sender}:</strong> ${message}`;
    messagesContainer.appendChild(msgDiv);
    messagesContainer.scrollTop = messagesContainer.scrollHeight;
}
