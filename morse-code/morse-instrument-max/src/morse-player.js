import '../../node_modules/tone/build/Tone.js';

export class MorsePlayer {
    constructor() {
        this.dit = new Tone.Player().toDestination();
        this.dah = new Tone.Player().toDestination();
        this.ditSampler = new Tone.Sampler().toDestination();
        this.dahSampler = new Tone.Sampler().toDestination();

        this.loop = true;
        this.running = false;
        this.sustain = false;

        this.morseString = '';
        this.stringIndex = 0;
        this.index = 0;
        this.morseArr = this.beatifyMorse(this.morseString);
    }

    changeMorseString(morse) {
        this.morseString = morse;
        this.morseArr = this.beatifyMorse(morse);
        this.index = 0;
    }

    playMorse() {
        if (this.index > this.morseArr.length - 1) {
            this.index = 0;
            this.stringIndex = 0;

            if (!this.loop) {
                this.running = false;
                $('.playing-icon').hide();
                return;
            }
        }

        let char = this.morseArr[this.index];
        if (char === '.') {
            let pitch = `${$('#ditPitch').val()}4`;
            this.playDitPitched(pitch);
        } else if (char === '-') {
            let pitch = `${$('#dahPitch').val()}4`;
            this.playDahPitched(pitch);
        }

        this.index++;
    }

    beatifyMorse(morse) {
        let result = [];
        for (const c of morse) {
            if (c == '.') {
                result.push('.');
            } else if (c == '-') {
                result.push('-');
                result.push('');
            } else if (c == '/') {
                result.push('');
                result.push('');
                result.push('');
            } else if (c == ' ') {
                result.push('');
                result.push('');
            }
        }

        return result;
    }

    async setDit(file) {
        const url = URL.createObjectURL(file);
        await this.dit.load(url);
        this.ditSampler.add("C4", url);
    }

    async setDah(file) {
        const url = URL.createObjectURL(file);
        await this.dah.load(url);
        this.dahSampler.add("C4", url);
    }

    playDit() {
        setTimeout(() => {
            this.dit.start();
        }, 10);
    }

    playDah() {
        setTimeout(() => {
            this.dah.start();
        }, 10);
    }

    playDitPitched(pitch) {
        if(this.sustain) {
            this.ditSampler.triggerAttackRelease(pitch, "1n");
        } else {
            this.ditSampler.triggerAttackRelease(pitch, "4n");
        }
    }

    playDahPitched(pitch) {
        if(this.sustain) {
            this.dahSampler.triggerAttackRelease(pitch, "1n")
        } else {
            this.dahSampler.triggerAttackRelease(pitch, "4n")
        }
    }

    encode(text) {
        let map = {
            'A': '.-', 'B': '-...', 'C': '-.-.', 'D': '-..', 'E': '.', 'F': '..-.',
            'G': '--.', 'H': '....', 'I': '..', 'J': '.---', 'K': '-.-', 'L': '.-..',
            'M': '--', 'N': '-.', 'O': '---', 'P': '.--.', 'Q': '--.-', 'R': '.-.',
            'S': '...', 'T': '-', 'U': '..-', 'V': '...-', 'W': '.--', 'X': '-..-',
            'Y': '-.--', 'Z': '--..', '1': '.----', '2': '..---', '3': '...--',
            '4': '....-', '5': '.....', '6': '-....', '7': '--...', '8': '---..',
            '9': '----.', '0': '-----', ' ': '/'
        }

        text = text.replace(/[^a-zA-Z0-9 ]/g, "");
        text = text.toUpperCase().split('').map(char => map[char] || char).join(' ');
        text += " ";
        return text;
    }

    decode(morse) {
        return morse.split(' ').map(code => Object.keys(map).find(key => map[key] === code) || code).join(' ');
    }
}
