document.addEventListener('DOMContentLoaded', function () {
    /**
     * @param {string} masterString
     * @returns {object}
     */
    function parseMasterString(masterString) {
        const keys = Object.keys(masterString);
        for (const key of keys) {
            const value = obj[key];

            if (typeof value === 'object' && value !== null) {
            
            stringifyNestedTables(value);
            
            obj[key] = JSON.stringify(value);
            }
        }
    }
    const parsedData = JSON.parse(allRawData);

    const data = {
        "7/5/25 Prehistoric Update": {
            "New Dino Machine Reward(Hourly Event)": {
                "Tier 1": parsedData["tier1"],
                "Tier 2": parsedData["tier2"],
                "Tier 3": parsedData["tier3"],
                "Tier 4": parsedData["tier4"],
                "Tier 5": parsedData["tier5"],
                "Tier 6": parsedData["tier6"],
                "Tier 7": parsedData["tier7"],
                "Tier 8": parsedData["tier8"],
                "Tier 9": parsedData["tier9"],
                "Tier 10": parsedData["tier10"],
            },
            "New Traveling Merchant": {
                "Honey Traveling Merchant": {
                    "Flower Seed Pack": parsedData["Flower Seed Pack"],
                    "Honey Sprinkler": parsedData["Honey Sprinkler"],
                    "Bee Egg": parsedData["Bee Egg"],
                    "Bee Crate": parsedData["Bee Crate"],
                    "Honey Crafters Crate": parsedData["Honey Crafters Crate"],
                },
                "Summer Traveling Merchant": {
                    "Cauliflower": parsedData["Cauliflower"],
                    "Rafflesia": parsedData["Rafflesia"],
                    "Green Apple": parsedData["Green Apple"],
                    "Avocado": parsedData["Avocado"],
                    "Banana": parsedData["Banana"],
                    "Pineapple": parsedData["Pineapple"],
                    "Kiwi": parsedData["Kiwi"],
                    "Bell Pepper": parsedData["Bell Pepper"],
                    "Prickly Pear": parsedData["Prickly Pear"],
                    "Loquat": parsedData["Loquat"],
                    "Feijoa": parsedData["Feijoa"],
                    "Pitcher Plant": parsedData["Pitcher Plant"],
                }
            },
            "New Cosmetic": {
                "Dino Crate": parsedData["Dino Crate"]
            },
            "New Crafting": {
                "Mutation Spray Amber": parsedData["Mutation Spray Amber"],
                "Ancient Seed Pack": parsedData["Ancient Seed Pack"],
                "Dino Crate": parsedData["Dino Crate"],
            },
            "New Gear": {
                "Mutation Spray Amber": parsedData["MSA"]
            },
            "New Exotic Seed Pack":{
                "Exotic Ancient Seed Pack": parsedData["Exotic Ancient Seed Pack"]
            },
            "New Robux Item": {
                "+1 Exotic Ancient Seed Pack": parsedData["+1 Exotic Ancient Seed Pack"],
                "+3 Exotic Ancient Seed Pack": parsedData["+3 Exotic Ancient Seed Pack"],
                "+10 Exotic Ancient Seed Pack": parsedData["+10 Exotic Ancient Seed Pack"],
            },
            "New Growable Data": {
                "Bone Blossom": parsedData["Bone Blossom"],
                "Stonebite": parsedData["Stonebite"],
                "Paradise Petal": parsedData["Paradise Petal"],
                "Horned Dinoshroom": parsedData["Horned Dinoshroom"],
                "Boneboo": parsedData["Boneboo"],
                "Firefly Fern": parsedData["Firefly Fern"],
                "Fossilight": parsedData["Fossilight"],
            },
            "New Egg": {
                "Dinosaur Egg": {
                    "Raptor": parsedData["Raptor"],
                    "Triceratops": parsedData["Triceratops"],
                    "Stegosaurus": parsedData["Stegosaurus"],
                    "Pterodactyl": parsedData["Pterodactyl"],
                    "Brontosaurus": parsedData["Brontosaurus"],
                    "T-Rex": parsedData["T-Rex"],
                }
            },
            "New Pet": {
                "Raptor": parsedData["Raptor Pet"],
                "Triceratops": parsedData["Triceratops Pet"],
                "Stegosaurus": parsedData["Stegosaurus Pet"],
                "Pterodactyl": parsedData["Pterodactyl Pet"],
                "Brontosaurus": parsedData["Brontosaurus Pet"],
                "T-Rex": parsedData["T-Rex Pet"],
            },
            "New Dino Event Quest": {
                "Info": parsedData["Dino Event Quest"],
                "Reward": {
                    "Info": "Tier that didn't get include mean that it's have the same reward for all or it doesn't have reward at all.",
                    "Tier 3": parsedData["3"],
                    "Tier 6": parsedData["6"],
                    "Tier 9": parsedData["9"],
                    "Tier 12": parsedData["12"],
                    "Tier 15": parsedData["15"],
                    "Tier 18": parsedData["18"],
                    "Tier 21": parsedData["21"],
                },
            },
            "New Seed": {
                "Bone Blossom": parsedData["Bone Blossom Seed"],
                "Stonebite": parsedData["Stonebite Seed"],
                "Paradise Petal": parsedData["Paradise Petal Seed"],
                "Horned Dinoshroom": parsedData["Horned Dinoshroom Seed"],
                "Boneboo": parsedData["Boneboo Seed"],
                "Firefly Fern": parsedData["Firefly Fern Seed"],
                "Fossilight": parsedData["Fossilight Seed"],
            },
            "New Seed Pack": {
                "Ancient Seed Pack": parsedData["Ancient Seed Pack Loot"],
                "Exotic Ancient Seed Pack": parsedData["Exotic Ancient Seed Pack Loot"],
                "Rainbow Exotic Ancient Seed Pack": parsedData["Rainbow Exotic Ancient Seed Pack Loot"],
            },
            "New Mutation": {
                "Mutation": {
                    "Amber": 10,
                    "OldAmber": 20,
                    "AncientAmber": 50,
                    "Sandy": 3,
                    "Clay": 3,
                    "Ceramic": 30,
                },
                "Mutation Combo": {
                    "Clay": parsedData["Clay"],
                    "Ceramic": parsedData["Ceramic"]
                }
            },
            "New Weather": {
                "Rainbow": "Unknown",
                "SandStorm": "Gives Sandy Mutation",
                "DJSandStorm": "Unknown"
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
            const isNestableObject = typeof value === 'object' && value !== null && !Array.isArray(value);

            if (isNestableObject && Object.keys(value).length > 0) {
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

                        let displayValue = value[detailKey];
                        if (typeof displayValue === 'object' && displayValue !== null) {
                            displayValue = JSON.stringify(displayValue);
                        }
                        valueSpan.textContent = displayValue;

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
                li.innerHTML = `<span class="details-key">${key}:</span> <span class="details-value">${JSON.stringify(value)}</span>`;
            }
            ul.appendChild(li);
        }
        return ul;
    }

    const container = document.getElementById('tree-container');
    container.classList.add('tree');
    container.appendChild(createTree(data));
});