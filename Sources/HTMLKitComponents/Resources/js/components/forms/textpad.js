(function() {
    
    var Textpad = function (element) {
        
        this.element = element;
        this.content = element.getElementsByClassName('textpad-content')[0];
        this.toolbar = element.getElementsByClassName('textpad-toolbar')[0];
        
        this.initiateListener();
    };
    
    Textpad.prototype.initiateListener = function () {
        
        var self = this;
        
        for (let tool of this.toolbar.children) {
            
            tool.addEventListener('click', function (event) {
                
                event.preventDefault();
                
                var replacement = '';
                
                var selection = self.getSelection();
                
                if (tool.classList.contains('command:bold')) {
                    replacement = '<b>' + selection + '</b>';
                }
                
                if (tool.classList.contains('command:italic')) {
                    replacement = '<i>' + selection + '</i>';
                }
                
                if (tool.classList.contains('command:underline')) {
                    replacement = '<u>' + selection + '</u>';
                }
                
                if (tool.classList.contains('command:strikethrough')) {
                    replacement = '<s>' + selection + '</s>';
                }
                
                self.content.setRangeText(replacement, self.content.selectionStart, self.content.selectionEnd);
            });
        }
    };
    
    Textpad.prototype.getSelection = function () {
        
        return this.content.value.substring(this.content.selectionStart, this.content.selectionEnd);
    };

    var textpad = document.getElementsByClassName('textpad');
    
    if(textpad.length > 0) {
        
        for(var i = 0; i < textpad.length; i++) {
            
            (function(i) {
                new Textpad(textpad[i]);
            })(i);
        }
    }
}());
