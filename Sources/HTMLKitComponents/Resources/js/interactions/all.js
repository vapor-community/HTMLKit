var $ = (function () {
    
    'use strict';
    
    var Self = function (selector) {
        
        this.elems = document.querySelectorAll(selector);
    };
    
    /*
        Peforms when the pointer enters the target area.
     */
    Self.prototype.onHover = function (callback) {
        
        this.elems[0].addEventListener('mouseenter', callback);
    };
    
    /*
        Peforms when the pointer leaves the target area.
     */
    Self.prototype.onLeave = function (callback) {
        
        this.elems[0].addEventListener('mouseleave', callback);
    };
    
    /*
        Performs when the target value changes.
     */
    Self.prototype.onChange = function (callback) {
        
        this.elems[0].addEventListener('change', callback);
    };
    
    /*
        Performs when the target is clicked.
     */
    Self.prototype.onClick = function (callback) {
        
        this.elems[0].addEventListener('click', callback);
    };
    
    /*
        Performs when the target is touched.
     */
    Self.prototype.onTapGesture = function (callback) {
        
        this.elems[0].addEventListener('touchend', callback);
    };
    
    /*
        Performs when the target is touched.
     */
    Self.prototype.onLongPressGesture = function (callback) {
        
        this.elems[0].addEventListener('touchstart', callback);
    };
    
    /*
        Performs when the target is dragged.
     */
    Self.prototype.onDrag = function (callback) {
        
        this.elems[0].addEventListener('drag', callback);
    };
    
    /*
        Performs when the target is dropped.
     */
    Self.prototype.onDrop = function (callback) {
        
        this.elems[0].addEventListener('drop', callback);
    };
    
    /*
        Performs when the target is focused.
     */
    Self.prototype.onFocus = function (callback) {
        
        this.elems[0].addEventListener('focus', callback);
    };
    
    /*
        Performs when the target is submitted.
     */
    Self.prototype.onSubmit = function (callback, validate) {
        
        if (validate) {
            this.elems[0].setAttribute('novalidate', 'novalidate');
        }

        this.elems[0].addEventListener('submit', callback);
    };
    
    /*
        Shows the target.
     */
    Self.prototype.show = function() {
        
        const elements = document.getElementsByClassName('state:visible');
        
        for (let element of elements){
            element.classList.remove('state:visible');
        }
        
        this.elems[0].classList.add('state:visible');
    };
    
    /*
        Hides the target.
     */
    Self.prototype.hide = function() {
    
        this.elems[0].classList.add('state:hidden');
    };
    
    /*
        Animates the target.
     */
    Self.prototype.animate = function({params}, speed) {
        
        this.elems[0].animate({params}, speed);
    };
    
    /*
        Opens the dialog.
     */
    Self.prototype.open = function() {
        
        this.elems[0].showModal();
    };
    
    /*
        Closes the dialog.
     */
    Self.prototype.close = function() {
        
        this.elems[0].close();
    };
    
    /*
        Validates a form.
     */
    Self.prototype.validate = function(validators) {
        
        const form = this.elems[0];
        
        for (let validator of JSON.parse(validators)) {
            
            const element = form.elements[validator.field];
            
            switch (validator.rule) {
                    
                case 'value':
                    
                    if (!element.value) {
                        element.setCustomValidity('The field must have a value.');
                        
                    } else {
                        element.setCustomValidity('');
                    }
                    
                    break;
                    
                case 'email':
                    
                    if (!element.value.includes('@')) {
                        element.setCustomValidity('The field must have a valid email format.');
                        
                    } else {
                        element.setCustomValidity('');
                    }
                    
                    break;
                    
                case 'url':
                    
                    if (!element.value.includes(':')) {
                        element.setCustomValidity('The field must have a valid url format.');
                        
                    } else {
                        element.setCustomValidity('');
                    }
            }
        }
        
        if (!form.checkValidity()) {
            form.reportValidity();
            
        } else {
            form.submit();
        }
    };
    
    var instantiate = function (selector) {
        return new Self(selector);
    };

    return instantiate;

})();

