 (function() {

     'use strict';

     /**
      * Initiates the navigation object.
      *
      * @constructor
      *
      * @param element
      */
     const Navigation = function (element) {
         
         this.element = element;
         this.links = element.getElementsByClassName('link');
         
         if (this.element.classList.contains('style:menu')) {
             this.styleMenu();
         }
     };

     /**
      * Styles the menu.
      */
     Navigation.prototype.styleMenu = function () {
         
         for (const link of this.links) {
             
             let components= link.pathname.split('/');
             
             let targetLocation;
             
             if (components.length > 2) {
                 targetLocation = components.slice(0, -1).join('/');
                 
             } else {
                 targetLocation = components.join('/');
             }
             
             if (location.pathname.includes(targetLocation)) {
                 this.toggleState(link);
             }
         }
     };

     /**
      * Toggles the current navigation entry.
      */
     Navigation.prototype.toggleState = function (target) {
         target.classList.add('state:active');
     };
     
     const navigations= document.getElementsByClassName('navigation');

     for (const navigation of navigations) {
         new Navigation(navigation);
     }

 }());

