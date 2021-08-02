class ContainerKey: Hashable, Equatable {
    
    private let type: Any.Type
    private let name: String?
    
    init(type: Any.Type, name: String? = nil) {
        self.type = type
        self.name = name
    }
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(ObjectIdentifier(type))
        hasher.combine(name)
    }
    
    static func == (lhs: ContainerKey, rhs: ContainerKey) -> Bool {
        return lhs.type == rhs.type && lhs.name == rhs.name
    }
    
}
