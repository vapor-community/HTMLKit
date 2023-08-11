 (function() {
     
     var Navigation = function (element) {
         
         this.element = element;
         this.links = element.getElementsByClassName('link');
         
         if (this.element.classList.contains('style:menu')) {
             this.styleMenu();
         }
     };
     
     Navigation.prototype.styleMenu = function () {
        
         let currentLocation = location.pathname.split('/')[1];
         
         for (let link of this.links) {
             
             var linkReference = link.pathname.split('/')[1];
             
             if (linkReference === currentLocation) {
                 this.toggleState(link);
             }
         }
     };

     Navigation.prototype.toggleState = function (target) {
         target.classList.add('state:active');
     };
     
     var navigation = document.getElementsByClassName('navigation');
     
     if (navigation.length > 0) {
         
         for (var i = 0; i < navigation.length; i++) {
             
             (function(i) {
                 new Navigation(navigation[i]);
             })(i);
         }
     }
 }());

