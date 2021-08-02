import Kitura

class PollService {
    
    func createPoll(command: String) -> PollResponse {
        var blocks = getBlocks(command: command)
        

        let question = blocks.remove(at: 0)
        let answers = blocks
        
    

        let response = PollResponse(id: "hello")
        return response
    }
    
    func votePoll() {
        
    }
    
    
    func getBlocks(command: String) -> [String] {
        var blocks = [String]()
        var inBlock = false;
        var currentBlock = "";
        for (_, char) in command.enumerated() {
            if(char == "\"") {
                if(inBlock) {
                    blocks.append(currentBlock)
                    
                }
                inBlock = !inBlock
            } else {
                if(inBlock) {
                    currentBlock += char.description
                }
            }
        }
        return blocks
    }
}
