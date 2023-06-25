 (function() {
     
     var Navigation = function (element) {
         
         this.element = element;
         this.links = element.getElementsByClassName('link');
         
         this.checkLocation();
     };
     
     Navigation.prototype.checkLocation = function () {
         
         var self = this;
         
         var currentLocation = location.pathname;
         
         for(let link of this.links) {
             
             if(link.getAttribute('href') === currentLocation) {
                 self.toggleState(link);
             }
         }
     };

     Navigation.prototype.toggleState = function (target) {
         target.classList.add('state:active');
     };
     
     var navigation = document.getElementsByClassName('navigation');
     
     if(navigation.length > 0) {
         
         for(var i = 0; i < navigation.length; i++) {
             
             (function(i) {
                 new Navigation(navigation[i]);
             })(i);
         }
     }
 }());

