(function() {

    'use strict';
    
    const Dropdown = function (element) {
        
        this.element = element;
        this.label = element.getElementsByClassName('dropdown-label')[0];
        this.dropdownlist = element.getElementsByClassName('dropdown-content')[0];
        
        this.initiateListener();
    };
 
    /*
        Initiates the listeners
     */
    Dropdown.prototype.initiateListener = function () {
        
        const self = this;
        
        this.label.addEventListener('mousedown', function () {
            self.showDropdownList();
        });
        
        window.addEventListener('click', function (event) {
            
            if (!self.element.contains(event.target)) {
                self.hideDropdownList();
            }
        });
    };
    
    /*
        Shows the dropdown list
     */
    Dropdown.prototype.showDropdownList = function () {
        
        const windowBound = document.body.getBoundingClientRect();
        const elementBound = this.dropdownlist.getBoundingClientRect();
        
        if (windowBound.width < elementBound.right) {
            this.dropdownlist.classList.add('position:right');
        }
        
        if (windowBound.height < elementBound.bottom) {
            this.dropdownlist.classList.add('position:bottom');
        }
        
        this.dropdownlist.classList.add('state:visible');
    };
    
    /*
        Hides the dropdown list
     */
    Dropdown.prototype.hideDropdownList = function () {
        this.dropdownlist.classList.remove('state:visible');
    };
    
    const dropdowns = document.getElementsByClassName('dropdown');

    for (const dropdown of dropdowns) {
        new Dropdown(dropdown);
    }

}());
