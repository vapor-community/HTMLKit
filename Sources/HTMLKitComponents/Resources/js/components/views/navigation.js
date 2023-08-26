 (function() {
     
     var Navigation = function (element) {
         
         this.element = element;
         this.links = element.getElementsByClassName('link');
         
         if (this.element.classList.contains('style:menu')) {
             this.styleMenu();
         }
     };
     
     Navigation.prototype.styleMenu = function () {
         
         for (let link of this.links) {
             
             let components = link.pathname.split('/');
             
             var targetLocation;
             
             if (components.length > 2) {
                 targetLocation = components.slice(0, -1).join('/');
                 
             } else {
                 targetLocation = components.join('/');
             }
             
             if (location.pathname.includes(targetLocation)) {
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

