var $ = (function () {

    'use strict';

    var constructor = function (selector) {
        this.elems = document.querySelectorAll(selector);
    };
    
    /**
     * Peforms when the pointer enters the target area.
     */
    constructor.prototype.onHover = function (callback) {
        
        this.elems[0].addEventListener("mouseenter", callback);
    };
    
    /**
     * Peforms when the pointer leaves the target area.
     */
    constructor.prototype.onLeave = function (callback) {
        
        this.elems[0].addEventListener("mouseleave", callback);
    };
    
    /**
     * Performs when the target value changes.
     */
    constructor.prototype.onChange = function (callback) {
        
        this.elems[0].addEventListener("change", callback);
    };
    
    /**
     * Performs when the target is clicked.
     */
    constructor.prototype.onClick = function (callback) {
        
        this.elems[0].addEventListener("click", callback);
    };
    
    /**
     * Performs when the target is touched.
     */
    constructor.prototype.onTapGesture = function (callback) {
        
        this.elems[0].addEventListener("touchend", callback);
    };
    
    /**
     * Performs when the target is touched.
     */
    constructor.prototype.onLongPressGesture = function (callback) {
        
        this.elems[0].addEventListener("touchstart", callback);
    };
    
    /**
     * Performs when the target is dragged.
     */
    constructor.prototype.onDrag = function (callback) {
        
        this.elems[0].addEventListener("drag", callback);
    };
    
    /**
     * Performs when the target is dropped.
     */
    constructor.prototype.onDrop = function (callback) {
        
        this.elems[0].addEventListener("drop", callback);
    };
    
    /**
     * Performs when the target is focused.
     */
    constructor.prototype.onFocus = function (callback) {
        
        this.elems[0].addEventListener("focus", callback);
    };
    
    /**
     * Performs when the target is submitted.
     */
    constructor.prototype.onSubmit = function (callback) {

        this.elems[0].addEventListener("submit", callback);
    };
    
    /**
     * Shows the target.
     */
    constructor.prototype.show = function() {
        
        const elements = document.getElementsByClassName("state:visible");
        
        for (let element of elements){
            element.classList.remove("state:visible")
        }
        
        this.elems[0].classList.add("state:visible")
    };
    
    /**
     * Hides the target.
     */
    constructor.prototype.hide = function() {
    
        this.elems[0].classList.add("state:hidden")
    };
    
    /**
     * Animates the target.
     */
    constructor.prototype.animate = function({params}, speed) {
        
        this.elems[0].animate({params}, speed);
    };
    
    /**
     * Opens the dialog.
     */
    constructor.prototype.open = function() {
        
        this.elems[0].showModal()
    };
    
    /**
     * Closes the dialog.
     */
    constructor.prototype.close = function() {
        
        this.elems[0].close()
    };
    
    var instantiate = function (selector) {
        return new constructor(selector);
    };

    return instantiate;

})();

