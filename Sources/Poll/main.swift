import Kitura
import HeliumLogger
import Logging
import LoggerAPI

class App {
    
    var container: Container
    
    init() {
        let router = Router()
        self.container = Container.shared
        setupContainer(router: router)
        setupRoutes()
        
        let logger = HeliumLogger()
        LoggingSystem.bootstrap(logger.makeLogHandler)
        
        Log.debug("Running server")
        Kitura.addHTTPServer(onPort: 1337, with: router)
        Kitura.run()
     
    }
    
    func setupContainer(router: Router) {
        Log.debug("Setting up container")
        container.register(type: PollService.self, service: PollService())
        container.register(type: Router.self, service: router)
    }
    
    func setupRoutes() {
        Log.debug("Setting up routes")
        let routes = Routes()
        routes.setupRoutes(container: container);
        
    }
    
}

let app = App()
