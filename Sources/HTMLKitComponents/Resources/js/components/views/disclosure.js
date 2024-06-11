(function() {

    'use strict';

    /**
     * Initiates the disclosure object.
     */
    const Disclosure = function (element) {

        this.element = element;
        this.head = element.getElementsByClassName('disclosure-head')[0];
        this.body = element.getElementsByClassName('disclosure-body')[0];

        this.initiateListener();
    };

    /**
     * Listens for the click event.
     */
    Disclosure.prototype.initiateListener = function () {

        const self = this;

        this.head.addEventListener('click', function () {
            self.element.classList.toggle('state:open');
        });
    };

    const disclosures = document.getElementsByClassName('disclosure');

    for (const disclosure of disclosures) {
        new Disclosure(disclosure);
    }

}());