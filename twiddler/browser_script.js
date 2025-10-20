function delay(ms) {
  return new Promise(resolve => setTimeout(resolve, ms));
}

function tunerRow(n) {
  const row = document.querySelector(`tr.tunertablerow.ui-datatable-selectable[data-ri='${n}']`);
  return row;
}

async function deleteRow(n) {
  const row = tunerRow(n);
  if (!row) {
    console.log("Could not find row", n);
    return;
  }

  const deleteButton = row.querySelector("button.tuner-button[title='Delete']");
  if (deleteButton) {
    console.log("deleting row", n);
    deleteButton.click();

    await delay(400);

    const confirmModal = document.querySelector("div.ui-confirm-dialog");
    const confirmButton = confirmModal.querySelector("button.ui-confirmdialog-yes");
    confirmButton.click();
    await delay(400);
  } else {
    console.log("no delete button found in row", n);
  }
}

async function deleteAll() {
  const rowCount = document.querySelectorAll("tr.tunertablerow.ui-datatable-selectable").length;
  for (var i = rowCount - 1; i >= 0; i--) {
    await deleteRow(i);
  }
}

async function createEmptyChord() {
  const addChordButton = document.querySelector("div[id='tableForm:toolbarsticky'] button[id='tableForm:addRowButton2']");
  addChordButton.click();
  await delay(2000);
}

async function editChord(n) {
  const row = tunerRow(n);
  if (!row) {
    console.log("Could not edit row, not found", n);
    return;
  }

  const editButton = row.querySelector("button.tuner-button[title='Edit']");
  if (!editButton) {
    console.log("No edit button for row", n);
    return;
  }

  editButton.click();
  await delay(800);
}

async function activateButton(name) {
  let activated = 0;
  document.querySelectorAll("div.twiddlerbuttonoff, div.twiddlerbuttontransparentoff").forEach(async function(elem) {
    if (elem.innerText == name) {
      console.log("button was off; turning it on", elem.innerText);
      elem.click();
      activated ++;
      await delay(500);
    }
  });
  if (activated == 0) {
    console.log("No buttons were activated for", name);
  }
}

async function setButtons(buttonList) {
  buttonList.forEach(async function(name) {
    if (name) {
      activateButton(name);
    }
  });
}

async function setKeyboardAction(text) {
  const actionListEditor = document.querySelector("div[id='tableForm:actionlisteditor']");
  if (!actionListEditor) {
    console.log("Could not find the action list editor to set the action");
    return false;
  }

  const addButton = actionListEditor.querySelector("button[id='tableForm:actionlisteditor:addActionButton']");
  if (!addButton) {
    console.log("could not find the '+ add' button in the action-list-editor");
    return false;
  }

  addButton.click();
  await delay(100);

  const menuList = document.querySelector("div[id='tableForm:actionlisteditor:addactiontieredmenusingle'] ul[role='menubar']")
  if (!menuList) {
    console.log("no menu list found while adding an action");
    return false;
  }

  const keyboardMenuEntry = menuList.childNodes[0];
  const keyboardLink = keyboardMenuEntry.querySelector("li a");
  keyboardLink.click();
  await delay(500);

  // it doesn't autoclose when we click it this way, we have to manually close it.
  addButton.click();
  await delay(500);

  const textBox = document.querySelector("div[id='tableForm:actionlisteditor'] textarea");
  if (!textBox) {
    console.log("Could not find text box to put action in");
    return false;
  }

  textBox.value = text;
  await delay(500);

  return true;
}

async function applyEdit() {
  const button = document.querySelector("button[id='tableForm:applybutton']");
  if (!button) {
    console.log("Could not find apply button");
    return;
  }
  button.click();
  await delay(3000);
}

async function createChord(buttons, action) {
  await createEmptyChord();
  await editChord(0);
  await setButtons(buttons);
  await setKeyboardAction(action);
  await applyEdit();
}

function chordToButtons(chord) {
  const chars = chord.split("");
  const labels = ["T", "0", "1", "2", "3", "4"];
  const buttons = chars.map(function(ch, index) {
    if (ch == "-") {
      return null;
    } else {
      return labels[index] + ch;
    }
  });
  return buttons;
}

async function createChords(mapping) {
  for (const chord in mapping) {
    const action = mapping[chord];
    console.log(`Creating the ${action} chord (${chord})`);
    const buttons = chordToButtons(chord);
    await createChord(buttons, action);
  }
}

const mapping = {
  "--R---": "<Backspace>", "--M---": " ", "--L---": "<Tab>",

  // No modifier keys - alphabet + Escape
  "---R--": "i", "---M--": "e", "---L--": "o",
  "----R-": "n", "----M-": "t", "----L-": "r",
  "-----R": "a", "-----M": "h", "-----L": "s",

  "--MR--": "c", "--MM--": "d", "--ML--": "u",
  "--M-R-": "f", "--M-M-": "l", "--M-L-": "w",
  "--M--R": "g", "--M--M": "m", "--M--L": "y",

  "--MRR-": "b", "--MMM-": "p", "--MLL-": "v",
  "--M-RR": "j", "--M-MM": "k", "--M-LL": "x",

  "--MRRR": "z", "--MMMM": "q", "--MLLL": "<Escape>",

  // Numerics
  "--RR--": "1", "--RM--": "4", "--RL--": "7",
  "--R-R-": "2", "--R-M-": "5", "--R-L-": "8",
  "--R--R": "3", "--R--M": "6", "--R--L": "9",

  "--RRR-": "0", "--RRM-": "+", "--RRL-": "-",
  "--RR-R": "=", "--RR-M": "*", "--RR-L": "/",

  "--RLL-": "^", // the other two are overlaps
  "--R-RR": ".", "--R-MM": ",", "--R-LL": "~",

  "--RRRR": "<Enter>", "--RMMM": "$", "--RLLL": "%",

  // Symbols
  "--LR--": "-", "--LM--": "<Enter>", "--LL--": ".",
  "--L-R-": "/", "--L-M-": "!",     "--L-L-": ",",
  "--L--R": "\\", "--L--M": "*",    "--L--L": "'",

  "--LRR-": "~", "--LMM-": "<Escape>", "--LLL-": ";",
  "--L-RR": "&", "--L-MM": "`",      "--L-LL": "\"",

  "--LLR-": "@", "--LLM-": "?", // --LLL- is semicolon, above
  "--LL-R": "%", "--LL-M": "$", "--LL-L": "#",

  "--LRRR": "|", "--LMMM": "=", "--LLLL": "_",

  // Movement
  "4-R---": "<LControl>y</LControl>", "4-M---": "<UpArrow>",      "4-L---": "<PageUp>",
  "4--R--": "<LOption>f</LOption>",   "4--M--": "<RightArrow>",   "4--L--": "<End>",
  "4---R-": "<LOption>b</LOption>",   "4---M-": "<LeftArrow>",    "4---L-": "<Home>",
  "4----R": "<LControl>e</LControl>", "4----M": "<DownArrow>",    "4----L": "<PageDown>",

  "4R----": "<LCommand><Tab></LCommand>", // switch apps
  "4M----": "<LCommand>`</LCommand>",     // switch window in app
  "4L----": "<LControl><Tab></LControl>",       // switch tab
  
  "4-R--R": "<LCommand><LControl><LeftArrow></LControl></LCommand>",      // Rectangle - cycle-left
  "4--RR-": "<LCommand><LControl><UpArrow></LControl></LCommand>",        // Rectangle - shift monitor
  "4-L--L": "<LCommand><LControl><RightArrow></LControl></LCommand>",     // Rectangle - cycle-right
  "4--LL-": "<LCommand><LControl><Enter></LControl></LCommand>",          // Rectangle - full-screen

  // Commands
  "2--R--": "<LControl>d</LControl>",     "2--M--": "<LControl>c</LControl>",     "2--L--": "<LCommand>n</LCommand>",   // Ctrl-D, Ctrl-C, new window
  "2---R-": "<LCommand>l</LCommand>",     "2---M-": "<LCommand>k</LCommand>",     "2---L-": "<LCommand>f</LCommand>",   // url-bar, fuzzy-bar, find
  "2----R": "<LCommand>w</LCommand>",     "2----M": "<LCommand>t</LCommand>",     "2----L": "<LCommand>q</LCommand>",   // close, new tab, quit

  "2-RR--": "<LCommand>c</LCommand>",     "2-RM--": "<LCommand>v</LCommand>",     "2-RL--": "<LCommand>x</LCommand>",   // copy, paste, cut
};

createChords(mapping);
// deleteAll();
// createChord(chordToButtons("--R---"), "<Backspace>");
