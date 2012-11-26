konami = new Konami();
konami.code = function() {
    clippy.load('Clippy', function(agent){
        // do anything with the loaded agent
        agent.show();
    });
}
konami.load();