import ceylon.html {
    CharacterData,
    FlowCategory,
    Node
}

shared alias Element => CharacterData|<Node&FlowCategory>;
