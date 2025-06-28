document.addEventListener('DOMContentLoaded', function () {
    /**
     * @param {string} masterString
     * @returns {object}
     */
    function parseMasterString(masterString) {
        const allItems = {};
        const blockRegex = /"(.*?)"\s*:\s*\[([\s\S]*?)\]/g;
        let match;
        while ((match = blockRegex.exec(masterString)) !== null) {
            const itemName = match[1];
            const content = match[2];
            const itemDetails = {};
            const lines = content.split(';').filter(line => line.trim() !== '');
            lines.forEach(line => {
                const parts = line.split('=');
                if (parts.length < 2) return;
                const key = parts[0].trim();
                let value = parts.slice(1).join('=').trim();
                if (value.startsWith('"') && value.endsWith('"')) {
                    value = value.substring(1, value.length - 1);
                } else if (value.startsWith('{') && value.endsWith('}')) {
                    value = value.substring(1, value.length - 1).split(',').map(num => parseInt(num.trim(), 10));
                } else if (value === 'true') {
                    value = true;
                } else if (value === 'false') {
                    value = false;
                } else if (!isNaN(parseFloat(value)) && isFinite(value)) {
                    value = Number(value);
                }
                itemDetails[key] = value;
            });
            allItems[itemName] = itemDetails;
        }
        return allItems;
    }
    const parsedData = parseMasterString(allRawData);

    const data = {
        "6/28/2025 Mega Summer Harvest Update": {
            "Seeds": {
                "Rafflesia": parsedData["Rafflesia"],
                "Pitcher Plant": parsedData["Pitcher Plant"],
                "Burning Bud": parsedData["Burning Bud"],
                "Delphinium": parsedData["Delphinium"],
                "Lily of the Valley": parsedData["Lily of the Valley"],
                "Traveler's Fruit": parsedData["Traveler's Fruit"],
                "Peace Lily": parsedData["Peace Lily"],
                "Aloe Vera": parsedData["Aloe Vera"],
                "Guanabana": parsedData["Guanabana"],
                "Noble Flower": parsedData["Noble Flower"],
                "Lemon": parsedData["Lemon"],
                "Cherry Blossom": parsedData["Cherry Blossom"],
                "Ice Cream Bean": parsedData["Ice Cream Bean"],
                "Lime": parsedData["Lime"],
                "White Mulberry": parsedData["White Mulberry"],
            },
            "Gears": {
                "Magnifying Glass": parsedData["Magnifying Glass"]
            },
            "Shops": {
                "Sky Traveling Merchant": {
                    "Night Staff": parsedData["Night Staff"],
                    "Star Caller": parsedData["Star Caller"],
                    "Mutation Spray Cloudtouched": parsedData["Mutation Spray Cloudtouched"],
                },
                "Gnome Traveling Merchant": {
                    "Common Gnome Crate": parsedData["Common Gnome Crate"],
                    "Farmers Gnome Crate": parsedData["Farmers Gnome Crate"],
                    "Classic Gnome Crate": parsedData["Classic Gnome Crate"],
                    "Iconic Gnome Crate": parsedData["Iconic Gnome Crate"],
                },
                "Summer Event Shop": {
                    "Summer Seed Pack": parsedData["Summer Seed Pack"],
                    "Delphinium": parsedData["Delphinium"],
                    "Lily of the Valley": parsedData["Lily of the Valley"],
                    "Traveler's Fruit": parsedData["Traveler's Fruit"],
                    "Mutation Spray Burnt": parsedData["Mutation Spray Burnt"],
                    "Oasis Crate": parsedData["Oasis Crate"],
                    "Oasis Egg": parsedData["Oasis Egg"],
                }
            },
            "Crafts": {
                "Gear": {
                    "Mutation Spray Chilled": parsedData["Mutation Spray Chilled"]
                },
                "Seeds": {
                    "Peace Lily": parsedData["Peace Lily"],
                    "Guanabana": parsedData["Guanabana"]
                }
            },
            "Pets": {
                "Oasis Egg": {
                    "Info": parsedData["Oasis Egg"],
                    "Meerkat": parsedData["Meerkat"],
                    "Sand Snake": parsedData["Sand Snake"],
                    "Axolotl": parsedData["Axolotl"],
                    "Hyacinth Macaw": parsedData["Hyacinth Macaw"],
                    "Fennec Fox": parsedData["Fennec Fox"],
                },
                "Unknown": {
                    "Firefly": parsedData["Firefly"],
                    "Red Dragon": parsedData["Red Dragon"],
                    "Golden Bee": parsedData["Golden Bee"]
                }
            },
            "Mutation": {
                "Cloudtouched": parsedData["cloudtouched"],
                "Fried": parsedData["fried"],
                "Aurora": parsedData["aurora"],
                "Wiltproof": parsedData["wiltproof"],
                "Drenched": parsedData["drenched"],
            }
        }
    };

    function isDetailsObject(obj) {
        return Object.values(obj).every(value => typeof value !== 'object' || Array.isArray(value));
    }

    function createTree(obj) {
        const ul = document.createElement('ul');
        for (const key in obj) {
            const li = document.createElement('li');
            const value = obj[key];
            const isObject = typeof value === 'object' && value !== null && !Array.isArray(value);

            if (isObject && Object.keys(value).length > 0) {
                const span = document.createElement('span');
                span.textContent = key;
                span.className = 'folder';
                li.appendChild(span);

                const nestedUl = document.createElement('ul');
                nestedUl.className = 'nested';

                span.addEventListener('click', (e) => {
                    e.stopPropagation();
                    span.classList.toggle('open');
                });

                if (isDetailsObject(value)) {
                    for (const detailKey in value) {
                        const detailLi = document.createElement('li');
                        const keySpan = document.createElement('span');
                        keySpan.className = 'details-key';
                        keySpan.textContent = `${detailKey}: `;
                        const valueSpan = document.createElement('span');
                        valueSpan.className = 'details-value';
                        valueSpan.textContent = Array.isArray(value[detailKey]) ? value[detailKey].join(', ') : value[detailKey];
                        detailLi.appendChild(keySpan);
                        detailLi.appendChild(valueSpan);
                        nestedUl.appendChild(detailLi);
                    }
                } else {
                    const subTree = createTree(value);
                    while (subTree.firstChild) {
                        nestedUl.appendChild(subTree.firstChild);
                    }
                }
                li.appendChild(nestedUl);

            } else {
                const span = document.createElement('span');
                span.textContent = key;
                span.className = 'item';
                li.appendChild(span);
            }
            ul.appendChild(li);
        }
        return ul;
    }

    const container = document.getElementById('tree-container');
    container.classList.add('tree');
    container.appendChild(createTree(data));
});
