import Kitura
class Controller {
    
    let container: Container
    
    required init(container: Container) {
        self.container = container
    }
    
    public func get<T>(type: T.Type, name: String? = nil) -> T? {
        return container.resolve(type: type, name: name)
    }
    
}
