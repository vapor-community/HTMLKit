(function()  {

    'use strict';

    /**
     * Initiates the alert object.
     */
    const Alert = function (element, position) {

        this.element = element;

        this.initiateObserver();
        this.initiateListener();
    };

    /**
     * Initiates the mutation observer.
     */
    Alert.prototype.initiateObserver = function () {

        const self = this;

        const observer = new MutationObserver( function (records) {

            records.forEach(function (record) {

                if (self.element.classList.contains('state:visible')) {

                    self.repositionAlert();

                    self.setTimeout();
                }
            });
        });

        observer.observe(this.element, {attributes: true, attributeFilter: ['class']});
    };

    /**
     * Initiates the event listener.
     */
    Alert.prototype.initiateListener = function () {

        const self = this;

        this.element.addEventListener('click', function (event) {

            event.preventDefault();

            self.dismissAlert();
        });
    };

    /**
     * Repositions the alert, along the other visible alerts.
     */
    Alert.prototype.repositionAlert = function () {

        const count = this.countAlerts();

        if (count > 1) {
            this.element.style.bottom = `${(count - 1) * (this.element.offsetHeight + 16) + 16}px`;

        } else {
            this.element.style.bottom = '1rem';
        }
    };

    /**
     * Sets an interval to dismiss the alert.
     */
    Alert.prototype.setTimeout = function () {

        const self = this;

        setTimeout( function () {
            self.dismissAlert()
        }, 3000);
    };

    /**
     * Counts the visible alerts.
     */
    Alert.prototype.countAlerts = function () {

        let count = 0;

        for (const alert of alerts) {

            if (alert.classList.contains('state:visible')) {
                count = count + 1;
            }
        }

        return count;
    };

    /**
     * Dismisses the alert.
     */
    Alert.prototype.dismissAlert = function () {
        this.element.classList.remove('state:visible');
    };

    const alerts = document.getElementsByClassName('alert');

    for (const alert of alerts) {
        new Alert(alert);
    }

}());
