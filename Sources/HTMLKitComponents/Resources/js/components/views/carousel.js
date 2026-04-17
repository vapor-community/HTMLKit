(function() {

    'use strict';

    /**
     * Initiates the carousel object.
     *
     * @constructor
     *
     * @param element
     */
    const Carousel = function (element) {
        
        this.element = element;
        this.slides = element.getElementsByClassName('carousel-content')[0];
        this.indication = element.getElementsByClassName('carousel-indication')[0];
        
        this.toggleState(0);
        
        this.autoPlay(1);
        
        this.initiateListener();
    };

    /**
     * Initiates the event listener.
     */
    Carousel.prototype.initiateListener = function () {
        
        const self= this;
        
        for (const indicator of this.indication.children) {
            
            indicator.addEventListener('click', function (event) {
                
                event.preventDefault();
                
                self.slideTo(self.getIndex(event.target.getAttribute('href').replace('#', '')));
                
            });
        }
    };

    /**
     * Starts the autoplay.
     */
    Carousel.prototype.autoPlay = function (position) {
        
        const self= this;
        
        setInterval(function () {
            
            if (position < self.slides.children.length) {
             
                self.slideTo(position);
             
                position += 1;
                
            } else {
                position = 0;
            }
            
        }, 7000);
    };

    /**
     * Retrieves the index of the selection.
     */
    Carousel.prototype.getIndex = function (name) {
        
        for (let index= 0; index < this.slides.children.length; index++) {
            
            if (this.slides.children[index].id === name) {
                return index;
            }
        }
    };

    /**
     * Toggles the status.
     */
    Carousel.prototype.toggleState = function (index) {
        
        for (const indicator of this.indication.children) {
            indicator.classList.remove('state:active');
        }
        
        this.indication.children[index].classList.add('state:active');
    };

    /**
     * Scrolls to the selected slide.
     */
    Carousel.prototype.slideTo = function (index) {
        
        const self = this;
        
        this.slides.scrollTo({
            left: (index * this.slides.children[index].offsetWidth), behavior: 'smooth'
        });
        
        self.toggleState(index);
    };
    
    const carousels= document.getElementsByClassName('carousel');

    for (const carousel of carousels) {
        new Carousel(carousel);
    }

}());
