class VirtualKeyboard {
    constructor () {
        this.div = document.createElement("div");
        this.div.className = "virtual_keyboard_container";
        this.keyboardDiv = document.createElement("div");
        this.keyboardDiv.className = "virtual_keyboard";
        this.div.appendChild(this.keyboardDiv);
        document.body.appendChild(this.div);
        this.isShifting = false;
        this.keys = [];
        VIRTUAL_KEYS.forEach((line)=>{
            const lineDiv = document.createElement("div");
            lineDiv.className = "virtual_keyboard__line";
            this.keyboardDiv.appendChild(lineDiv);
            line.forEach((keyData)=>{
                let key = this.initKey(keyData);
                this.keys.push(key);
                lineDiv.appendChild(key.dom);
            });
        });
        const closeButton = document.createElement("a");
        closeButton.className = "virtual_keyboard_container__close";
        closeButton.innerHTML = "&#10006";
        this.div.appendChild(closeButton);
        closeButton.addEventListener("click", ()=>{this.close()});
    }
    shift () {
        this.isShifting = !this.isShifting;
        let index = (this.isShifting)?1:0;
        this.keys.forEach((key)=>{
            if (key.keys)
                key.dom.innerHTML = key.keys[index];
        });
    }
    initKey (keyData) {
        let label = "";
        const keySpan = document.createElement("a");
        let f = null;
        const key = {};
        let size = 2;
        if (typeof(keyData)=="object") {
            if (keyData.keys) {
                key.keys = keyData.keys;
                label = key.keys[0];
            }
            // Special keys
            if (keyData.label) {
                key.label = keyData.label;
                label = key.label;
            }
            f = keyData.f;
            if (keyData.size) {
                size = keyData.size;
            }
        }
        keySpan.className = "virtual_keyboard__key virtual_keyboard__key--s" + size;
        keySpan.innerHTML = label;
        if (f) {
            keySpan.addEventListener("click", (event)=>{
                    f();
            }, false);
        } else if (key.keys) {
            keySpan.addEventListener("click", (event)=>{
                console.log("keydown")
                    this.keydown(event, key);
            }, false);
        }
        key.dom = keySpan;
        return key;

    }
    setTarget (target) {
        if (this.target == target) {
            // Same target. Nothing to do.
            return;
        }
        if (this.target) {
            this.target.dispatchEvent(new Event("input"));
        }

        this.target = target;
        if (this.target) {
            this.setCursor(this.target.value.length);
        }

    }
    open (eventOrig, target) {
        if (target == this.target) {
            return;
        }
        this.setTarget (target);
        this.isOpen = true;
        console.log();
        this.div.style.height = this.keyboardDiv.clientHeight + "px";

        if (!this.closeListener) {
            this.closeListener = (event)=>{
                if (event.target.hasVirtualKeyboardSupport) {
                    return;
                }
                let t = event.target;
                while (t) {
                    if (t == this.div) {
                        return;
                    }
                    t = t.parentNode;
                }
                this.close(event);
            };
            this.closeEvent = document.body.addEventListener("click", this.closeListener, true);

        }
    }
    close (e) {
        this.setTarget(null);
        this.div.style.height = "0";
        if (this.closeListener) {
            document.body.removeEventListener("click", this.closeListener);
            this.closeListener = null;
        }
    }
    keydown (event, key) {
        event.preventDefault()
        const ch = (this.isShifting)? key.keys[1]:key.keys[0];
        this.target.value = (this.target.value.substring(0, this.cursorPosition) + ch + this.target.value.substring(this.cursorPosition));
        this.setCursor(this.cursorPosition + 1);
    }
    setCursor (position) {
        if (this.target.type!="number") {
            this.cursorPosition = position;
            this.target.select()
            this.target.setSelectionRange(this.cursorPosition, this.cursorPosition);
        }
    }
    left () {
        this.setCursor(Math.max(0, this.cursorPosition-1));
    }
    right () {
        this.setCursor(Math.min(this.cursorPosition+1, this.target.value.length))

    }
    backspace () {
        if (this.cursorPosition < 1) {
            return;
        }
        this.target.value = (this.target.value.substring(0, this.cursorPosition-1) + this.target.value.substring(this.cursorPosition));
        this.setCursor(this.cursorPosition - 1);
    }
}
VirtualKeyboard.keyboard = null;
VirtualKeyboard.backspace = function () {
    VirtualKeyboard.keyboard.backspace()
}
VirtualKeyboard.shift = function () {
    VirtualKeyboard.keyboard.shift();
}
VirtualKeyboard.left = function () {
    VirtualKeyboard.keyboard.left();
}
VirtualKeyboard.right = function () {
    VirtualKeyboard.keyboard.right();
}
const VIRTUAL_KEYS = [
    [
        {keys:["`", "~"]},
        {keys:[1,"!"]},
        {keys:[2,"@"]},
        {keys:[3,"#"]},
        {keys:[4,"$"]},
        {keys:[5,"%"]},
        {keys:[6,"^"]},
        {keys:[7,"&"]},
        {keys:[8,"*"]},
        {keys:[9,"("]},
        {keys:[0,")"]},
        {keys:["-","_"]},
        {keys:["=","+"]},
        {label:"⌫",f:VirtualKeyboard.backspace, size:3}
    ],
    [
        {size: 3}, 
        {keys:["q","Q"]},
        {keys:["w","W"]},
        {keys:["e","E"]},
        {keys:["r","R"]},
        {keys:["t","T"]},
        {keys:["y","Y"]},
        {keys:["u","U"]},
        {keys:["i","I"]},
        {keys:["o","O"]},
        {keys:["p","P"]},
        {keys:["[","{"]},
        {keys:["]","}"]},
        {keys:["\\","|"]}
    ],
    [
        {size: 4},
        {keys:["a","A"]},
        {keys:["s","S"]},
        {keys:["d","D"]},
        {keys:["f","F"]},
        {keys:["g","G"]},
        {keys:["h","H"]},
        {keys:["j","J"]},
        {keys:["k","K"]},
        {keys:["l","L"]},
        {keys:[";",":"]},
        {keys:["'","\""]},
        {size: 3},
    ],
    [
        {size:5, label:"⇧",f:VirtualKeyboard.shift},
        {keys:["z","Z"]},
        {keys:["x","X"]},
        {keys:["c","C"]},
        {keys:["v","V"]},
        {keys:["b","B"]},
        {keys:["n","N"]},
        {keys:["m","M"]},
        {keys:[",","<"]},
        {keys:[".",">"]},
        {keys:["/","?"]},
        {size:5, label:"⇧",f:VirtualKeyboard.shift}
    ],
    [ 
        {size: 2},
        {size: 2},
        {size: 2},
        {size: 3},
          {size: 10, keys:[" "," "]},
          {size: 3},
          {size: 2},
        {label:"←", f:VirtualKeyboard.left},
        {label:"→", f:VirtualKeyboard.right}
    ]
];

VirtualKeyboard.addKeyboardEvents = function (element) {
    if (["input","textarea"].includes(element.nodeName.toLowerCase()) && (["text","number", null].includes(element.type) || element.type == null)) {
        element.addEventListener("focus", (event)=>{
            VirtualKeyboard.keyboard.open(event, element);
        });
        element.addEventListener("blur", (event)=>{
        });
        element.hasVirtualKeyboardSupport = true;

    }
}

VirtualKeyboard.initKeyboard = function() {
    VirtualKeyboard.keyboard = new VirtualKeyboard();
    const inputs = document.querySelectorAll("input,textarea");
    for (let input of inputs) {
        VirtualKeyboard.addKeyboardEvents(input);
    }
    const config = { childList: true, subtree: true };
    const observer = new MutationObserver((mutationsList, observer)=>{
        mutationsList.filter((m)=>{return m.addedNodes!=null}).forEach((m)=>{
            if (!m.addedNodes) return;
            for (let node of m.addedNodes) {
                if (node.querySelectorAll) {
                    const inputs = node.querySelectorAll("input,textarea");
                    for (let input of inputs) {
                        VirtualKeyboard.addKeyboardEvents(input);
                    }
                } else {
                    VirtualKeyboard.addKeyboardEvents(node);
                }
            }
        });
    });
    observer.observe(document.body, config);
}
/*
window.addEventListener("load", ()=>{
    VirtualKeyboard.initKeyboard();
    window.onkeydown = (e)=>{console.log(e)}

});
*/