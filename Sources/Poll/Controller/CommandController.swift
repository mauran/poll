import Kitura
import LoggerAPI

class CommandController: Controller, Routeable {
    
    
    func command(request: RouterRequest, response: RouterResponse, next: @escaping () -> Void) throws {
        
        Log.debug("Hello world")
        
        guard let command = request.parsedURL.queryParameters["text"] else {
            try response.status(.conflict).send("No text recieved").end()
            return
        }
        
        guard command.numberOfOccurrencesOf(string: "\"") % 2 == 0 else {
            try response.status(.conflict).send("Amount of quotes seems off?").end()
            return
        }
        
        guard let cleanedCommand = command.removingPercentEncoding else {
            try response.status(.conflict).send("Could not decode response").end()
            return
        }

        
        
        let pollService = get(type: PollService.self)!
        
        pollService.createPoll(command: cleanedCommand)

    }
 
    func action(request: RouterRequest, response: RouterResponse, next: @escaping () -> Void) throws {
        try response.status(.OK).send("Recieved action").end()
    }
    
    
    func setupRoutes(router: Router) {
        router.post("/command", handler: command)
        router.post("/action", handler: action)
    }
    
}
