(function() {
    
    var Carousel = function (element) {
        
        this.element = element;
        this.slides = element.getElementsByClassName('carousel-content')[0];
        this.indication = element.getElementsByClassName('carousel-indication')[0];
        
        this.toggleState(0);
        
        this.autoPlay(1);
        
        this.initiateListener();
    };
    
    Carousel.prototype.initiateListener = function () {
        
        var self = this;
        
        for (var indicator of this.indication.children) {
            
            indicator.addEventListener('click', function (event) {
                
                event.preventDefault();
                
                self.slideTo(self.getPosition(event.target.getAttribute('href').replace('#', '')));
                
            });
        }
    };
    
    Carousel.prototype.autoPlay = function (position) {
        
        var self = this;
        
        setInterval(function () {
            
            if (position < self.slides.children.length) {
             
                self.slideTo(position);
             
                position += 1;
                
            } else {
                position = 0;
            }
        }, 7000);
    };
    
    Carousel.prototype.getPosition = function (name) {
        
        for(var position = 0; position < this.slides.children.length; position++) {
            
            if (this.slides.children[position].id == name) {
                return position;
            }
        }
    };
    
    Carousel.prototype.toggleState = function (position) {
        
        for(let indicator of this.indication.children) {
            indicator.classList.remove('state:active');
        }
        
        this.indication.children[position].classList.add('state:active');
    };
    
    Carousel.prototype.slideTo = function (position) {
        
        var self = this;
        
        this.slides.scrollTo({
            left: (position * this.slides.children[position].offsetWidth), behavior: 'smooth'
        });
        
        self.toggleState(position);
    };
    
    var carousel = document.getElementsByClassName('carousel');
    
    if(carousel.length > 0) {
        
        for(var i = 0; i < carousel.length; i++) {
            
            (function(i) {
                new Carousel(carousel[i]);
            })(i);
        }
    }
    
}());
