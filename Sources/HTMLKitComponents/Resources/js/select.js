(function() {
    
    var Selectfield = function (element) {
        
        this.element = element;
        this.textfield = element.getElementsByClassName('selectfield-textfield')[0];
        this.optionlist = element.getElementsByClassName('selectfield-optionlist')[0];
        
        this.initiateListener();
    };
    
    /*
        Initiates the listeners
     */
    Selectfield.prototype.initiateListener = function () {
        
        var self = this;
        
        this.textfield.addEventListener('focus', function () {
            self.showOptionList();
        });
        
        this.textfield.addEventListener('focusout', function () {
            self.hideOptionList();
        });
        
        this.optionlist.addEventListener('mousedown', function (event) {
            
            event.preventDefault();
            
            if (event.target.tagName == 'LI') {
                
                self.setInputValue(event.target.innerHTML);
                
                self.hideOptionList();
            }
        });
    };
    
    /*
        Sets the value for the textfield
     */
    Selectfield.prototype.setInputValue = function (value) {
        
        this.textfield.value = value
    };
    
    /*
        Shows the option list
     */
    Selectfield.prototype.showOptionList = function () {
        
        this.optionlist.classList.add('state:visible')
    };
    
    /*
     Hides the option list
     */
    Selectfield.prototype.hideOptionList = function () {
        
        this.optionlist.classList.remove('state:visible')
    };
    
    var selectfield = document.getElementsByClassName('selectfield');
    
    if(selectfield.length > 0) {
        
        for(var i = 0; i < selectfield.length; i++) {
            
            (function(i) {
                new Selectfield(selectfield[i]);
            })(i);
        }
    }
}());
