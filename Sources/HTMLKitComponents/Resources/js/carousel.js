var Carousel = (function () {
    
    'use strict';
    
    function Self(element) {
        
        this.element = document.getElementsByClassName('carousel-content')[0];
        this.slides = document.getElementsByClassName('slide');
        this.indicators = document.getElementsByClassName('indicator');
        
        this.toggleState(0);
        
        this.initiateListener();
    }
    
    Self.prototype.initiateListener = function () {
        
        var self = this;
        
        for (let indicator of this.indicators) {
            
            indicator.addEventListener('click', function (event) {
                
                event.preventDefault();
                
                self.slideTo(self.getPosition(event.target.getAttribute('href')));
            });
        }
    };
    
    Self.prototype.getPosition = function (name) {

        for(var position = 0; position < this.slides.length; position++) {
            
            if (this.slides[position].id == name) {
                return position;
            }
        }
    };
    
    Self.prototype.toggleState = function (position) {
        
        for(let indicator of this.indicators) {
            indicator.classList.remove('state:active');
        }
        
        this.indicators[position].classList.add('state:active');
    };
    
    Self.prototype.slideTo = function (position) {
        
        var self = this;
        
        this.element.scrollTo({
            left: (position * this.slides[position].offsetWidth)
        });
        
        self.toggleState(position);
    };
    
    return Self;
    
})();
