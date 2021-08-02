extension Int {
    
    func toSlackEmojiString() -> String {
        let emojis = [
            0: ":zero",
            1: ":one:",
            2: ":two",
            3: ":three:",
            4: ":four:",
            5: ":five:",
            6: ":six",
            7: ":seven:",
            8: ":eigth:",
            9: ":nine:",
        ]
        
        var result = "";
        for digit in self.createDigitArray() {
            result += emojis[digit]!
        }
        return result
    }

    func createDigitArray() -> [Int] {
        if self < 10 {
            return [self]
        } else {
            return (self / 10).createDigitArray() + [self % 10]
        }
    }
    
}
