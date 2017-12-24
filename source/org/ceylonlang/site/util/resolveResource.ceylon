import ceylon.language.meta {
    classDeclaration
}

// TODO: It would be nice to obtain the typeName from the metamodel.
// This wasn't working, so just pass it.

shared Type resolveResource<Type>(String? resourceName, String typeName, Type defaultResource) {
    if (exists resourceName) {
        value typeClass = classDeclaration(defaultResource);
        value resourceDeclaration = typeClass.containingPackage.getValue(resourceName + typeName);
        
        if (exists resourceDeclaration, resourceDeclaration.objectValue) {
            value resource = resourceDeclaration.get();
            
            if (is Type resource) {
                return resource;
            }
        }
        
        print("Could not resolve ``typeName`` \"``resourceName``\"");
    }
    
    return defaultResource;
}
