(function() {
    
    var Dropdown = function (element) {
        
        this.element = element;
        this.label = element.getElementsByClassName('dropdown-label')[0];
        this.dropdownlist = element.getElementsByClassName('dropdown-content')[0];
        
        this.initiateListener();
    };
 
    /*
        Initiates the listeners
     */
    Dropdown.prototype.initiateListener = function () {
        
        var self = this;
        
        this.label.addEventListener('mousedown', function (event) {
            self.showDropdownList();
        });
        
        window.addEventListener('click', function (event) {
            
            if(!event.target.matches('.dropdown-label')) {
                 self.hideDropdownList();
            }
        });
    };
    
    /*
        Shows the dropdown list
     */
    Dropdown.prototype.showDropdownList = function () {
        this.dropdownlist.classList.add('state:visible');
    };
    
    /*
        Hides the dropdown list
     */
    Dropdown.prototype.hideDropdownList = function () {
        this.dropdownlist.classList.remove('state:visible');
    };
    
    var dropdown = document.getElementsByClassName('dropdown');
    
    if(dropdown.length > 0) {
        
        for(var i = 0; i < dropdown.length; i++) {
            
            (function(i) {
                new Dropdown(dropdown[i]);
            })(i);
        }
    }
}());
