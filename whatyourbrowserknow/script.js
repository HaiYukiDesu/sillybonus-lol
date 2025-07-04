let socket,isOnline=false,isReconnecting=false,heartbeatInterval,cachedDataElements=[]

document.getElementById("accept-disclaimer-button").addEventListener("click",async()=>{
    document.getElementById("click-to-enter-overlay").style.opacity=0
    setTimeout(()=>document.getElementById("click-to-enter-overlay").style.display="none",500)
    document.querySelector(".content-container").style.opacity=1
    startSocketHeartbeat()
    await initDisplay()
    setInterval(updateValues,5000)
})

async function initDisplay(){
    const container=document.getElementById("data-display-container")
    container.innerHTML=""
    const grid=document.createElement("div")
    grid.className="data-grid"
    const data=await collectBrowserData()
    for(let i=0;i<data.length;i+=3){
        const row=document.createElement("div")
        row.className="data-row"
        for(let j=i;j<i+3&&j<data.length;j++){
            const item=document.createElement("div")
            item.className="data-item"
            const label=document.createElement("div")
            label.className="data-label"
            label.textContent=data[j].label
            const value=document.createElement("div")
            value.className="data-value"
            value.textContent=data[j].value
            item.appendChild(label)
            item.appendChild(value)
            row.appendChild(item)
            cachedDataElements.push({key:data[j].label,el:value})
        }
        grid.appendChild(row)
    }
    container.appendChild(grid)
}

async function updateValues(){
    const fresh=await collectBrowserData()
    for(const entry of cachedDataElements){
        const match=fresh.find(d=>d.label===entry.key)
        if(match)entry.el.textContent=match.value
    }
}

async function collectBrowserData(){
    let ipAddress="Loading..."
    try{
        const res=await fetch("https://api.ipify.org?format=json")
        const data=await res.json()
        ipAddress=data.ip
    }catch{
        ipAddress="Unavailable"
    }
    return[
        {label:"IP Address",value:ipAddress},
        {label:"Timezone",value:Intl.DateTimeFormat().resolvedOptions().timeZone},
        {label:"Screen Resolution",value:`${screen.width}x${screen.height}`},
        {label:"Browser Language",value:navigator.language},
        {label:"Platform",value:navigator.platform},
        {label:"Online Status",value:isOnline?"✅ Connected":"❌ Offline"},
        {label:"CPU Cores",value:navigator.hardwareConcurrency||"Unknown"},
        {label:"Device Memory",value:navigator.deviceMemory?`${navigator.deviceMemory} GB`:"Unknown"},
        {label:"Battery",value:await getBatteryStatus()},
        {label:"Touch Support",value:"ontouchstart"in window?"Yes":"No"},
        {label:"Network Type",value:getConnectionType()},
        {label:"Canvas Fingerprint",value:await getCanvasFingerprint()},
        {label:"User Agent",value:navigator.userAgent}
    ]
}

function startSocketHeartbeat(){
    if(socket&&socket.readyState<=1)return
    socket=new WebSocket("wss://ws.sillybonus.lol")
    socket.onopen=()=>{
        isOnline=true
        isReconnecting=false
        clearInterval(heartbeatInterval)
        heartbeatInterval=setInterval(()=>{
            if(socket.readyState===WebSocket.OPEN)socket.send("ping")
        },3000)
    }
    socket.onmessage=e=>{if(e.data==="alive")isOnline=true}
    socket.onclose=handleSocketClose
    socket.onerror=handleSocketClose
}

function handleSocketClose(){
    if(!isReconnecting){
        isOnline=false
        isReconnecting=true
        clearInterval(heartbeatInterval)
        setTimeout(startSocketHeartbeat,5000)
    }
}

function getConnectionType(){
    const nav=navigator.connection||navigator.mozConnection||navigator.webkitConnection
    return nav?.effectiveType||"Unknown"
}

async function getBatteryStatus(){
    try{
        const b=await navigator.getBattery()
        return`${Math.round(b.level*100)}% (${b.charging?"Charging":"Not Charging"})`
    }catch{return"Unavailable"}
}

async function getCanvasFingerprint(){
    try{
        const c=document.createElement("canvas")
        const x=c.getContext("2d")
        x.textBaseline="top"
        x.font="14px 'Arial'"
        x.fillStyle="#f60"
        x.fillRect(0,0,100,30)
        x.fillStyle="#069"
        x.fillText("Browser Fingerprint",2,2)
        return c.toDataURL().slice(0,25)+"..."
    }catch{return"Unavailable"}
}
