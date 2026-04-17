(function()  {

    'use strict';

    /**
     * Initiates the progress object.
     *
     * @constructor
     *
     * @param element
     */
    const Progress = function (element) {

        this.element = element;
        this.marks = element.getElementsByClassName('mark');

        this.initiateObserver();
    };

    /**
     * Initiates the progress object.
     */
    Progress.prototype.initiateObserver = function () {

        const self= this;

        const observer = new IntersectionObserver(function (entries) {

            entries.forEach(function (entry) {

                if (entry.isIntersecting) {

                    self.width = entry.boundingClientRect.width;
                    self.height = entry.boundingClientRect.height;

                    self.prepareView();
                }
            });
        });

        observer.observe(this.element);
    };

    /**
     * Determines the progress style.
     */
    Progress.prototype.determineType = function () {

        if (this.element.classList.contains('style:linear')) {
            return 'Bar';
        }

        if (this.element.classList.contains('style:circular')) {
            return 'Circle';
        }
    };

    /**
     * Sets the view box for the progress.
     */
    Progress.prototype.setViewBox = function () {
        this.element.setAttribute('viewbox', `0 0 ${this.width} ${this.height}`);
    };

    /**
     * Prepares the progress view.
     */
    Progress.prototype.prepareView = function () {

        this.setViewBox();

        switch (this.determineType()) {
            case 'Bar':

                this.layoutBar();

                break;

            case 'Circle':

                this.layoutCircle();

                break;
        }
    };

    /**
     * Sets the bars.
     */
    Progress.prototype.layoutBar = function () {

        const centerY = this.height / 2;

        let backBar = this.marks[0];
        backBar.setAttribute('d', this.drawRectangle(this.width, centerY));

        let total = Number(backBar.textContent);

        let frontBar = this.marks[1];

        let value = Number(frontBar.textContent);

        const percentage= value * 100 / total;
        const length = Math.ceil(percentage * (this.width / total));

        frontBar.setAttribute('d', this.drawRectangle(length, centerY));
    };

    /**
     * Draws the bars for the linear progress.
     */
    Progress.prototype.drawRectangle = function (length, centerY) {

        let commands = [];
        commands.push(`M 0 ${centerY - 5}`);
        commands.push(`q 0,5 5,5`);
        commands.push(`h ${length - 10}`);
        commands.push(`q 5,0 5,-5`);
        commands.push(`q 0,-5 -5,-5`);
        commands.push(`h -${length - 10}`);
        commands.push(`q -5,0 -5,5`);
        commands.push(`Z`);

        return commands.join(' ');
    };

    /**
     * Draws the circle for the circular progress.
     */
    Progress.prototype.drawCircle = function (percentage, rounded) {

        const radius = Math.min(this.height, this.width) / 2;
        const startX = this.width / 2;
        const startY = 0;
        const degree = Math.min(Math.ceil(percentage * 3.6), 359);

        let longArcFlag = 0;

        if (degree > 180) {
            longArcFlag = 1;
        }

        const outerCircle = this.getCoordinatesByDegree(degree, radius, startX);
        const innerCircle = this.getCoordinatesByDegree(degree, (radius - 10), startX);

        let commands = [];

        if (!rounded) {

            commands.push(`M ${startX},${startY}`);
            commands.push(`A ${radius},${radius} 0 ${longArcFlag},1 ${outerCircle.x},${outerCircle.y}`);
            commands.push(`L ${innerCircle.x},${innerCircle.y}`);
            commands.push(`A ${radius - 10},${radius - 10} 0 ${longArcFlag},0 ${startX},${startY + 10}`);
            commands.push(`L ${startX},${startY}`);

        } else {

            commands.push(`M ${startX},${startY}`);
            commands.push(`A ${radius},${radius} 0 ${longArcFlag},1 ${outerCircle.x},${outerCircle.y}`);
            commands.push(`A ${5} ${5} 0 0,1 ${innerCircle.x},${innerCircle.y}`);
            commands.push(`A ${radius - 10},${radius - 10} 0 ${longArcFlag},0 ${startX},${startY + 10}`);
            commands.push(`A ${5} ${5} 0 0,1 ${startX},${startY}`);
        }

        return commands.join(' ');

    };

    /**
     * Evaluates the end coordinates for the arc.
     */
    Progress.prototype.getCoordinatesByDegree = function (degree, radius, startX) {

        const angle = degree * Math.PI / 180;

        const endX = startX + (radius * (Math.cos(angle + (Math.PI / 2)) * -1));
        const endY = (startX / 2) + (radius * -Math.cos(angle));

        return { x: endX, y: endY };
    };

    /**
     * Sets the circles.
     */
    Progress.prototype.layoutCircle = function () {

        let backCircle = this.marks[0];
        backCircle.setAttribute('d', this.drawCircle(100, false));

        let total = Number(backCircle.textContent);

        let frontCircle = this.marks[1];

        let value = Number(frontCircle.textContent);

        const percentage= value * 100 / total;

        frontCircle.setAttribute('d', this.drawCircle(percentage, true));
    };

    const progresses = document.getElementsByClassName('progress');

    for (const progress of progresses) {
        new Progress(progress);
    }

}());